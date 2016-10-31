-- CREATE TYPE room_type AS ENUM('lecture hall','cabinet','laboratory');
CREATE TABLE room_type (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE subdivisions (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    type_sub VARCHAR(255) NOT NULL
);

CREATE TABLE rooms (
    id SERIAL PRIMARY KEY,

    --type room_type NOT NULL,
    room_type_id INTEGER REFERENCES room_type(id) ON DELETE CASCADE,
    subdivision_id INTEGER REFERENCES subdivisions(id) ON DELETE CASCADE,

    room_number INTEGER NOT NULL DEFAULT 1,
    square INTEGER NOT NULL,
    capacity INTEGER NOT NULL
);

INSERT INTO room_type(name) VALUES
    ('lecture hall'),
    ('cabinet'),
    ('laboratory');

INSERT INTO subdivisions(title, type_sub) VALUES
    ('subdiv_title', 'subdiv_type_sub');

INSERT INTO rooms(room_type_id, subdivision_id, room_number, square, capacity) VALUES
    (1, 1, 25, 25, 5),
    (2, 1, 26, 200, 50),
    (3, 1, 30, 120, 15);
