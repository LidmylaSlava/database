-- Процедура повинна повертати кількість приміщень для зазначеного підрозділу.
CREATE OR REPLACE FUNCTION get_rooms_count_by_subdivision (stitle varchar(225)) RETURNS INTEGER AS $$
DECLARE
  ret INTEGER;
  BEGIN
  SELECT INTO ret COUNT(r.room_number) FROM rooms r INNER JOIN subdivisions s
  ON r.subdivision_id=s.id WHERE s.title=stitle;
  RETURN ret;
  END;
  $$ language plpgsql;
  SELECT get_rooms_count_by_subdivision ('deanery');
 
 --доп задание: функция на добавление новой комнаты, проверяя что комнаты с таким номером не существует
create or replace function room_inserter(id integer, sub_id integer, rm_type_id integer, 
                                           rm_number integer, sq integer, cap integer)
returns void as
$$
declare
is_room_in rooms%rowtype;
begin
select R.* into is_room_in from rooms R where R.room_number = rm_number;
if is_room_in is NULL then
insert into rooms (id, subdivision_id, room_type_id, room_number, square, capacity) values (id, sub_id, rm_type_id, rm_number, 
                                                                                           sq, cap);
else
raise exception 'Already there!';
end if;
end;
$$
language plpgsql;
select * from room_inserter(25, 13, 2, 156, 20, 15);

/*rooms 
  id serial NOT NULL,
  subdivision_id integer,
  room_type_id integer,
  room_number integer NOT NULL DEFAULT 1,
  square integer,
  capacity integer,
