INSERT INTO rooms_type(room_type) VALUES
    ('lecture hall'),
    ('lecture hall'),
    ('cabinet'),
    ('laboratory'),
    ('laboratory'),
    ('cabinet'),
    ('cabinet'),
    ('lecture hall'),
    ('lecture hall'),
    ('laboratory');

INSERT INTO rooms(room_type_id, subdivision_id, room_number, square, capacity) VALUES
  (1, 1, 108, 100, 90),
  (2, 2, 312, 60, 25),
  (3, 3, 114, 50, 10),
  (4, 4, 118, 100, 80),
  (5, 5, 12, 30, 5),
  (6, 6, 303, 50, 35),
  (7, 7, 112, 48, 40);
  
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
    ('IBdepartment', 1),
    ('APdepartment', 2),
    ('сryptodepartment', 3),
    ('deanery', 4),
    ('deanery', 5),
     ('IBdepartment', 6),
    ('APdepartment', 7),
    ('сryptodepartment', 8),
    ('deanery', 9),
    ('deanery', 10);
    ('IBdepartment', 11),
    ('сryptodepartment', 12);

   
