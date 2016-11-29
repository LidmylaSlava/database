/*Тригери:
1. На видалення запису з таблиці «Приміщення». 
Якщо для приміщення зазначено підрозділ, заборонити видалення запису.
2. Створити представлення «Аудиторії» з полями «код_приміщення», «назва приміщення», 
«підрозділ», в яку повинні входити приміщення виду «Аудиторія». Оновлювати представлення «Аудиторії».*/
CREATE OR REPLACE FUNCTION trig_room_delete_checker() RETURNS trigger AS
$$
	BEGIN
		IF EXISTS (SELECT id FROM subdivisions WHERE id = OLD.id) THEN
            RAISE EXCEPTION 'cannot delete room, that has subdivision';
        END IF;
	END;
$$
LANGUAGE plpgsql VOLATILE;

CREATE TRIGGER delete_checker
BEFORE DELETE 
ON rooms
FOR EACH ROW EXECUTE PROCEDURE trig_room_delete_checker();

DELETE FROM rooms WHERE id=1;


