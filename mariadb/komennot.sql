CREATE DATABASE heppa CHARACTER SET utf8;
GRANT ALL ON heppa.* TO heppa@localhost IDENTIFIED BY '8iml4Ah0vEjrfQDYOZOV';

USE heppa;
CREATE TABLE model(id INT AUTO_INCREMENT PRIMARY KEY, name VARCHAR(1024));
INSERT INTO model(name) VALUES ('marin');
INSERT INTO model(name) VALUES ('nakamura');
INSERT INTO model(name) VALUES ('kona');

