/*1. Проаналізувати предметну область вибраного варіанта завдання і сформувати запити з підзапитами:
a) Вивід списку атрибутів відношення, кількісні оцінки якого вище середнього, 
наприклад, імена студентів, у яких оцінка по тій чи іншій дисципліни вище середньої оцінки по цій самій дисципліни.
b) Вивід списку атрибутів відношення, кількісні оцінки якого максимальні 
або мінімальні, наприклад, імена студентів з максимальним сумарним балом.
c) Вивід списку атрибутів відношення, яке відповідає деякій умові з підзапиту, 
наприклад, вивести імена студентів відмінників і назви предметів, по яким вони здавали екзамен.*/

--вивести номери кімнат, ємність яких вища за середню ємність по кожному виду підрозділа 
SELECT r.room_number, sub.title
FROM rooms r 
INNER JOIN subdivisions sub on r.subdivision_id=sub.id
INNER JOIN
(SELECT title, AVG(capacity) BCapacity
 FROM rooms r
 INNER JOIN subdivisions sub on r.subdivision_id=sub.id
 GROUP BY title) b
 ON r.subdivision_id=sub.id
 WHERE capacity>BCapacity;


Вивести імена студентів, чиї оцінки вищі за середню оцінку їхньої групі.
Рішення:
SELECT S.StName,S.NRecordBook
FROM Progress P
          INNER JOIN Student S on P.NRecordBook=S.NRecordBook
         INNER JOIN
(SELECT  IDGroup, AVG(Mark) BMark
 FROM Progress P
    INNER JOIN Student S  on P.NRecordBook=S.NRecordBook
 GROUP BY IDGroup) b
ON S.IDGroup=b.IDGroup
WHERE mark> BMark
