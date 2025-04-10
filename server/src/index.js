      stack: process.env.NODE_ENV === 'development' ? err.stack : undefined,
    },
  });
});

// Start server
app.listen(PORT, () => {
  console.log(`Server running on port ${PORT} in ${process.env.NODE_ENV} mode`);
});

module.exports = { app, sequelize }; // Export for testing purposes

