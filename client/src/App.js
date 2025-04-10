import React, { useEffect } from 'react';
import { Routes, Route, Navigate, useLocation } from 'react-router-dom';
import { useSelector, useDispatch } from 'react-redux';
import { checkAuth } from './features/auth/authSlice';
import Navbar from './components/layout/Navbar';

// Import pages
import LoginPage from './pages/LoginPage';
import RegisterPage from './pages/RegisterPage';

// Placeholder components until real ones are created
const HomePage = () => <div className="container mt-4"><h1>Welcome to Family Network</h1><p>A platform to connect with your family members, share memories, and build your family tree.</p></div>;
const ProfilePage = () => <div className="container mt-4"><h1>Profile Page</h1><p>This is your profile page where you can manage your account settings.</p></div>;
const FamilyTreePage = () => <div className="container mt-4"><h1>Family Tree</h1><p>Visualize and manage your family connections here.</p></div>;
const NotFoundPage = () => <div className="container mt-4"><h1>404 - Page Not Found</h1><p>The page you're looking for doesn't exist.</p></div>;

// Protected route component
const ProtectedRoute = ({ children }) => {
  const { isAuthenticated, loading } = useSelector(state => state.auth);
  const location = useLocation();
  
  if (loading) {
    return <div className="container mt-4">Loading...</div>;
  }
  
  if (!isAuthenticated) {
    // Redirect to login with the current location for post-login redirection
    return <Navigate to="/login" state={{ from: location }} replace />;
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
      <main className="app-content">
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
      </main>
      <footer className="app-footer">
        <div className="container text-center py-3">
          <p>&copy; {new Date().getFullYear()} Family Network. All rights reserved.</p>
        </div>
      </footer>
    </div>
  );
}

export default App;

export default App;

