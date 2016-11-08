CREATE TABLE subdivisions (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    type_sub VARCHAR(255) NOT NULL CHECK (type_sub IN ('training room', 'administrative', 'office'))
);

CREATE TABLE rooms (
    id SERIAL PRIMARY KEY,
    subdivision_id INTEGER REFERENCES subdivisions(id) ON DELETE CASCADE,
    room_type VARCHAR(255) NOT NULL CHECK (room_type IN ('lecture hall', 'cabinet', 'laboratory')),
    room_number INTEGER NOT NULL DEFAULT 1,
    square INTEGER NOT NULL,
    capacity INTEGER NOT NULL
);


INSERT INTO subdivisions(title, type_sub) VALUES
    ('IBdepartment', 'training room'),
    ('APdepartment', 'office'),
    ('сryptodepartment', 'administrative'),
    ('deanery', 'administrative'),
    ('deanery', 'office'),
    ('IBdepartment', 'administrative'),
    ('сryptodepartment', 'training room');

INSERT INTO rooms(room_number, room_type, square, capacity) VALUES
    (108, 'lecture hall', 100, 100),
    (18, 'cabinet', 20, 10),
    (312, 'laboratory', 30, 30),
    (114, 'lecture hall', 100, 100),
    (104, 'cabinet', 15, 10),
    (302, 'laboratory', 30, 30),
    (116, 'lecture hall', 100, 100);
