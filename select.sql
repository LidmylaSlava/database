/*Основні вимоги до функцій системи:
- Вибрати назви або номери приміщень за підрозділами;
- Підрахувати загальну площу навчальних аудиторій по приміщеннях і в цілому по навчальному закладу;
- Підрахувати загальну кількість посадочних місць для співробітників по підрозділам.*/
SELECT rooms.room_number NUMBER, subdivisions.title -- room number by subdivisions
FROM rooms, subdivisions
WHERE rooms.subdivision_id = subdivisions.id;

SELECT title, SUM(square) -- SUM square by subdivisions
FROM subdivisions S INNER JOIN type_subdivisions TS
ON S.type_sub_id=TS.id
INNER JOIN rooms R
ON S.id=R.subdivision_id
GROUP BY title;

SELECT SUM(square) FROM rooms R -- SUM square lecture hall
INNER JOIN rooms_type RT
ON R.room_type_id=RT.id
GROUP BY room_type
HAVING room_type='lecture hall';

SELECT subdivisions.title, SUM(capacity) -- SUM capacity by subdivisions
FROM subdivisions, rooms
GROUP BY subdivisions.title;
