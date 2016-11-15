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
INSERT INTO type_subdivisions (type_sub) VALUES
('training room'),
('office'),
('administrative'),
('training room'),
('office'),
('administrative'),
('training room'),
('office'),
('administrative');


INSERT INTO subdivisions(title, type_sub) VALUES
    ('IBdepartment', '1'),
    ('APdepartment', '2'),
    ('сryptodepartment', '3'),
    ('deanery', '4'),
    ('deanery', '5'),
     ('IBdepartment', '6'),
    ('APdepartment', '7'),
    ('сryptodepartment', '8'),
    ('deanery', '9'),
    ('deanery', '10');
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
