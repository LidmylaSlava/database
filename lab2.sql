
1. Введіть обмеження на границі допустимих значень створеної вами бази даних (наприклад, Успішність – оцінка не повинна бути більшою за 12 балів. Номер семестра не повинен перевищувати 12).
2. Створіть зовнішні ключі у всіх таблицях, використовуючи опцію Foreign Key, при цьому встановіть опцію каскадного видалення там, де це необхідно.
3. Відключіть обмеження зовнішнього ключа в таблиці . введіть в таблицю запис, значення поля якого порушує логічну цілісність 
таблиці (наприклад, у відношення Student, студента з неіснуючої групи). Спробуйте підключити раніше відключені обмеження.
4. Виконайте всі необхідні дії для того, щоб знову підключити обмеження, а всі дані у відношенні (напклад, Student)
відповідали умовам цілісності бази даних.
5. Змоделюйте ситуацію, коли необхідно відключити обмеження та розробіть заходи, які дозволять вам в подальшому
привести базу даних в стан, що відповідає всім умовам цілісності.
6. Додати в одну з таблиць стовпець Single, тип даних VARCHAR(3), призначивши значення по замовчуванню «так». Видалити стовпець.
7. Перейменувати одну з таблиць.
8. Повернути попередню назву перейменованої таблиці. 
-- 1 We need to check capacity (in the case where we need 1 square m. for 1 person)
ALTER TABLE rooms ADD CONSTRAINT capacity_check CHECK (capacity < square);

ALTER TABLE rooms NOCHECK CONSTRAINT Foreign Key;
-- 2 Already done in lab1.sql
-- ALTER TABLE room ADD COLUMN room_type_id INTEGER REFERENCES room_type(id) ON DELETE CASCADE;

-- 3 Foreign key test
ALTER TABLE rooms DISABLE TRIGGER ALL;
INSERT INTO rooms(room_type, subdivision_id, room_number, square, capacity) VALUES
    ('lecture hall', 10, 225, 100, 20);
ALTER TABLE rooms ENABLE TRIGGER ALL;

-- 4 Run https://github.com/EnterpriseDB/pg_catcheck
-- We need to delete this row

-- 5 When we need turn off foreign key checks? never?????
-- 6 Add column single. Delete column.
ALTER TABLE rooms ADD COLUMN single VARCHAR(3) DEFAULT 'yes';
ALTER TABLE rooms DROP COLUMN single;

-- 7 Rename table
ALTER TABLE subdivisions RENAME TO sub_divisions;
ALTER TABLE sub_divisions RENAME TO subdivisions;
