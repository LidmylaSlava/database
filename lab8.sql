/*Тригери:
1. На видалення запису з таблиці «Приміщення». 
Якщо для приміщення зазначено підрозділ, заборонити видалення запису.
2. Створити представлення «Аудиторії» з полями «код_приміщення», «назва приміщення», 
«підрозділ», в яку повинні входити приміщення виду «Аудиторія». Оновлювати представлення «Аудиторії».*/
CREATE TRIGGER TR_ROOM_DEL ON rooms
INSTEAD OF DELETE 
AS
BEGIN
 SET NOCOUNT ON;
 DELETE r
 FROM rooms r
 INNER JOIN deleted AS d
 ON r.id=d.id 
 INNER JOIN subdivisions s
 ON r.subdivision_id=s.id
 WHERE s.title=NOT NULL;
 END;



