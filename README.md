# Family Network Project

A comprehensive family social networking application that allows users to create and manage family trees, share events, photos, and memories, and stay connected with family members.

## Project Structure

```
webdev-project/
├── client/                 # Frontend application
│   ├── src/
│   │   ├── features/       # Feature-specific components (auth, family, etc.)
│   │   ├── pages/          # Route components (Login, Register, Profile)
│   │   ├── services/       # API services
│   │   ├── store/          # Redux store configuration
│   │   ├── components/     # Reusable UI components
│   │   ├── hooks/          # Custom React hooks
│   │   ├── utils/          # Utility functions
│   │   └── styles/         # Global styles
│   └── public/             # Static assets and index.html
├── server/                 # Backend application
│   ├── src/
│   │   ├── controllers/    # Route controllers
│   │   ├── models/         # Database models
│   │   ├── routes/         # API routes
│   │   ├── services/       # Business logic
│   │   └── utils/          # Helper functions
│   └── tests/              # Backend tests
├── docker/                 # Docker configuration
└── docs/                   # Documentation
```

## How to Run the Project

### Prerequisites

- Node.js (v16 or higher)
- npm or yarn
- PostgreSQL database

### Installation

#### Backend Setup

```bash
# Navigate to server directory
cd server

# Install dependencies
npm install
```

Create a `.env` file in the server directory with the following variables:

```
NODE_ENV=development
PORT=5000

# SQL Database configuration
DB_DIALECT=postgres
DB_HOST=localhost
DB_PORT=5432
DB_NAME=family_network
DB_USER=postgres
DB_PASSWORD=postgres

# JWT Configuration
JWT_SECRET=your_secure_jwt_secret_key_change_in_production
JWT_EXPIRES_IN=7d
```

#### Frontend Setup

```bash
# Navigate to client directory
cd client

# Install dependencies
npm install
```

### Running the Application

#### Start the Backend Server

```bash
cd server
npm run dev
```

The backend will be available at http://localhost:5000

#### Start the Frontend Development Server

```bash
cd client
npm start
```

The frontend will be available at http://localhost:3000

## Viewing the Project Progress

To check the current state of the project:

1. Start the frontend development server (instructions above)
2. Open http://localhost:3000 in your browser

The React development server will automatically compile your code and refresh the browser when changes are made.

Note: You do not need to directly open any HTML file to view the project. React's development server handles serving the application through the `client/public/index.html` template.

## Available Scripts

### Backend

- `npm start` - Start the server in production mode
- `npm run dev` - Start the server in development mode with hot-reloading
- `npm test` - Run tests
- `npm run lint` - Run linting

### Frontend

- `npm start` - Start the development server
- `npm run build` - Build for production
- `npm test` - Run tests
- `npm run lint` - Run linting

## Features

- **Authentication System**: Secure user registration and login
- **Family Tree Management**: Create and visualize family relationships
- **Event Sharing**: Create and share family events, birthdays, and anniversaries
- **Media Sharing**: Upload and share photos, videos, and documents
- **Social Networking**: Connect with family members, send messages, and stay updated

## API Documentation

The API includes the following main endpoints:

- Authentication endpoints (`/auth/*`)
- User management (`/users/*`)
- Family tree operations (`/family/*`)
- Social networking features (`/social/*`)
- Media management (`/media/*`)

## Technologies Used

- **Frontend**: HTML, CSS, JavaScript
- **Backend**: Express, SQL (PostgreSQL)
- **Authentication**: Session-based or JWT
- **Database**: PostgreSQL/MySQL

## Project Improvement Recommendations

### 1. Check SQL Installation

Before proceeding, verify SQL installation on your macOS device:

```bash
# For PostgreSQL
which psql
psql --version

# For MySQL
which mysql
mysql --version
```

If not installed, you can install using Homebrew:

```bash
# Install PostgreSQL
brew install postgresql
brew services start postgresql

# Or install MySQL
brew install mysql
brew services start mysql
```

### 2. Simplify Frontend with Vanilla Technologies

Replace React with traditional HTML/CSS/JavaScript:

1. Create a structured HTML layout:
   - `/public/index.html` - Main landing page
   - `/public/auth/login.html` - Login page
   - `/public/auth/register.html` - Registration page
   - `/public/profile/index.html` - User profile page
   - `/public/family/tree.html` - Family tree visualization

2. Use a modular CSS approach:
   - `/public/css/main.css` - Global styles
   - `/public/css/auth.css` - Authentication styles
   - `/public/css/profile.css` - Profile styles
   - `/public/css/family.css` - Family components styles

3. Implement JavaScript functionality:
   - `/public/js/api.js` - API service handling
   - `/public/js/auth.js` - Authentication logic
   - `/public/js/profile.js` - Profile management
   - `/public/js/family.js` - Family tree operations

### 3. Optimize Backend for Direct SQL

Update the backend to use direct SQL queries instead of Sequelize ORM:

1. Create SQL schema files:
   - `/server/sql/schema.sql` - Database schema definition
   - `/server/sql/seed.sql` - Initial data for development

2. Modify controllers to use direct SQL:
   - Use `pg` or `mysql` npm packages instead of Sequelize
   - Implement parameterized queries for security
   - Structure transactions for complex operations

3. Example SQL schema implementation:

```sql
-- Users table
CREATE TABLE users (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  name VARCHAR(100) NOT NULL,
  email VARCHAR(100) UNIQUE NOT NULL,
  password VARCHAR(100) NOT NULL,
  role VARCHAR(20) DEFAULT 'user',
  is_active BOOLEAN DEFAULT TRUE,
  last_login TIMESTAMP,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Family members table
CREATE TABLE family_members (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID REFERENCES users(id),
  name VARCHAR(100) NOT NULL,
  relationship VARCHAR(50) NOT NULL,
  birth_date DATE,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Family connections table
CREATE TABLE family_connections (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  member1_id UUID REFERENCES family_members(id),
  member2_id UUID REFERENCES family_members(id),
  relationship_type VARCHAR(50) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

### 4. Enhance User Experience

1. Implement a responsive design for mobile and desktop:
   - Use CSS Grid and Flexbox for layouts
   - Add responsive breakpoints using media queries
   - Optimize images and assets for different screen sizes

2. Add interactive elements with vanilla JavaScript:
   - Modal dialogs for confirmations
   - Form validations with visual feedback
   - Animated transitions between pages/states
   - Drag-and-drop functionality for family tree editing

3. Implement accessibility features:
   - Semantic HTML elements
   - ARIA attributes for interactive components
   - Keyboard navigation support
   - High contrast mode

### 5. Security Improvements

1. Implement CSRF protection with tokens
2. Add rate limiting for authentication endpoints
3. Use parameterized SQL queries to prevent SQL injection
4. Implement proper input validation and sanitization
5. Set secure HTTP headers

### 6. Development Workflow

1. Use a task runner like Gulp for:
   - Transpiling modern JavaScript (Babel)
   - CSS preprocessing (SASS/LESS)
   - Asset optimization
   - Live reloading during development

2. Build process:
   ```bash
   # Install Gulp
   npm install -g gulp-cli
   npm install --save-dev gulp

   # Run build process
   gulp build
   ```

### 7. Testing

1. Create unit tests for JavaScript functions
2. Implement integration tests for database operations
3. Set up end-to-end tests with tools like Cypress

## Implementation Plan

1. Setup the database and verify SQL connection
2. Create the HTML/CSS structure for all pages
3. Implement the backend API with direct SQL
4. Add JavaScript functionality to the frontend
5. Connect frontend to backend APIs
6. Implement user authentication flow
7. Add family tree visualization features
8. Test and optimize the application

