-- get room number accroding to subdivion
SELECT room_number FROM rooms WHERE subdivision_id=1;
SELECT room_number FROM rooms WHERE subdivision_id=2;
SELECT room_number FROM rooms WHERE subdivision_id=3;
SELECT room_number FROM rooms WHERE subdivision_id=4;

-- or by subdivision title

SELECT rooms.room_number FROM rooms
    INNER JOIN subdivisions AS subdiv
        ON subdiv.id = rooms.subdivision_id
    WHERE subdiv.title = 'IB';

-- calculate area
SELECT SUM(square) FROM rooms;

-- calculate area according to room_type
SELECT room_type, SUM(square) FROM rooms
    GROUP BY room_type;

-- calculate capacity according to subdivisions
SELECT subdiv.title, SUM(rooms.capacity) FROM subdivisions AS subdiv
    INNER JOIN rooms ON rooms.subdivision_id = subdiv.id
    GROUP BY subdiv.title;
