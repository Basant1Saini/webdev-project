-- Family Network Sample Data
-- For development and testing purposes only

-- Insert family members for Sarah Johnson's family tree
INSERT INTO family_members (id, user_id, name, relationship, birth_date, gender, location, is_living)
VALUES
  -- Sarah's immediate family
  ('f0eebc99-9c0b-4ef8-bb6d-6bb9bd380a16', 'b0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12', 'Sarah Johnson', 'self', '1980-05-15', 'female', 'New York, USA', true),
  ('f1eebc99-9c0b-4ef8-bb6d-6bb9bd380a17', 'b0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12', 'David Johnson', 'father', '1955-02-10', 'male', 'Boston, USA', true),
  ('f2eebc99-9c0b-4ef8-bb6d-6bb9bd380a18', 'b0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12', 'Mary Johnson', 'mother', '1958-07-22', 'female', 'Boston, USA', true),
  ('f3eebc99-9c0b-4ef8-bb6d-6bb9bd380a19', 'b0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12', 'Thomas Johnson', 'brother', '1982-11-05', 'male', 'Chicago, USA', true),
  ('f4eebc99-9c0b-4ef8-bb6d-6bb9bd380a20', 'b0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12', 'James Johnson', 'husband', '1978-09-18', 'male', 'New York, USA', true),
  ('f5eebc99-9c0b-4ef8-bb6d-6bb9bd380a21', 'b0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12', 'Emma Johnson', 'daughter', '2010-03-12', 'female', 'New York, USA', true),
  ('f6eebc99-9c0b-4ef8-bb6d-6bb9bd380a22', 'b0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12', 'Ethan Johnson', 'son', '2012-08-30', 'male', 'New York, USA', true),
  
  -- Sarah's additional siblings and their families
  ('g1eebc99-9c0b-4ef8-bb6d-6bb9bd380a01', 'b0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12', 'Lisa Johnson', 'sister', '1984-03-18', 'female', 'Portland, USA', true),
  ('g1eebc99-9c0b-4ef8-bb6d-6bb9bd380a02', 'b0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12', 'Eric Williams', 'brother-in-law', '1983-09-25', 'male', 'Portland, USA', true),
  ('g1eebc99-9c0b-4ef8-bb6d-6bb9bd380a03', 'b0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12', 'Sophie Williams', 'niece', '2014-05-20', 'female', 'Portland, USA', true),
  ('g1eebc99-9c0b-4ef8-bb6d-6bb9bd380a04', 'b0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12', 'Michael Johnson', 'brother', '1986-11-12', 'male', 'Seattle, USA', true),
  ('g1eebc99-9c0b-4ef8-bb6d-6bb9bd380a05', 'b0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12', 'Jennifer Johnson', 'sister-in-law', '1987-04-30', 'female', 'Seattle, USA', true),
  ('g1eebc99-9c0b-4ef8-bb6d-6bb9bd380a06', 'b0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12', 'Ryan Johnson', 'nephew', '2015-08-17', 'male', 'Seattle, USA', true),
  ('g1eebc99-9c0b-4ef8-bb6d-6bb9bd380a07', 'b0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12', 'Emma Johnson', 'niece', '2018-02-05', 'female', 'Seattle, USA', true),
  
  -- Brother Thomas's family
  ('g1eebc99-9c0b-4ef8-bb6d-6bb9bd380a08', 'b0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12', 'Amanda Johnson', 'sister-in-law', '1984-07-14', 'female', 'Chicago, USA', true),
  ('g1eebc99-9c0b-4ef8-bb6d-6bb9bd380a09', 'b0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12', 'Lucas Johnson', 'nephew', '2013-10-22', 'male', 'Chicago, USA', true),
  
  -- Father's side - David's siblings and their families
  ('g2eebc99-9c0b-4ef8-bb6d-6bb9bd380a01', 'b0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12', 'Robert Johnson', 'uncle', '1952-06-08', 'male', 'San Diego, USA', true),
  ('g2eebc99-9c0b-4ef8-bb6d-6bb9bd380a02', 'b0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12', 'Patricia Johnson', 'aunt-by-marriage', '1954-09-15', 'female', 'San Diego, USA', true),
  ('g2eebc99-9c0b-4ef8-bb6d-6bb9bd380a03', 'b0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12', 'Daniel Johnson', 'cousin', '1979-12-10', 'male', 'San Diego, USA', true),
  ('g2eebc99-9c0b-4ef8-bb6d-6bb9bd380a04', 'b0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12', 'Michelle Johnson', 'cousin', '1982-04-28', 'female', 'Los Angeles, USA', true),
  ('g2eebc99-9c0b-4ef8-bb6d-6bb9bd380a05', 'b0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12', 'Susan Johnson', 'aunt', '1960-03-22', 'female', 'Boston, USA', true),
  ('g2eebc99-9c0b-4ef8-bb6d-6bb9bd380a06', 'b0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12', 'James Martin', 'uncle-by-marriage', '1958-11-05', 'male', 'Boston, USA', true),
  ('g2eebc99-9c0b-4ef8-bb6d-6bb9bd380a07', 'b0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12', 'Chris Martin', 'cousin', '1985-08-12', 'male', 'Boston, USA', true),
  ('g2eebc99-9c0b-4ef8-bb6d-6bb9bd380a08', 'b0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12', 'Emily Martin', 'cousin', '1988-02-17', 'female', 'New York, USA', true),
  
  -- Mother's side - Mary's siblings and their families
  ('g3eebc99-9c0b-4ef8-bb6d-6bb9bd380a01', 'b0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12', 'Elizabeth Williams', 'aunt', '1956-05-30', 'female', 'Miami, USA', true),
  ('g3eebc99-9c0b-4ef8-bb6d-6bb9bd380a02', 'b0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12', 'John Williams', 'uncle-by-marriage', '1954-01-15', 'male', 'Miami, USA', true),
  ('g3eebc99-9c0b-4ef8-bb6d-6bb9bd380a03', 'b0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12', 'Laura Williams', 'cousin', '1977-07-09', 'female', 'Atlanta, USA', true),
  ('g3eebc99-9c0b-4ef8-bb6d-6bb9bd380a04', 'b0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12', 'Mark Williams', 'cousin', '1980-11-22', 'male', 'Miami, USA', true),
  ('g3eebc99-9c0b-4ef8-bb6d-6bb9bd380a05', 'b0eebc99-9c0b-4ef8-bb6d-6bb9bd380a12', 'Richard Williams', 'uncle', '1962-09-03', 'male', 'Chicago, USA', true),
  
  -- Grandparents - Paternal (David's parents)
  ('f7eebc99-9c0b-4ef8-bb6d-6bb9bd380a23', 'b0
   
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

