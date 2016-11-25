
/*2. Створити представлення «Аудиторії» з полями «код_приміщення», «назва приміщення», «підрозділ», 
в яку повинні входити приміщення виду «Аудиторія». Оновлювати представлення «Аудиторії».*/
CREATE OR REPLACE VIEW LECTUREHALL
AS
SELECT id, room_number, subdivision_id
FROM rooms 
WHERE room_type_id=1;

INSERT INTO LECTUREHALL
VALUES (1, 120, 13);

UPDATE LECTUREHALL 
SET room_number=122 WHERE id=1;




