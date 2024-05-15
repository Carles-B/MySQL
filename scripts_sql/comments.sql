
DROP TABLE IF EXISTS comments;
DROP USER IF EXISTS 'comentarios'@'localhost';

CREATE TABLE comments (
	id_comment INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	`comment` TEXT NOT NULL,
	`datetime` DATETIME NOT NULL DEFAULT now()
);

CREATE USER 'comentarios'@'localhost';

GRANT SELECT,INSERT ON faryadventures.comments TO 'comentarios'@'localhost';
