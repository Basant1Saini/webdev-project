import { configureStore } from '@reduxjs/toolkit';
import authReducer from '../features/auth/authSlice';

// Configure the Redux store
const store = configureStore({
  reducer: {
    auth: authReducer,
    // Add more reducers here as the application grows
    // Example:
    // posts: postsReducer,
    // users: usersReducer,
    // family: familyReducer,
  },
  middleware: (getDefaultMiddleware) =>
    getDefaultMiddleware({
      serializableCheck: {
        // Ignore specific actions that might contain non-serializable values
        ignoredActions: [
          'auth/login/rejected',
          'auth/register/rejected',
          'auth/checkAuth/rejected'
        ],
      },
    }),
  // Enable Redux DevTools extension in development
  devTools: process.env.NODE_ENV !== 'production',
});

export default store;

import { configureStore } from '@reduxjs/toolkit';
import authReducer from '../features/auth/authSlice';

// Configure the Redux store
const store = configureStore({
  reducer: {
    auth: authReducer,
    // Add more reducers here as the application grows
  },
  // Add middleware if needed
  middleware: (getDefaultMiddleware) =>
    getDefaultMiddleware({
      serializableCheck: {
        // Ignore certain action types or paths in the state
        ignoredActions: ['auth/login/rejected', 'auth/register/rejected', 'auth/checkAuth/rejected'],
      },
    }),
  devTools: process.env.NODE_ENV !== 'production',
});

export default store;

