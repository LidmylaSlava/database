/*1. Проаналізувати предметну область вибраного варіанта завдання і сформувати запити з підзапитами:
a) Вивід списку атрибутів відношення, кількісні оцінки якого вище середнього, 
наприклад, імена студентів, у яких оцінка по тій чи іншій дисципліни вище середньої оцінки по цій самій дисципліни.
b) Вивід списку атрибутів відношення, кількісні оцінки якого максимальні 
або мінімальні, наприклад, імена студентів з максимальним сумарним балом.
c) Вивід списку атрибутів відношення, яке відповідає деякій умові з підзапиту, 
наприклад, вивести імена студентів відмінників і назви предметів, по яким вони здавали екзамен.*/

--вивести номери кімнат, ємність яких вища за середню ємність по кожному виду підрозділа 
SELECT r.room_number, sub.title, capacity, Bcapacity
FROM rooms r 
INNER JOIN subdivisions sub on r.subdivision_id=sub.id
INNER JOIN
(SELECT title, AVG(capacity) BCapacity
 FROM rooms r
 INNER JOIN subdivisions sub on r.subdivision_id=sub.id
 GROUP BY title) b
 ON r.subdivision_id=sub.id
 WHERE capacity>BCapacity;
-- номери кімнат, площа яких максимальна
SELECT room_number
FROM rooms
GROUP BY room_number
HAVING AVG(square) = (SELECT MAX(square) FROM rooms);

-- вивести номери кімнат ємність яких вища за середню по фті і тип назву підрозділу
SELECT r.room_number, s.title, AVG(capacity)
FROM rooms r
INNER JOIN subdivisions s on r.subdivision_id=s.id
GROUP BY r.room_number, s.title
HAVING AVG(capacity) >= (SELECT AVG(capacity) FROM rooms);
