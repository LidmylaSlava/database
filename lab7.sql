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
 
 --доп задание
  create or replace function room_inserter(rm char(4), beds integer, gen gender, cl class, price integer)
returns void as
$$
declare
is_room_in rooms%rowtype;
begin
select R.* into is_room_in from rooms R where R.room = rm;
if is_room_in is NULL then
insert into rooms (room, beds, type, class, price_per_night) values (rm, beds, gen, cl, price);
else
raise exception 'Already there!';
end if;
end;
$$
language plpgsql;
