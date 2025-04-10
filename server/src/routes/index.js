const express = require('express');
const router = express.Router();
const authRoutes = require('./auth.routes');

// Mount route files
router.use('/auth', authRoutes);

// Route for future implementations
// router.use('/users', require('./user.routes'));
// router.use('/family', require('./family.routes'));
// router.use('/social', require('./social.routes'));
// router.use('/media', require('./media.routes'));

// API documentation route
router.get('/docs', (req, res) => {
  res.json({
    message: 'API Documentation',
    version: '1.0.0',
    endpoints: {
      auth: {
        register: { method: 'POST', url: '/api/auth/register', access: 'Public' },
        login: { method: 'POST', url: '/api/auth/login', access: 'Public' },
        getMe: { method: 'GET', url: '/api/auth/me', access: 'Private' },
        logout: { method: 'POST', url: '/api/auth/logout', access: 'Private' }
      },
      // Add more endpoint documentation as features are implemented
    }
  });
});

module.exports = router;

const express = require('express');
const router = express.Router();
const authRoutes = require('./auth.routes');

// Mount routes
router.use('/auth', authRoutes);

module.exports = router;

const express = require('express');
const router = express.Router();
const authRoutes = require('./auth.routes');

// API routes
router.use('/auth', authRoutes);

// Add more route groups here as needed
// router.use('/users', userRoutes);
// router.use('/family', familyRoutes);
// router.use('/social', socialRoutes);
// router.use('/media', mediaRoutes);

module.exports = router;

