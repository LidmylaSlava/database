-- CREATE TYPE room_type AS ENUM('lecture hall','cabinet','laboratory');
/*
CREATE TABLE room_type (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE subdivision_type (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);
*/

CREATE TABLE subdivisions (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    -- type_sub INTEGER REFERENCES subdivision_type(id) ON DELETE CASCADE
    type_sub VARCHAR(255) NOT NULL CHECK (type_sub IN ('training room', 'administrative', 'office'))
);

CREATE TABLE rooms (
    id SERIAL PRIMARY KEY,

    -- room_type_id INTEGER REFERENCES room_type(id) ON DELETE CASCADE,
    subdivision_id INTEGER REFERENCES subdivisions(id) ON DELETE CASCADE,

    room_type VARCHAR(255) NOT NULL CHECK (room_type IN ('lecture hall', 'cabinet', 'laboratory')),
    room_number INTEGER NOT NULL DEFAULT 1,
    square INTEGER NOT NULL,
    capacity INTEGER NOT NULL
);


/*
INSERT INTO room_type(name) VALUES
    ('lecture hall'),
    ('cabinet'),
    ('laboratory');
*/


INSERT INTO subdivisions(title, type_sub) VALUES
    ('IB', 'training room');
