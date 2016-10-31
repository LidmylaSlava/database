CREATE TYPE type AS ENUM('lecture hall','cabinet','laboratory');
CREATE TABLE subdivisions (
id SERIAL PRIMARY KEY,
title VARCHAR(255) NOT NULL,
type_sub VARCHAR(255) NOT NULL
);
CREATE TABLE rooms (
id SERIAL PRIMARY KEY,
number INTEGER DEFAULT 1 CHECK (number<@'[1,800]'::int4range),
type type NOT NULL,
square INTEGER NOT NULL,
capacity INTEGER NOT NULL,
subdivision_id INTEGER REFERENCES subdivisions (id) ON DELETE CASCADE
);
