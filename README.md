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

- **Frontend**: React, Redux, React Router
- **Backend**: Express, Sequelize, PostgreSQL
- **Styling**: CSS, Custom styling
- **Authentication**: JWT (JSON Web Tokens)

