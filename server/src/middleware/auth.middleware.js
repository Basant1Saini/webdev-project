const jwt = require('jsonwebtoken');
const { User } = require('../models');

/**
 * Middleware to protect routes - Verify JWT token and add user to request
 */
exports.protect = async (req, res, next) => {
  try {
    let token;

    // Get token from Authorization header
    if (req.headers.authorization && req.headers.authorization.startsWith('Bearer')) {
      token = req.headers.authorization.split(' ')[1];
    }

    // Check if token exists
    if (!token) {
      return res.status(401).json({ 
        success: false, 
        message: 'Not authorized to access this route' 
      });
    }

    try {
      // Verify token
      const decoded = jwt.verify(token, process.env.JWT_SECRET);

      // Add user to request
      req.user = await User.findByPk(decoded.id, {
        attributes: { exclude: ['password'] }
      });

      // Check if user exists
      if (!req.user) {
        return res.status(401).json({ 
          success: false, 
          message: 'User no longer exists' 
        });
      }

      // Check if user is active
      if (!req.user.isActive) {
        return res.status(401).json({ 
          success: false, 
          message: 'User account is deactivated' 
        });
      }

      next();
    } catch (error) {
      return res.status(401).json({ 
        success: false, 
        message: 'Invalid token or token expired' 
      });
    }
  } catch (error) {
    console.error('Auth middleware error:', error);
    res.status(500).json({ 
      success: false, 
      message: 'Server Error' 
    });
  }
};

/**
 * Middleware to restrict routes to specific user roles
 */
exports.authorize = (...roles) => {
  return (req, res, next) => {
    if (!roles.includes(req.user.role)) {
      return res.status(403).json({ 
        success: false, 
        message: `User role ${req.user.role} is not authorized to access this route` 
      });
    }
    next();
  };
};

const jwt = require('jsonwebtoken');
const { User } = require('../models');

/**
 * Middleware to protect routes that require authentication
 */
exports.protect = async (req, res, next) => {
  try {
    let token;

    // Get token from Authorization header
    if (req.headers.authorization && req.headers.authorization.startsWith('Bearer')) {
      token = req.headers.authorization.split(' ')[1];
    }

    // Check if token exists
    if (!token) {
      return res.status(401).json({ 
        success: false, 
        message: 'Not authorized to access this route'
      });
    }

    try {
      // Verify token
      const decoded = jwt.verify(token, process.env.JWT_SECRET);

      // Add user to request
      req.user = await User.findByPk(decoded.id);

      // Check if user exists
      if (!req.user) {
        return res.status(401).json({ 
          success: false, 
          message: 'User no longer exists'
        });
      }

      // Check if user is active
      if (!req.user.isActive) {
        return res.status(401).json({ 
          success: false, 
          message: 'User account is deactivated'
        });
      }

      next();
    } catch (error) {
      return res.status(401).json({ 
        success: false, 
        message: 'Not authorized to access this route'
      });
    }
  } catch (error) {
    console.error('Auth middleware error:', error);
    res.status(500).json({ 
      success: false, 
      message: 'Server Error'
    });
  }
};

/**
 * Middleware to restrict routes to specific user roles
 */
exports.authorize = (...roles) => {
  return (req, res, next) => {
    if (!roles.includes(req.user.role)) {
      return res.status(403).json({ 
        success: false, 
        message: `User role ${req.user.role} is not authorized to access this route`
      });
    }
    next();
  };
};

