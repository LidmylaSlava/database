/*Основні вимоги до функцій системи:
- Вибрати назви або номери приміщень за підрозділами;
- Підрахувати загальну площу навчальних аудиторій по приміщеннях і в цілому по навчальному закладу;
- Підрахувати загальну кількість посадочних місць для співробітників по підрозділам.*/
SELECT rooms.room_number NUMBER, subdivisions.title
FROM rooms, subdivisions
WHERE rooms.subdivision_id = subdivisions.id;

SELECT room_type, SUM(square) FROM rooms
GROUP BY room_type;

SELECT SUM(square) FROM rooms;

SELECT subdivisions.title, SUM(capacity)
FROM subdivisions, rooms
GROUP BY subdivisions.title;
