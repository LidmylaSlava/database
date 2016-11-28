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
