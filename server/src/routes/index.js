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

