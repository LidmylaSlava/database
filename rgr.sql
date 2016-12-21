CREATE TABLE building (
  id SERIAL PRIMARY KEY,
  build_number VARCHAR(255),
  adress VARCHAR(255)
 );
  
CREATE TABLE height_floor (
  id SERIAL PRIMARY KEY,
  building_id INTEGER building(id) ON DELETE CASCADE,
  height INTEGER NOT NULL
  );

CREATE TABLE subdivisions (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    type_sub_id INTEGER REFERENCES type_subdivisions(id) ON DELETE CASCADE
    parent_id INTEGER
);
CREATE TABLE target (
  id SERIAL PRIMARY KEY,
  target_name VARCHAR(255) NOT NULL CHECK (target_name IN ('Навчальне приміщення',
                                                           'Службове приміщення','Адміністративне приміщення'))
                                           );
  
CREATE TABLE rooms (
    id SERIAL PRIMARY KEY,
    room_number INTEGER NOT NULL DEFAULT 1,
    square INTEGER NOT NULL,
    floor INTEGER NOT NULL,
    capacity INTEGER NOT NULL,
    building_id INTEGER building(id) ON DELETE CASCADE,
    subdivision_id INTEGER REFERENCES subdivisions(id) ON DELETE CASCADE,
    room_type_id INTEGER REFERENCES rooms_type(id) ON DELETE CASCADE,
    target_id INTEGER REFERENCES target(id) ON DELETE CASCADE
    );
    
CREATE TABLE type_subdivisions (
    id SERIAL PRIMARY KEY,
    type_sub VARCHAR(255) NOT NULL
    );
CREATE TABLE rooms_type (
    id SERIAL PRIMARY KEY,
    room_type VARCHAR(255) NOT NULL CHECK (room_type IN ('Аудиторія', 'Кабінет','Службове приміщення', 'Лабораторія')
    );
