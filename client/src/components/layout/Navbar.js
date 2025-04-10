import React from 'react';
import { Link, useNavigate } from 'react-router-dom';
import { useSelector, useDispatch } from 'react-redux';
import { logout } from '../../features/auth/authSlice';

const Navbar = () => {
  const { isAuthenticated, user, loading } = useSelector(state => state.auth);
  const dispatch = useDispatch();
  const navigate = useNavigate();

  const handleLogout = () => {
    dispatch(logout());
    navigate('/');
  };

  const authLinks = (
    <>
      <li>
        <Link to="/family-tree">Family Tree</Link>
      </li>
      <li>
        <Link to="/profile">Profile</Link>
      </li>
      <li>
        <button onClick={handleLogout} className="nav-link-button">
          Logout
        </button>
      </li>
      {user && <li className="welcome-msg">Welcome, {user.name}</li>}
    </>
  );

  const guestLinks = (
    <>
      <li>
        <Link to="/login">Login</Link>
      </li>
      <li>
        <Link to="/register">Register</Link>
      </li>
    </>
  );

  return (
    <nav className="navbar">
      <div className="navbar-container">
        <Link to="/" className="navbar-logo">
          Family Network
        </Link>
        <ul className="nav-menu">
          <li>
            <Link to="/">Home</Link>
          </li>
          {!loading && (isAuthenticated ? authLinks : guestLinks)}
        </ul>
      </div>
    </nav>
  );
};

export default Navbar;

