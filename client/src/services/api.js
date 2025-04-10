import axios from 'axios';

// Create an Axios instance with defaults
const instance = axios.create({
  baseURL: process.env.REACT_APP_API_URL || 'http://localhost:5000/api',
  headers: {
    'Content-Type': 'application/json',
  },
  timeout: 10000, // 10 seconds timeout
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
    // Handle token expiration or authentication errors
    if (error.response) {
      const { status, data } = error.response;
      
      if (status === 401) {
        // Unauthorized - Token expired or invalid
        localStorage.removeItem('token');
        
        // Redirect to login if not already on login page
        if (window.location.pathname !== '/login') {
          window.location.href = '/login';
        }
      }
      
      // Enhance error object with response data for better error handling
      error.message = data?.message || error.message;
    } else if (error.request) {
      // Request was made but no response received (network error)
      error.message = 'Network error. Please check your connection.';
    }
    
    return Promise.reject(error);
  }
);

// API wrapper
export const api = {
  // Auth endpoints
  auth: {
    login: (credentials) => instance.post('/auth/login', credentials),
    register: (userData) => instance.post('/auth/register', userData),
    logout: () => instance.post('/auth/logout'),
    getCurrentUser: () => instance.get('/auth/me'),
  },
  
  // User endpoints
  users: {
    get: (id) => instance.get(`/users/${id}`),
    update: (id, data) => instance.put(`/users/${id}`, data),
    delete: (id) => instance.delete(`/users/${id}`),
    getAll: (params) => instance.get('/users', { params }),
  },
  
  // Family endpoints
  family: {
    getTree: () => instance.get('/family/tree'),
    addMember: (data) => instance.post('/family/members', data),
    updateMember: (id, data) => instance.put(`/family/members/${id}`, data),
    deleteMember: (id) => instance.delete(`/family/members/${id}`),
  },
  
  // Generic request methods
  get: (url, config = {}) => instance.get(url, config),
  post: (url, data = {}, config = {}) => instance.post(url, data, config),
  put: (url, data = {}, config = {}) => instance.put(url, data, config),
  delete: (url, config = {}) => instance.delete(url, config),
  patch: (url, data = {}, config = {}) => instance.patch(url, data, config),
};

export default api;

