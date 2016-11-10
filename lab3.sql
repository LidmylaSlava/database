INSERT INTO subdivisions(title, type_sub) VALUES
    ('FF', 'administrative'),
    ('IB', 'office'),
    ('FF', 'office');

INSERT INTO rooms(room_type, subdivision_id, room_number, square, capacity) VALUES
    ('lecture hall', 1, 1, 150, 100),
    ('lecture hall', 1, 2, 200, 50),
    ('cabinet', 2, 30, 20, 2),
    ('laboratory', 3, 32, 50, 30),
    ('laboratory', 4, 32, 60, 20),
    ('cabinet', 3, 40, 62, 10),
    ('cabinet', 2, 31, 70, 5),
    ('lecture hall', 1, 102, 120, 70),
    ('lecture hall', 1, 105, 300, 200),
    ('laboratory', 4, 125, 100, 60);
