const express = require('express');
const cors = require('cors');
const helmet = require('helmet');
const compression = require('compression');
const morgan = require('morgan');
const path = require('path');
const dotenv = require('dotenv');

// Load environment variables
dotenv.config();

// Import database models
const db = require('./models');

// Create Express app
const app = express();
const PORT = process.env.PORT || 5000;

// Database connection and sync
const connectDatabase = async () => {
  try {
    await db.sequelize.authenticate();
    console.log('Database connection established successfully');
    
    // Sync all models with database
    if (process.env.NODE_ENV === 'development') {
      // Set force: true to drop and recreate tables (be careful in production!)
      // await db.sequelize.sync({ force: true });
      await db.sequelize.sync();
      console.log('Database synced successfully');
    }
  } catch (error) {
    console.error('Unable to connect to the database:', error.message);
    process.exit(1);
  }
};

// Initialize database connection
connectDatabase();

// CORS configuration
const corsOptions = {
  origin: process.env.NODE_ENV === 'production' 
    ? process.env.CLIENT_URL 
    : 'http://localhost:3000',
  methods: ['GET', 'POST', 'PUT', 'DELETE', 'PATCH'],
  allowedHeaders: ['Content-Type', 'Authorization'],
  credentials: true,
  optionsSuccessStatus: 200
};

// Middleware
app.use(cors(corsOptions));
app.use(helmet()); // Security headers
app.use(compression()); // Compress responses
app.use(morgan(process.env.NODE_ENV === 'development' ? 'dev' : 'combined')); // Request logging
app.use(express.json({ limit: '10mb' })); // Parse JSON request body
app.use(express.urlencoded({ extended: true, limit: '10mb' })); // Parse URL-encoded request body

// Static file serving
app.use('/uploads', express.static(path.join(__dirname, '../uploads')));

// API routes
app.use('/api', require('./routes'));

// Base route
app.get('/', (req, res) => {
  res.json({
    message: 'Welcome to Family Network API',
    documentation: '/api/docs',
    version: '1.0.0'
  });
});

// 404 handling
app.use((req, res, next) => {
  const error = new Error(`Route ${req.originalUrl} not found`);
  error.status = 404;
  next(error);
});

// Global error handler
app.use((err, req, res, next) => {
  const statusCode = err.status || 500;
  
  // Log error for server-side debugging
  if (statusCode === 500) {
    console.error('Server Error:', err);
  }
  
  res.status(statusCode).json({
    success: false,
    status: statusCode,
    message: err.message,
    stack: process.env.NODE_ENV === 'development' ? err.stack : undefined
  });
});

// Start server
const server = app.listen(PORT, () => {
  console.log(`Server running on port ${PORT} in ${process.env.NODE_ENV} mode`);
  console.log(`API available at: http://localhost:${PORT}/api`);
});

// Handle unhandled promise rejections
process.on('unhandledRejection', (err) => {
  console.error('UNHANDLED REJECTION! 💥 Shutting down...');
  console.error(err.name, err.message);
  
  // Close server & exit process
  server.close(() => {
    process.exit(1);
  });
});

// Handle uncaught exceptions
process.on('uncaughtException', (err) => {
  console.error('UNCAUGHT EXCEPTION! 💥 Shutting down...');
  console.error(err.name, err.message);
  process.exit(1);
});

module.exports = { app, db }; // Export for testing purposes

