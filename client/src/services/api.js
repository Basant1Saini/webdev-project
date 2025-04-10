import axios from 'axios';

  delete: (url, config = {}) => instance.delete(url, config),
  patch: (url, data = {}, config = {}) => instance.patch(url, data, config),
};

export default api;

import axios from 'axios';

// Create an Axios instance with defaults
const instance = axios.create({
  baseURL: process.env.REACT_APP_API_URL || 'http://localhost:5000/api',
  headers: {
    'Content-Type': 'application/json',
  },
});

// Add request interceptor to include auth token in all requests
instance.interceptors.request.use(
  (config) => {
    const token = localStorage.getItem('token');
    if (token) {
      config.headers.Authorization = `Bearer ${token}`;
    }
    return config;
  },
  (error) => {
    return Promise.reject(error);
  }
);

// Add response interceptor to handle common errors
instance.interceptors.response.use(
  (response) => {
    // Extract the data property from the axios response
    return response.data;
  },
  (error) => {
    // Handle token expiration
    if (error.response && error.response.status === 401) {
      localStorage.removeItem('token');
      // Optionally redirect to login
      // window.location.href = '/login';
    }
    return Promise.reject(error);
  }
);

// API wrapper
export const api = {
  get: (url, config = {}) => instance.get(url, config),
  post: (url, data = {}, config = {}) => instance.post(url, data, config),
  put: (url, data = {}, config = {}) => instance.put(url, data, config),
  delete: (url, config = {}) => instance.delete(url, config),
  patch: (url, data = {}, config = {}) => instance.patch(url, data, config),
};

export default api;

