/* 1. Напишіть команди Transact SQL для наступних дій:
1. Створити новий обліковий запис;
2. Назначити користувачу роль БД (будь-яку);
3. Надати користувачу Bill повноваження на доступ к збереженої
процедури (будь-якої);
4. Відкликати всі надані користувачу John привілегії.
2. Поясніть призначення наступних команд Transact SQL:
a) GRANT SELECT, INSERT
ON SUPPLIES
TO J_Smith
WITH GRANT OPTION AS Economists
b) EXEC[UTE] sp_addlogin ‘king_of_the_db',
‘a2h7d0f7dg84mdf94',
‘PROJECTS',
‘Ukrainian',
‘master',
‘NULL'
c) REVOKE ALL TO ‘M_Ivanenko'
CASCADE
3. Зашифруйте зміст однієї з колонок таблиці в створеній БД.*/
CREATE ROLE decanat;
CREATE ROLE ipt LOGIN PASSWORD 'pti';
GRANT decanat TO ipt;
CREATE DATABASE decanat with owner = decanat;
\connect decanat;
CREATE SCHEMA AUTHORIZATION ipt;

CREATE ROLE decanat_reader;
GRANT SELECT, REFERENCES, TRIGGER ON ALL TABLES IN SCHEMA 'ipt' TO decanat_reader;

CREATE ROLE john LOGIN PASSWORD 'qweqweqwe';
CREATE ROLE bill LOGIN PASSWORD 'qweqweqwe';
GRANT decanat_reader TO john;
GRANT decanat_reader TO bill;

REVOKE decanat_reader FROM bill;
REVOKE ALL PRIVILEGES ON SCHEMA 'ipt' FROM bill;
