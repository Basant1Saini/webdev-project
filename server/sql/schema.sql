-- Family Network Database Schema
-- PostgreSQL Version

-- Enable UUID extension
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
CREATE EXTENSION IF NOT EXISTS "pgcrypto";

-- Drop tables if they exist (for clean setup)
DROP TABLE IF EXISTS media_items CASCADE;
DROP TABLE IF EXISTS event_attendees CASCADE;
DROP TABLE IF EXISTS events CASCADE;
DROP TABLE IF EXISTS messages CASCADE;
DROP TABLE IF EXISTS family_connections CASCADE;
DROP TABLE IF EXISTS family_members CASCADE;
DROP TABLE IF EXISTS user_settings CASCADE;
DROP TABLE IF EXISTS users CASCADE;

-- Users table
CREATE TABLE users (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  name VARCHAR(100) NOT NULL,
  email VARCHAR(100) UNIQUE NOT NULL,
  password VARCHAR(100) NOT NULL,
  role VARCHAR(20) NOT NULL DEFAULT 'user' CHECK (role IN ('user', 'admin')),
  is_active BOOLEAN DEFAULT TRUE,
  profile_picture VARCHAR(255),
  bio TEXT,
  last_login TIMESTAMP,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create index on email for faster lookup
CREATE INDEX idx_users_email ON users(email);

-- User settings table
CREATE TABLE user_settings (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  notification_emails BOOLEAN DEFAULT TRUE,
  notification_web BOOLEAN DEFAULT TRUE,
  privacy_level VARCHAR(20) DEFAULT 'friends' CHECK (privacy_level IN ('public', 'friends', 'private')),
  theme VARCHAR(20) DEFAULT 'light' CHECK (theme IN ('light', 'dark', 'auto')),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT user_settings_user_unique UNIQUE (user_id)
);

-- Family members table
CREATE TABLE family_members (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  name VARCHAR(100) NOT NULL,
  relationship VARCHAR(50) NOT NULL,
  birth_date DATE,
  death_date DATE,
  gender VARCHAR(20) CHECK (gender IN ('male', 'female', 'other', 'prefer_not_to_say')),
  location VARCHAR(100),
  bio TEXT,
  profile_picture VARCHAR(255),
  is_living BOOLEAN DEFAULT TRUE,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT birth_before_death CHECK (birth_date IS NULL OR death_date IS NULL OR birth_date < death_date)
);

-- Create index on user_id for faster lookup
CREATE INDEX idx_family_members_user_id ON family_members(user_id);

-- Family connections table
CREATE TABLE family_connections (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  member1_id UUID NOT NULL REFERENCES family_members(id) ON DELETE CASCADE,
  member2_id UUID NOT NULL REFERENCES family_members(id) ON DELETE CASCADE,
  relationship_type VARCHAR(50) NOT NULL CHECK (
    relationship_type IN (
      'parent-child', 
      'spouse', 
      'sibling', 
      'grandparent-grandchild',
      'cousin',
      'uncle-aunt-niece-nephew',
      'other'
    )
  ),
  created_by UUID NOT NULL REFERENCES users(id),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT different_members CHECK (member1_id <> member2_id),
  CONSTRAINT unique_relationship UNIQUE (member1_id, member2_id)
);

-- Create indexes for faster relationship lookups
CREATE INDEX idx_family_connections_member1 ON family_connections(member1_id);
CREATE INDEX idx_family_connections_member2 ON family_connections(member2_id);

-- Messages table for communication
CREATE TABLE messages (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  sender_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  recipient_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  content TEXT NOT NULL,
  is_read BOOLEAN DEFAULT FALSE,
  sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  read_at TIMESTAMP,
  CONSTRAINT different_users CHECK (sender_id <> recipient_id)
);

-- Create indexes for faster message lookups
CREATE INDEX idx_messages_sender ON messages(sender_id);
CREATE INDEX idx_messages_recipient ON messages(recipient_id);

-- Events table
CREATE TABLE events (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  creator_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  title VARCHAR(100) NOT NULL,
  description TEXT,
  location VARCHAR(255),
  start_date TIMESTAMP NOT NULL,
  end_date TIMESTAMP NOT NULL,
  event_type VARCHAR(50) NOT NULL CHECK (
    event_type IN (
      'birthday', 
      'anniversary', 
      'wedding', 
      'funeral',
      'reunion',
      'holiday',
      'other'
    )
  ),
  is_public BOOLEAN DEFAULT FALSE,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT valid_date_range CHECK (start_date <= end_date)
);

-- Create index for date range queries
CREATE INDEX idx_events_date_range ON events(start_date, end_date);

-- Event attendees table
CREATE TABLE event_attendees (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  event_id UUID NOT NULL REFERENCES events(id) ON DELETE CASCADE,
  user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  status VARCHAR(20) NOT NULL DEFAULT 'pending' CHECK (
    status IN ('attending', 'not_attending', 'pending', 'maybe')
  ),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT unique_attendance UNIQUE (event_id, user_id)
);

-- Create indexes for faster attendance lookups
CREATE INDEX idx_event_attendees_event ON event_attendees(event_id);
CREATE INDEX idx_event_attendees_user ON event_attendees(user_id);

-- Media items table
CREATE TABLE media_items (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
  title VARCHAR(100) NOT NULL,
  description TEXT,
  file_path VARCHAR(255) NOT NULL,
  file_type VARCHAR(50) NOT NULL CHECK (
    file_type IN ('image', 'video', 'document', 'audio', 'other')
  ),
  media_date TIMESTAMP,
  is_public BOOLEAN DEFAULT FALSE,
  location VARCHAR(255),
  event_id UUID REFERENCES events(id) ON DELETE SET NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create indexes for faster media lookups
CREATE INDEX idx_media_items_user ON media_items(user_id);
CREATE INDEX idx_media_items_type ON media_items(file_type);
CREATE INDEX idx_media_items_event ON media_items(event_id) WHERE event_id IS NOT NULL;

-- Trigger function to update timestamps
CREATE OR REPLACE FUNCTION update_modified_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$$ language 'plpgsql';

-- Apply trigger to all tables with updated_at column
CREATE TRIGGER update_users_modtime
    BEFORE UPDATE ON users FOR EACH ROW EXECUTE PROCEDURE update_modified_column();

CREATE TRIGGER update_user_settings_modtime
    BEFORE UPDATE ON user_settings FOR EACH ROW EXECUTE PROCEDURE update_modified_column();

CREATE TRIGGER update_family_members_modtime
    BEFORE UPDATE ON family_members FOR EACH ROW EXECUTE PROCEDURE update_modified_column();

CREATE TRIGGER update_family_connections_modtime
    BEFORE UPDATE ON family_connections FOR EACH ROW EXECUTE PROCEDURE update_modified_column();

CREATE TRIGGER update_events_modtime
    BEFORE UPDATE ON events FOR EACH ROW EXECUTE PROCEDURE update_modified_column();

CREATE TRIGGER update_event_attendees_modtime
    BEFORE UPDATE ON event_attendees FOR EACH ROW EXECUTE PROCEDURE update_modified_column();

CREATE TRIGGER update_media_items_modtime
    BEFORE UPDATE ON media_items FOR EACH ROW EXECUTE PROCEDURE update_modified_column();

