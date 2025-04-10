const express = require('express');
const cors = require('cors');
const helmet = require('helmet');
const compression = require('compression');
const morgan = require('morgan');
const path = require('path');
const { Sequelize } = require('sequelize');
const dotenv = require('dotenv');

// Load environment variables
dotenv.config();

// Create Express app
const app = express();
const PORT = process.env.PORT || 5000;

// Initialize Sequelize with SQL database connection
const sequelize = new Sequelize(
  process.env.DB_NAME,
  process.env.DB_USER,
  process.env.DB_PASSWORD,
  {
    host: process.env.DB_HOST,
    dialect: process.env.DB_DIALECT || 'postgres', // mysql, postgres, sqlite, etc.
    port: process.env.DB_PORT || 5432,
    logging: process.env.NODE_ENV === 'development' ? console.log : false,
    pool: {
      max: 5,
      min: 0,
      acquire: 30000,
      idle: 10000
    }
  }
);

// Test database connection
const connectToDatabase = async () => {
  try {
    await sequelize.authenticate();
    console.log('Database connection has been established successfully.');
    
    // Sync models with database
    if (process.env.NODE_ENV === 'development') {
      // In development, you might want to sync models with { force: true } to recreate tables
      // await sequelize.sync({ force: true });
      await sequelize.sync();
      console.log('Database models synchronized');
    }
  } catch (error) {
    console.error('Unable to connect to the database:', error);
    process.exit(1);
  }
};

connectToDatabase();

// Middleware
app.use(cors());
app.use(helmet());
app.use(compression());
app.use(morgan('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// Routes
app.get('/', (req, res) => {
  res.json({ message: 'Welcome to Family Network API' });
});

// Import API routes (to be created later)
// const authRoutes = require('./routes/auth.routes');
// const userRoutes = require('./routes/user.routes');
// const familyRoutes = require('./routes/family.routes');
// const socialRoutes = require('./routes/social.routes');
// const mediaRoutes = require('./routes/media.routes');

// Use API routes
// app.use('/api/auth', authRoutes);
// app.use('/api/users', userRoutes);
// app.use('/api/family', familyRoutes);
// app.use('/api/social', socialRoutes);
// app.use('/api/media', mediaRoutes);

// Error handling middleware
app.use((req, res, next) => {
  const error = new Error('Not Found');
  error.status = 404;
  next(error);
});

app.use((err, req, res, next) => {
  const statusCode = err.status || 500;
  res.status(statusCode);
  res.json({
    error: {
      message: err.message,
      status: statusCode,
      stack: process.env.NODE_ENV === 'development' ? err.stack : undefined,
    },
  });
});

// Start server
app.listen(PORT, () => {
  console.log(`Server running on port ${PORT} in ${process.env.NODE_ENV} mode`);
});

module.exports = { app, sequelize }; // Export for testing purposes

