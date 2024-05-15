DROP TABLE IF EXISTS characters_items;
DROP TABLE IF EXISTS characters_weapons;
DROP TABLE IF EXISTS stats;
DROP TABLE IF EXISTS weapon_types;
DROP TABLE IF EXISTS characters;
DROP TABLE IF EXISTS items;
DROP TABLE IF EXISTS weapons;

CREATE TABLE characters (
	id_character INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(24) NOT NULL,
	age INT NOT NULL,
	gender CHAR(1) NOT NULL,
	level INT NOT NULL,
	health INT NOT NULL,
	height FLOAT NOT NULL,
	weight FLOAT NOT NULL,
	origin CHAR(2) NOT NULL
);

INSERT INTO characters (name, age, gender, level, health, height, weight, origin)
VALUES
('El Fary', 86, 'N', 200, 70, 1.2, 47, 'GY'),
('El Cigala', 45, 'M', 150, 80, 2.4, 150, 'RO'),
('El Churumbel', 33, 'M', 33, 33, 3.3, 333, 'MA'),
('El Kiko', 1, 'F', 69, 100, 1.1, 420, 'RE'),
('El Escalona', 51, 'M', 10, 50, 1.7, 80, 'SB');

CREATE TABLE stats (
	id_stat INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	reputation INT NOT NULL,
	speed INT NOT NULL,
	morality INT NOT NULL,
	defense INT NOT NULL,
	hunger INT NOT NULL,
	reflex INT NOT NULL,
	stamina INT NOT NULL,
	id_character INT UNSIGNED NOT NULL,
	FOREIGN KEY (id_character) REFERENCES characters(id_character)
);

INSERT INTO stats (reputation, speed, morality, defense, hunger, reflex, stamina, id_character)
VALUES
(100, 40, 80, 10, 0, 0, -1, 1),
(60, 50, 40, 5, 0 ,1, 10 ,2),
(75, 30, 75, 7, 0, 0, 50, 3),
(90, 60, 80, 4, 0, 1, 30, 4);

CREATE TABLE items (
	id_item INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	item VARCHAR(24) NOT NULL,
	type VARCHAR(24) NOT NULL,
	weight FLOAT NOT NULL,
	shape INT NOT NULL,
	equippable BOOLEAN NOT NULL,
	rarity INT NOT NULL,
	uses INT NOT NULL,
	quantity INT NOT NULL
);

INSERT INTO items (item, type, weight, shape, equippable, rarity, uses, quantity)
VALUES
('Bollo', 'Comida', 0.1, 3, FALSE, 5, 1, 1),
('Guitarra Flamenca', 'Instrumento', 1, 4, TRUE, 100, 100, 1),
('Piti', 'Droga', 0.01, 1, TRUE, 10, 1, 1),
('Portatil', 'Tecnologia', 2, 5, TRUE, 30, 100, 1),
('Pandereta', 'Instrumento', 0.2, 1, TRUE, 40, 1000, 1),
('Piano', 'Instrumento', 6, 1, TRUE, 75, 2000, 1),
('Escobilla', 'Limpieza', 0.1, 1, TRUE, 20, 1000, 1);

CREATE TABLE characters_items (
	id_character_item INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	id_character INT UNSIGNED NOT NULL,
	id_item INT UNSIGNED NOT NULL,
	FOREIGN KEY (id_character) REFERENCES characters(id_character),
	FOREIGN KEY (id_item) REFERENCES items(id_item)
);

INSERT INTO characters_items (id_character, id_item)
VALUES 
(1, 5),
(2, 5),
(4, 5),
(2, 7),
(1, 6),
(2, 2),
(2, 6),
(1, 2),
(3, 6),
(1, 7);

CREATE TABLE weapon_types (
	id_weapon_type INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	type VARCHAR(24) NOT NULL
);

INSERT INTO weapon_types (type)
VALUES
('melee'),
('proyectil');

CREATE TABLE weapons (
	id_weapon INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	weapon VARCHAR(24) NOT NULL,
	level INT NOT NULL,
	damage INT NOT NULL,
	weight FLOAT NOT NULL,
	critical INT NOT NULL,
	id_weapon_type INT UNSIGNED NOT NULL
);

INSERT INTO weapons (weapon, level, damage, weight, critical, id_weapon_type)
VALUES
('Puños', 5, 10, 0.25, 5, 1),
('SPAS-12', 50, 80, 2, 10, 2),
('Extensible', 25, 20, 0.25, 10, 1),
('Taser', 30, 40, 0.25, 50, 1),
('Maquinilla de Afeitar', 30, 15, 0.25, 5, 1);

CREATE TABLE characters_weapons (
	id_character_weapon INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	id_character INT UNSIGNED NOT NULL,
	id_weapon INT UNSIGNED NOT NULL,
	FOREIGN KEY (id_character) REFERENCES characters(id_character),
	FOREIGN KEY (id_weapon) REFERENCES weapons(id_weapon)
);

INSERT INTO characters_weapons (id_character, id_weapon)
VALUES
(2, 3),
(3, 1),
(1, 3),
(1, 2);
