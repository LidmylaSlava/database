CREATE TABLE subdivisions (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    type_sub_id INTEGER REFERENCES type_subdivisions(id) ON DELETE CASCADE
);

CREATE TABLE rooms (
    id SERIAL PRIMARY KEY,
    subdivision_id INTEGER REFERENCES subdivisions(id) ON DELETE CASCADE,
    room_type_id INTEGER REFERENCES rooms_type(id) ON DELETE CASCADE,
    room_number INTEGER NOT NULL DEFAULT 1,
    square INTEGER NOT NULL,
    capacity INTEGER NOT NULL
);
CREATE TABLE type_subdivisions (
    id SERIAL PRIMARY KEY,
    type_sub VARCHAR(255) NOT NULL CHECK (type_sub IN ('training room', 'administrative', 'office'))
    );
CREATE TABLE rooms_type (
    id SERIAL PRIMARY KEY,
    room_type VARCHAR(255) NOT NULL CHECK (room_type IN ('lecture hall', 'cabinet', 'laboratory'))
    );
