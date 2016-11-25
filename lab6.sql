
/*2. Створити представлення «Аудиторії» з полями «код_приміщення», «назва приміщення», «підрозділ», 
в яку повинні входити приміщення виду «Аудиторія». Оновлювати представлення «Аудиторії».*/
CREATE VIEW LECTUREHALL
AS
SELECT r.id, r.room_number,
s.title
FROM rooms r INNER JOIN subdivisions s
ON r.subdivision_id=s.id
INNER JOIN rooms_type rt 
ON r.room_type_id=rt.id
WHERE room_type='lecture hall';



