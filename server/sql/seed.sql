-- Family Network Sample Data
-- For development and testing purposes only

-- Insert test users (password is 'password123' hashed)
INSERT INTO users (id, name, email, password, role, is_active, bio, created_at)
VALUES
  ('a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', 'John Smith', 'john@example.com', 
   '$2a$10$rVJ1Ry3oPFk63HFAzH5UfO6bLZr.wQGQi4.mO1rszTkOLAqXhKJdq', 'admin', true, 
   'Family Network administrator and developer', '2025-01-01 10:00:00'),
   
  ('b0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12', 'Sarah Johnson', 'sarah@example.com', 
   '$2a$10$rVJ1Ry3oPFk63HFAzH5UfO6bLZr.wQGQi4.mO1rszTkOLAqXhKJdq', 'user', true, 
   'Family historian and genealogy enthusiast', '2025-01-02 11:30:00'),
   
  ('c0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13', 'Michael Brown', 'michael@example.com', 
   '$2a$10$rVJ1Ry3oPFk63HFAzH5UfO6bLZr.wQGQi4.mO1rszTkOLAqXhKJdq', 'user', true, 
   'Looking for long-lost relatives', '2025-01-03 09:15:00'),
   
  ('d0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14', 'Emily Davis', 'emily@example.com', 
   '$2a$10$rVJ1Ry3oPFk63HFAzH5UfO6bLZr.wQGQi4.mO1rszTkOLAqXhKJdq', 'user', true, 
   'Just started building my family tree', '2025-01-04 14:20:00'),
   
  ('e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15', 'Robert Wilson', 'robert@example.com', 
   '$2a$10$rVJ1Ry3oPFk63HFAzH5UfO6bLZr.wQGQi4.mO1rszTkOLAqXhKJdq', 'user', false, 
   'Inactive user for testing', '2025-01-05 16:45:00');

-- Insert user settings
INSERT INTO user_settings (user_id, notification_emails, notification_web, privacy_level, theme)
VALUES
  ('a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11', true, true, 'public', 'light'),
  ('b0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12', true, true, 'friends', 'dark'),
  ('c0eebc99-9c0b-4ef8-bb6d-6bb9bd380a13', false, true, 'private', 'auto'),
  ('d0eebc99-9c0b-4ef8-bb6d-6bb9bd380a14', true, false, 'friends', 'light'),
  ('e0eebc99-9c0b-4ef8-bb6d-6bb9bd380a15', false, false, 'private', 'dark');

-- Insert family members for Sarah Johnson's family tree
INSERT INTO family_members (id, user_id, name, relationship, birth_date, gender, location, is_living)
VALUES
  -- Sarah's family
  ('f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16', 'b0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12', 'Sarah Johnson', 'self', '1980-05-15', 'female', 'New York, USA', true),
  ('f1eebc99-9c0b-4ef8-bb6d-6bb9bd380a17', 'b0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12', 'David Johnson', 'father', '1955-02-10', 'male', 'Boston, USA', true),
  ('f2eebc99-9c0b-4ef8-bb6d-6bb9bd380a18', 'b0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12', 'Mary Johnson', 'mother', '1958-07-22', 'female', 'Boston, USA', true),
  ('f3eebc99-9c0b-4ef8-bb6d-6bb9bd380a19', 'b0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12', 'Thomas Johnson', 'brother', '1982-11-05', 'male', 'Chicago, USA', true),
  ('f4eebc99-9c0b-4ef8-bb6d-6bb9bd380a20', 'b0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12', 'James Johnson', 'husband', '1978-09-18', 'male', 'New York, USA', true),
  ('f5eebc99-9c0b-4ef8-bb6d-6bb9bd380a21', 'b0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12', 'Emma Johnson', 'daughter', '2010-03-12', 'female', 'New York, USA', true),
  ('f6eebc99-9c0b-4ef8-bb6d-6bb9bd380a22', 'b0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12', 'Ethan Johnson', 'son', '2012-08-30', 'male', 'New York, USA', true),
  
  -- Grandparents
  ('f7eebc99-9c0b-4ef8-bb6d-6bb9bd380a23', 'b0

