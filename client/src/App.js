import React, { useEffect } from 'react';
import { Routes, Route, Navigate } from 'react-router-dom';
import { useSelector, useDispatch } from 'react-redux';
import { checkAuth } from './features/auth/authSlice';
import Navbar from './components/layout/Navbar';

// Import pages
import LoginPage from './pages/LoginPage';
import RegisterPage from './pages/RegisterPage';

// Placeholder components until real ones are created
const HomePage = () => <div>Home Page</div>;
const ProfilePage = () => <div>Profile Page</div>;
const FamilyTreePage = () => <div>Family Tree Page</div>;
const NotFoundPage = () => <div>404 - Not Found</div>;

// Protected route component
const ProtectedRoute = ({ children }) => {
  const { isAuthenticated, loading } = useSelector(state => state.auth);
  
  if (loading) {
    return <div>Loading...</div>;
  }
  
  if (!isAuthenticated) {
    return <Navigate to="/login" replace />;
  }
  
  return children;
};

function App() {
  const dispatch = useDispatch();
  
  // Check if user is authenticated on app startup
  useEffect(() => {
    dispatch(checkAuth());
  }, [dispatch]);
  
  return (
    <div className="app">
      <Navbar />
      <Routes>
        <Route path="/" element={<HomePage />} />
        <Route path="/login" element={<LoginPage />} />
        <Route path="/register" element={<RegisterPage />} />
        
        {/* Protected routes */}
        <Route 
          path="/profile" 
          element={
            <ProtectedRoute>
              <ProfilePage />
            </ProtectedRoute>
          } 
        />
        <Route 
          path="/family-tree" 
          element={
            <ProtectedRoute>
              <FamilyTreePage />
            </ProtectedRoute>
          } 
        />
        
        {/* Not found page */}
        <Route path="*" element={<NotFoundPage />} />
      </Routes>
    </div>
  );
}

export default App;

import React, { useEffect } from 'react';
import { Routes, Route, Navigate } from 'react-router-dom';
import { useSelector, useDispatch } from 'react-redux';
import { checkAuth } from './features/auth/authSlice';
import Navbar from './components/layout/Navbar';

// Import pages (to be created later)
// import HomePage from './pages/HomePage';
// import LoginPage from './pages/LoginPage';
// import RegisterPage from './pages/RegisterPage';
// import ProfilePage from './pages/ProfilePage';
// import FamilyTreePage from './pages/FamilyTreePage';
// import NotFoundPage from './pages/NotFoundPage';

// Placeholder components until real ones are created
const HomePage = () => <div>Home Page</div>;
const LoginPage = () => <div>Login Page</div>;
const RegisterPage = () => <div>Register Page</div>;
const ProfilePage = () => <div>Profile Page</div>;
const FamilyTreePage = () => <div>Family Tree Page</div>;
const NotFoundPage = () => <div>404 - Not Found</div>;

// Protected route component
const ProtectedRoute = ({ children }) => {
  const { isAuthenticated, loading } = useSelector(state => state.auth);
  
  if (loading) {
    return <div>Loading...</div>;
  }
  
  if (!isAuthenticated) {
    return <Navigate to="/login" replace />;
  }
  
  return children;
};

function App() {
  const dispatch = useDispatch();
  
  // Check if user is authenticated on app startup
  useEffect(() => {
    dispatch(checkAuth());
  }, [dispatch]);
  
  return (
    <div className="app">
      <Navbar />
      <div className="container">
        <Routes>
          <Route path="/" element={<HomePage />} />
          <Route path="/login" element={<LoginPage />} />
          <Route path="/register" element={<RegisterPage />} />
        
        {/* Protected routes */}
        <Route 
          path="/profile" 
          element={
            <ProtectedRoute>
              <ProfilePage />
            </ProtectedRoute>
          } 
        />
        <Route 
          path="/family-tree" 
          element={
            <ProtectedRoute>
              <FamilyTreePage />
            </ProtectedRoute>
          } 
        />
        
        {/* Not found page */}
        <Route path="*" element={<NotFoundPage />} />
      </Routes>
    </div>
  );
}

export default App;

