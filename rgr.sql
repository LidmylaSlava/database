CREATE TABLE building (
  id SERIAL PRIMARY KEY,
  build_number VARCHAR(255),
  adress VARCHAR(255)
 );
  
CREATE TABLE height_floor (
  id SERIAL PRIMARY KEY,
  building_id INTEGER REFERENCES building(id) ON DELETE CASCADE,
  floor INTEGER NOT NULL,
  height REAL NOT NULL
  );

CREATE TABLE subdivisions (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    type_sub_id INTEGER REFERENCES type_subdivisions(id) ON DELETE CASCADE,
    parent_id INTEGER
);
CREATE TABLE target (
  id SERIAL PRIMARY KEY,
  target_name VARCHAR(255) NOT NULL CHECK (target_name IN ('Навчальне приміщення',
                                                           'Службове приміщення','Адміністративне приміщення'))
                                           );
  
CREATE TABLE rooms (
    id SERIAL PRIMARY KEY,
    room_number INTEGER NOT NULL DEFAULT 1,
    square INTEGER NOT NULL,
    floor INTEGER NOT NULL,
    capacity INTEGER NOT NULL,
    building_id INTEGER REFERENCES building(id) ON DELETE CASCADE,
    subdivision_id INTEGER REFERENCES subdivisions(id) ON DELETE CASCADE,
    room_type_id INTEGER REFERENCES rooms_type(id) ON DELETE CASCADE,
    target_id INTEGER REFERENCES target(id) ON DELETE CASCADE
    );
    
CREATE TABLE type_subdivisions (
    id SERIAL PRIMARY KEY,
    type_sub VARCHAR(255) NOT NULL
    );
CREATE TABLE rooms_type (
    id SERIAL PRIMARY KEY,
    room_type VARCHAR(255) NOT NULL CHECK (room_type IN ('Аудиторія', 'Кабінет','Службове приміщення', 'Лабораторія'))
    );
   
  alter table rooms
add constraint room_capacity_check
check (capacity<2000 and capacity>0);

alter table rooms
add constraint room_square_check
check (square<5000 and square>0);

alter table height_floor
add constraint height_check
check (height>0);

insert into target(target_name) values ('Навчальне приміщення'), ('Службове приміщення'), ('Адміністративне приміщення');

insert into type_subdivisions(type_sub) values ('Департамент'), ('Кафедра'), ('Інститут'), ('Факультет'), ('Загальний'), ('Лабораторія');

insert into subdivisions(title, type_sub_id, parent_id) values ('IPT', 3, NULL), ('ISCA', 3, NULL), ('ICF', 4, NULL), ('IS', 2, 1), ('MMIS', 2, 1), ('ДНВР', 1, NULL), ('Адміністрація', 5, NULL), ('Юридичний відділ', 5, 7), ('Фінансовий відділ', 5, 7), ('Кадровий відділ', 5, 7), ('Лабораторія ІБ', 6, 4);

insert into rooms_type (room_type) values ('Аудиторія'), ('Кабінет'), ('Службове приміщення'), ('Лабораторія');

insert into building (build_number, adress) values ('11', 'Проспект Перемоги 37/11'), ('1', 'Проспект Перемоги 37/1'), ('4', 'Проспект Перемоги 37/4');

insert into rooms(room_number,floor, square, capacity, subdivision_id, room_type_id, building_id, target_id) values 
	('12', 400, 1, 200, 1, 1, 2, 1), 
	('215', 100, 2, 30, 1, 1, 1, 1), 
	('201', 123, 2, 23, 1 ,1, 2, 2), 
	('255', 123, 2, 44, 2, 1, 3, 1), 
	('111', 20, 1, 11, 2, 2, 3, 3), 
	('234', 65, 2, 90, 2, 1, 1, 1), 
	('245', 77, 2, 104, 2, 1, 1, 1), 
	('216', 70, 2, 30, 11, 4, 1, 1), 
	('217', 63, 2, 34, 1, 2, 1, 1);

insert into height_floor (building_id, floor, height) values
(1, 1, 2),
(1, 2, 2.5),
(2, 1, 3),
(2, 2, 5);
-- запросы
create or replace function get_volume(id_ integer) returns real as $$
declare 
	ret real;
begin
	select into ret r.square*h.height from rooms r INNER JOIN
	height_floor h ON (r.building_id=h.building_id and r.floor=h.floor) where r.id=id_;
	return ret;
end;
$$ language plpgsql;

create or replace function get_subdivision_count_in_building(bnumber varchar(100), sub_id integer) returns integer as $$
declare 
	ret integer;
begin
	if sub_id is null then
		select into ret count(distinct subdivision_id) from rooms r inner join building b on r.building_id=b.id
		and b.build_number=bnumber;
	else
		select into ret count(distinct subdivision_id) from (rooms r inner join building b on r.building_id=b.id 
		and b.build_number=bnumber) c inner join subdivisions s on c.subdivision_id=s.id where s.type_sub_id=sub_id;
	end if;
	return ret;
end;
$$ language plpgsql;
select get_subdivision_count_in_building('11', 3);

create or replace function get_subunits_name_in_building(bname varchar(100), stid integer) returns table(building varchar(100), subunit varchar(100)) as $$
begin
	if stid is null then
		return query select C.name as building, D.name as subunit from (room A inner join building B on A.building_id=B.id and B.num=bname) C inner join subunit D on C.subunit_id=D.id;
	else
		return query select C.name as building, D.name as subunit from (room A inner join building B on A.building_id=B.id and B.num=bname) C inner join subunit D on C.subunit_id=D.id where D.subunit_type_id=stid;
	end if;
end;
$$ language plpgsql;

