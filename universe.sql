CREATE DATABASE universe;

CREATE TABLE galaxy(
	galaxy_id SERIAL PRIMARY KEY,
	name VARCHAR(30) UNIQUE NOT NULL,
	num_planet INT,
	galaxy_group TEXT,
	galaxy_size_M NUMERIC(4,1)
);

CREATE TABLE star(
	star_id SERIAL PRIMARY KEY,
	name VARCHAR(30) UNIQUE NOT NULL,
	color TEXT,
	temperature_k INT,
	star_size_km INT,
	galaxy_id INT
);

CREATE TABLE planet(
	planet_id SERIAL PRIMARY KEY,
	name VARCHAR(30) UNIQUE NOT NULL,
	has_life BOOLEAN,
	surface_km VARCHAR(30),
	radio_km VARCHAR(30),
	star_id INT
);

CREATE TABLE moon(
	moon_id SERIAL PRIMARY KEY,
	name VARCHAR(30) UNIQUE NOT NULL,
	distance_km NUMERIC(10,1),
	radio_km NUMERIC(10,1),
	planet_id INT
);

CREATE TABLE asteroid(
	asteroid_id SERIAL PRIMARY KEY,
	name VARCHAR(30) UNIQUE NOT NULL,
	asteroid_bell BOOLEAN,
	asteroid_type TEXT,
	galaxy_id INT
);

ALTER TABLE moon RENAME COLUMN distance_km TO distance_km_earth;
ALTER TABLE star ADD FOREIGN KEY (galaxy_id) REFERENCES galaxy (galaxy_id);
ALTER TABLE planet ADD FOREIGN KEY (star_id) REFERENCES star (star_id);
ALTER TABLE moon ADD FOREIGN KEY (planet_id) REFERENCES planet (planet_id);
ALTER TABLE asteroid ADD FOREIGN KEY (galaxy_id) REFERENCES galaxy (galaxy_id);

INSERT INTO galaxy (name, num_planet, galaxy_group, galaxy_size_m)
VALUES  ('via lactea',160000,'grupo local',-20.8);
		('enana del can mayor',null,'grupo local',null),
		('enana de la osa mayor',null,'grupo local',-7.13),
		('enana eliptica de sagitario',null,'grupo local',-12.67),
		('andromeda 2',null,'grupo local',-9.33),
		('leo 1',null,'grupo local',-10.97);

INSERT INTO star (name, color, temperature_k, star_size_km, galaxy_id)
VALUES  ('sol','rojo',5578,1391000,1),
		('proxima centauri','rojo',3042,192000,1),
		('sirio','blanco azulado',25200,1182350,1),
		('pollux','rojo naranja',4770,6120400,1),
		('arturo','naranja',4290,17665700,1),
		('aldebaran','naranja',4010,30741100,1);

INSERT INTO planet (name, surface_km, radio_km, has_life, star_id)
VALUES  ('mercurio','74.8 M',2439.7,false,1),
		('venus','460.2 M',6051.8,false,1),
		('tierra','510 M',6371,true,1),
		('marte','144.8 M',3389.5,false,1),
		('jupiter','61.42 MM',69911,false,1),
		('saturno','42.7 MM',58232,false,1),
		('neptuno ','7618 MM',24622,false,1),
		('urano','8083 MM',25362,false,1),
		('pluton','17 M',1185,false,1),
		('ceres','2.8 M',473,false,1),
		('eris','null',1163,false,1),
		('haumea','null',816,false,1),
		('makemake','null',715,false,1);

INSERT INTO moon (name, distance_km, radio_km, planet_id)
VALUES  ('europa',628.3,1560.8,5),
		('ganimedes',628.3,2634.1,5),
		('calisto',628.3,2410.3,5),
		('amaltea',628.3,83.5,5),
		('titan',1272,2574.7,6),
		('dione',1272,561.4,6),
		('rea',1272,763.8,6),
		('hiperion',1272,135,6),
		('triton',4338,1353.4,8),
		('hipocampo',4338,9,8),
		('talasa',4338,41,8),
		('titania',2723,788.4,7),
		('oberon',2723,761.4,7),
		('caronte',null,606,9),
		('fobos',77.79,11.2,4),
		('deimos',77.79,6.2,4),
		('elara',628.3,43,5),
		('io',628.3,1821.6,5),
		('japeto',1272,734.5,6),
		('miranda',2723,235.8,7);

INSERT INTO asteroid (name, asteroid_bell, asteroid_type, galaxy_id)
VALUES  ('vesta',true,'cinturon asteroides',1),
		('palas',true,'cinturon asteroides',1),
		('Higia',true,'cinturon asteroides',1),
		('Quiron',false,'cinturon centauros',1);






