# Family Network Project

A comprehensive family social networking application that allows users to create and manage family trees, share events, photos, and memories, and stay connected with family members.


## Project Structure

```
family-network/
├── client/                 # Frontend application
│   ├── src/
│   │   ├── features/       # Feature-specific components
│   │   ├── pages/          # Route components
│   │   ├── services/       # API services
│   │   ├── store/          # Redux store configuration
│   │   ├── hooks/          # Custom React hooks
│   │   ├── utils/          # Utility functions
│   │   └── styles/         # Global styles
│   ├── public/
│   └── tests/              # Frontend tests
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

## Getting Started

### Prerequisites

- Node.js (v16 or higher)
- MongoDB
- npm or yarn

### Installation

#### Clone the repository

```bash
git clone https://github.com/yourusername/family-network.git
cd family-network
```

#### Backend Setup

```bash
cd server
npm install
```

Create a `.env` file in the server directory with the following variables:

```
PORT=5000
MONGODB_URI=mongodb://localhost:27017/family-network
JWT_SECRET=your_jwt_secret
```

#### Frontend Setup

```bash
cd client
npm install
```

### Running the Application

#### Start the Backend Server

```bash
cd server
npm run dev
```

The server will start on http://localhost:5000

#### Start the Frontend Development Server

```bash
cd client
npm start
```

The client will start on http://localhost:3000

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
- `npm run format` - Format code with Prettier

## API Documentation

The API includes the following main endpoints:

- Authentication endpoints (`/auth/*`)
- User management (`/users/*`)
- Family tree operations (`/family/*`)
- Social networking features (`/social/*`)
- Media management (`/media/*`)

Detailed API documentation can be found in the `/docs` directory.

## License

This project is licensed under the MIT License - see the LICENSE file for details.

