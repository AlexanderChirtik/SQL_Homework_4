CREATE DATABASE home_work_4;
USE home_work_4;


DROP TABLE IF EXISTS `shops`;
CREATE TABLE `shops` (
	`id` INT,
    `shopname` VARCHAR (100),
    PRIMARY KEY (id)
);

DROP TABLE IF EXISTS `cats`;
CREATE TABLE `cats` (
	`name` VARCHAR (100),
    `id` INT,
    PRIMARY KEY (id),
    shops_id INT,
    CONSTRAINT fk_cats_shops_id FOREIGN KEY (shops_id)
        REFERENCES `shops` (id)
);

INSERT INTO `shops`
VALUES 
		(1, "Четыре лапы"),
        (2, "Мистер Зоо"),
        (3, "МурзиЛЛа"),
        (4, "Кошки и собаки");

INSERT INTO `cats`
VALUES 
		("Murzik",1,1),
        ("Nemo",2,2),
        ("Vicont",3,1),
        ("Zuza",4,3);
        
        
-- 1. Вывести всех котиков по магазинам по id (условие соединения shops.id = cats.shops_id)

SELECT c.`id`, c.`name`, s.`shopname` FROM `cats` AS c LEFT JOIN `shops` AS s ON c.shops_id = s.id;

-- 2. Вывести магазин, в котором продается кот “Мурзик” (попробуйте выполнить 2 способами)

SELECT s.`shopname` FROM `shops` AS s JOIN `cats` AS c ON c.shops_id = s.id WHERE c.`name` = "Murzik";
SELECT s.`shopname` FROM `cats` AS c LEFT JOIN `shops` AS s ON c.shops_id = s.id WHERE c.`name` = "Murzik";

-- 3. Вывести магазины, в которых НЕ продаются коты “Мурзик” и “Zuza”

SELECT s.`shopname` FROM `shops` AS s LEFT JOIN `cats` AS c ON c.shops_id = s.id AND (c.name = "Murzik" OR c.name = "Zuza") WHERE c.name IS NULL;





