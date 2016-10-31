-- 1 We need to check capacity (in the case where we need 1 square m. for 1 person)
ALTER TABLE rooms ADD CONSTRAINT capacity_check CHECK (capacity < square);

-- 2 Already done in lab1.sql
-- ALTER TABLE room ADD COLUMN room_type_id INTEGER REFERENCES room_type(id) ON DELETE CASCADE;

-- 3 Foreign key test
ALTER TABLE rooms DISABLE TRIGGER ALL;
INSERT INTO rooms(room_type_id, subdivision_id, room_number, square, capacity) VALUES
    (5, 10, 225, 100, 20);
ALTER TABLE rooms ENABLE TRIGGER ALL;

-- 4

-- 5 When we need turn off foreign key checks?
-- 6 Add column single. Delete column.
ALTER TABLE room ADD COLUMN single VARCHAR(3) DEFAULT 'yes';
ALTER TABLE room DROP COLUMN single;

-- 7 Rename table
ALTER TABLE subdivisions RENAME TO sub_divisions;
