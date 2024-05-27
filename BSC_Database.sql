CREATE SCHEMA`DB_BSC`;

set foreign_key_checks=0;

DROP TABLE IF EXISTS GREY_MATERIALS;

CREATE TABLE GREY_MATERIALS
(
MATERIAL_ID INT PRIMARY KEY auto_increment,
MATERIAL_NAME VARCHAR(170),
FACTOR VARCHAR(15),
RATE FLOAT,
Brand VARCHAR(200)
);

--  drop table grey_materials;

INSERT INTO GREY_MATERIALS
VALUES
(1,"Bricks", "Unit", 26,"Awal Bricks"),
(2,"Cement", "Bag", 1100,"Bestway Cements"),
(3, "Sand", "cft",87,"Chanab Sand"),
(4,"Crush", "cft",175,"Margalla Crush"),
(5, "Water Proofing", "sqft", 114,"Al-Syed Construction"),
(6, "Roof Insulation", "sqft", 249,"Al-Syed Construction"),
(7, "Termite Proofing", "Litre", 1700,"Terminix Pakistan"),
(8, "Excavation & Backfill + Ghassu", "cft", 25,"ZA Builders"),
(9,"32 mm o/d pipe", "Rft",452,"ArmaFlex"),
(10,"50 mm o/d pipe", "Rft",602,"ArmaFlex"),
(11, "Steel Re-Enforcement", "Kg",276,"Amreli 60 Grade"),
(12,"25 mm o/d pipe", "Rft",103,"SuperFlo"),
(13,"32 mm o/d pipe", "Rft",175,"SuperFlo"),
(14,"40 mm o/d pipe", "Rft",268,"SuperFlo"),
(15,"50 mm o/d pipe", "Rft",402,"SuperFlo"),
(16,'2" Dia. pipe',"Rft",256,"Royal Pakistan"),
(17,'3" Dia. pipe',"Rft",345,"Royal Pakistan"),
(18,'4" Dia. pipe',"Rft",467,"Royal Pakistan"),
(19,'6" Dia. pipe',"Rft",714,"Royal Pakistan"),
(20,"1.5 mm insulated Cu. Conductor wire","Coil",4944,"Power Tech Cables"),
(21,'2.5 mm insulated Cu. Conductor wire', "Coil", 7931,"Power Tech Cables"),
(22,'4 mm insulated Cu. Conductor wire', "Coil", 12360,"Power Tech Cables"),
(23,'GL Welded Pipeline 3/4" i/d', "Rft", 416,"International Industries Ltd."),
(24,'Gas Cock 3/4" i/d', "Unit", 1335,"Electrobes"),
(25,"Booster Pump 0.75 HP", "Unit", 150800,"TOTAL"),
(26,"Water Transfer Pump 1HP", "Unit", "140400","ESPA"),
(27,"Floor Drains", "Unit", 1695,"LapTab"),
(28,'1" Dia class "E"',"Unit (4 fts)",110,"Local"),
(29,'4 core 16 mm insulated conductor cable', "rft", 42,"Fiaz Electricals"),
(30,'Cat 5 for Telephone Cable', "Rft", 376,"AdJungle"),
(31,'TV Coaxial Cable for TV cable',"Rft",357,"Fuody");


SELECT * FROM GREY_MATERIALS;
-- ---------------------------------
DROP TABLE IF EXISTS FILTER_GREY_MATERIALS ;

CREATE TABLE FILTER_GREY_MATERIALS
(
FILTER_GREY_MATERIAL_ID INT NOT NULL primary key auto_increment,
AREA_QTY VARCHAR(20) NOT NULL,
LAYOUT_3_ID INT default NULL,
LAYOUT_5_ID INT default NULL,
LAYOUT_7_ID INT default NULL,
LAYOUT_10_ID INT default NULL,
LAYOUT_20_ID INT default NULL,
MATERIAL_ID INT default NULL,
GROUND_QTY INT ,
FIRST_FLOOR_QTY INT ,
ROOFTOP_QTY INT ,
BASEMENT_QTY INT NULL,
FOREIGN KEY (MATERIAL_ID) REFERENCES GREY_MATERIALS(MATERIAL_ID),
FOREIGN KEY (LAYOUT_3_ID) REFERENCES LAYOUT_3(ID),
FOREIGN KEY (LAYOUT_5_ID) REFERENCES LAYOUT_5(ID),
FOREIGN KEY (LAYOUT_7_ID) REFERENCES LAYOUT_7(ID),
FOREIGN KEY (LAYOUT_10_ID) REFERENCES LAYOUT_10(ID),
FOREIGN KEY (LAYOUT_20_ID) REFERENCES LAYOUT_20(ID)

);

SELECT * FROM FILTER_GREY_MATERIALS;

-- -------------------------------
-- INSERTING 3 MARLA QUANTITIES

INSERT INTO FILTER_GREY_MATERIALS (FILTER_GREY_MATERIAL_ID, AREA_QTY, LAYOUT_3_ID, MATERIAL_ID, GROUND_QTY, FIRST_FLOOR_QTY, ROOFTOP_QTY, BASEMENT_QTY)
VALUES (1, "3 MARLA", 1, 1, 15917, 14555, 5021, 11333);

INSERT INTO FILTER_GREY_MATERIALS (AREA_QTY, LAYOUT_3_ID, MATERIAL_ID, GROUND_QTY, FIRST_FLOOR_QTY, ROOFTOP_QTY, BASEMENT_QTY)
VALUES 
	   ("3 MARLA", 1, 2, 168, 120, 79, 126),
       ("3 MARLA", 1, 3, 840, 600, 395, 630),
       ("3 MARLA", 1, 4, 502, 405, 195, 699),
       ("3 MARLA", 1, 5, 48, 42, 15, 60),
       ("3 MARLA", 1, 6, 48, 42, 15, 60),
       ("3 MARLA", 1, 7, 1, 1, 0, 0),
       ("3 MARLA", 1, 8, 2204, 0, 0, 0),
       ("3 MARLA", 1, 9, 11, 9, 8, 8),
       ("3 MARLA", 1, 10, 8, 6, 10, 7),
       ("3 MARLA", 1, 11, 1000, 1000, 250, 1700),
       ("3 MARLA", 1, 12, 62, 45, 20, 4),
       ("3 MARLA", 1, 13, 15, 14, 20, 10),
       ("3 MARLA", 1, 14, 6, 5, 2, 8),
       ("3 MARLA", 1, 15, 8, 6, 3, 5),
       ("3 MARLA", 1, 16, 20, 20, 11, 15),
       ("3 MARLA", 1, 17, 20, 18, 11, 15),
       ("3 MARLA", 1, 18, 32, 28, 18, 20),
       ("3 MARLA", 1, 19, 16, 16, 0, 0),
       ("3 MARLA", 1, 20, 3, 3, 0, 1),
       ("3 MARLA", 1, 21, 3, 3, 0, 1),
       ("3 MARLA", 1, 22, 1, 1, 0, 1),
       ("3 MARLA", 1, 23, 38, 35, 22, 18),
       ("3 MARLA", 1, 24, 1, 0, 0, 0),
       ("3 MARLA", 1, 25, 1, 0, 0, 0),
       ("3 MARLA", 1, 26, 1, 0, 0, 0),
       ("3 MARLA", 1, 27, 4, 0, 0, 0),
       ("3 MARLA", 1, 28, 30, 30, 0, 20),
       ("3 MARLA", 1, 29, 32, 25, 10, 20),
       ("3 MARLA", 1, 30, 15, 15, 0, 0),
       ("3 MARLA", 1, 31, 38, 48, 0, 38);

INSERT INTO FILTER_GREY_MATERIALS (AREA_QTY, LAYOUT_3_ID, MATERIAL_ID, GROUND_QTY, FIRST_FLOOR_QTY, ROOFTOP_QTY, BASEMENT_QTY)
VALUES ("3 MARLA", 2, 1, 15171, 14320, 5021, 10024),
       ("3 MARLA", 2, 2, 160, 115, 79, 116),
       ("3 MARLA", 2, 3, 800, 575, 395, 580),
       ("3 MARLA", 2, 4, 468, 372, 195, 302),
       ("3 MARLA", 2, 5, 45, 39, 15, 58),
       ("3 MARLA", 2, 6, 45, 39, 15, 58),
       ("3 MARLA", 2, 7, 1, 1, 0, 0),
       ("3 MARLA", 2, 8, 2204, 0, 0, 0),
       ("3 MARLA", 2, 9, 8, 6, 8, 5),
       ("3 MARLA", 2, 10, 5, 3, 10, 5),
       ("3 MARLA", 2, 11, 1000, 1000, 250, 1680),
       ("3 MARLA", 2, 12, 59, 42, 20, 0),
       ("3 MARLA", 2, 13, 12, 11, 20, 0),
       ("3 MARLA", 2, 14, 5, 3, 2, 0),
       ("3 MARLA", 2, 15, 5, 3, 3, 0),
       ("3 MARLA", 2, 16, 17, 17, 11, 15),
       ("3 MARLA", 2, 17, 17, 15, 11, 15),
       ("3 MARLA", 2, 18, 29, 25, 18, 0),
       ("3 MARLA", 2, 19, 16, 16, 0, 0),
       ("3 MARLA", 2, 20, 3, 3, 0, 0),
       ("3 MARLA", 2, 21, 3, 3, 0, 0),
       ("3 MARLA", 2, 22, 1, 1, 0, 0),
       ("3 MARLA", 2, 23, 35, 32, 22, 0),
       ("3 MARLA", 2, 24, 1, 0, 0, 0),
       ("3 MARLA", 2, 25, 1, 0, 0, 0),
       ("3 MARLA", 2, 26, 1, 0, 0, 0),
       ("3 MARLA", 2, 27, 4, 0, 0, 0),
       ("3 MARLA", 2, 28, 28, 28, 0, 0),
       ("3 MARLA", 2, 29, 29, 22, 10, 0),
       ("3 MARLA", 2, 30, 12, 12, 0, 0),
       ("3 MARLA", 2, 31, 35, 45, 0, 0);

INSERT INTO FILTER_GREY_MATERIALS (AREA_QTY, LAYOUT_3_ID, MATERIAL_ID, GROUND_QTY, FIRST_FLOOR_QTY, ROOFTOP_QTY)
VALUES ("3 MARLA", 3, 1, 15700, 14505, 5021),
       ("3 MARLA", 3, 2, 165, 118, 79),
       ("3 MARLA", 3, 3, 825, 590, 395),
       ("3 MARLA", 3, 4, 470, 385, 195),
       ("3 MARLA", 3, 5, 45, 42, 15),
       ("3 MARLA", 3, 6, 45, 42, 15),
       ("3 MARLA", 3, 7, 1, 1, 0),
       ("3 MARLA", 3, 8, 2204, 0, 0),
       ("3 MARLA", 3, 9, 13, 11, 8),
       ("3 MARLA", 3, 10, 10, 8, 10),
       ("3 MARLA", 3, 11, 1000, 1000, 250),
       ("3 MARLA", 3, 12, 60, 42, 20),
       ("3 MARLA", 3, 13, 17, 16, 20),
       ("3 MARLA", 3, 14, 8, 7, 2),
       ("3 MARLA", 3, 15, 10, 8, 3),
       ("3 MARLA", 3, 16, 22, 22, 11),
       ("3 MARLA", 3, 17, 22, 20, 11),
       ("3 MARLA", 3, 18, 34, 30, 18),
       ("3 MARLA", 3, 19, 16, 16, 0),
       ("3 MARLA", 3, 20, 3, 3, 0),
       ("3 MARLA", 3, 21, 3, 3, 0),
       ("3 MARLA", 3, 22, 1, 1, 0),
       ("3 MARLA", 3, 23, 40, 37, 22),
       ("3 MARLA", 3, 24, 1, 0, 0),
       ("3 MARLA", 3, 25, 1, 0, 0),
       ("3 MARLA", 3, 26, 1, 0, 0),
       ("3 MARLA", 3, 27, 4, 0, 0),
       ("3 MARLA", 3, 28, 35, 35, 0),
       ("3 MARLA", 3, 29, 35, 28, 10),
       ("3 MARLA", 3, 30, 18, 18, 0),
       ("3 MARLA", 3, 31, 41, 51, 0);

INSERT INTO FILTER_GREY_MATERIALS (AREA_QTY, LAYOUT_3_ID, MATERIAL_ID, GROUND_QTY, FIRST_FLOOR_QTY, ROOFTOP_QTY)
VALUES ("3 MARLA", 4, 1, 16500, 14700, 5021),
       ("3 MARLA", 4, 2, 175, 128, 79),
       ("3 MARLA", 4, 3, 875, 640, 395),
       ("3 MARLA", 4, 4, 490, 395, 195),
       ("3 MARLA", 4, 5, 50, 45, 15),
       ("3 MARLA", 4, 6, 50, 45, 15),
       ("3 MARLA", 4, 7, 1, 1, 0),
       ("3 MARLA", 4, 8, 2204, 0, 0),
       ("3 MARLA", 4, 9, 17, 15, 8),
       ("3 MARLA", 4, 10, 14, 12, 10),
       ("3 MARLA", 4, 11, 1000, 1000, 250),
       ("3 MARLA", 4, 12, 64, 46, 20),
       ("3 MARLA", 4, 13, 21, 20, 20),
       ("3 MARLA", 4, 14, 12, 11, 2),
       ("3 MARLA", 4, 15, 14, 12, 3),
       ("3 MARLA", 4, 16, 26, 26, 11),
       ("3 MARLA", 4, 17, 26, 24, 11),
       ("3 MARLA", 4, 18, 38, 34, 18),
       ("3 MARLA", 4, 19, 16, 17, 0),
       ("3 MARLA", 4, 20, 3, 3, 0),
       ("3 MARLA", 4, 21, 3, 3, 0),
       ("3 MARLA", 4, 22, 1, 1, 0),
       ("3 MARLA", 4, 23, 44, 41, 22),
       ("3 MARLA", 4, 24, 1, 0, 0),
       ("3 MARLA", 4, 25, 1, 0, 0),
       ("3 MARLA", 4, 26, 1, 0, 0),
       ("3 MARLA", 4, 27, 4, 0, 0),
       ("3 MARLA", 4, 28, 38, 35, 0),
       ("3 MARLA", 4, 29, 37, 30, 10),
       ("3 MARLA", 4, 30, 24, 20, 0),
       ("3 MARLA", 4, 31, 43, 53, 0);

-- 3 MARLA MIRRORS

INSERT INTO FILTER_GREY_MATERIALS (AREA_QTY, LAYOUT_3_ID, MATERIAL_ID, GROUND_QTY, FIRST_FLOOR_QTY, ROOFTOP_QTY, BASEMENT_QTY)
VALUES 
("3 MARLA", 5, 1, 15917, 14555, 5021, 11333),
("3 MARLA", 5, 2, 168, 120, 79, 126),
("3 MARLA", 5, 3, 840, 600, 395, 630),
("3 MARLA", 5, 4, 502, 405, 195, 699),
("3 MARLA", 5, 5, 48, 42, 15, 60),
("3 MARLA", 5, 6, 48, 42, 15, 60),
("3 MARLA", 5, 7, 1, 1, 0, 0),
("3 MARLA", 5, 8, 2204, 0, 0, 0),
("3 MARLA", 5, 9, 11, 9, 8, 8),
("3 MARLA", 5, 10, 8, 6, 10, 7),
("3 MARLA", 5, 11, 1000, 1000, 250, 1700),
("3 MARLA", 5, 12, 62, 45, 20, 4),
("3 MARLA", 5, 13, 15, 14, 20, 10),
("3 MARLA", 5, 14, 6, 5, 2, 8),
("3 MARLA", 5, 15, 8, 6, 3, 5),
("3 MARLA", 5, 16, 20, 20, 11, 15),
("3 MARLA", 5, 17, 20, 18, 11, 15),
("3 MARLA", 5, 18, 32, 28, 18, 20),
("3 MARLA", 5, 19, 16, 16, 0, 0),
("3 MARLA", 5, 20, 3, 3, 0, 1),
("3 MARLA", 5, 21, 3, 3, 0, 1),
("3 MARLA", 5, 22, 1, 1, 0, 1),
("3 MARLA", 5, 23, 38, 35, 22, 18),
("3 MARLA", 5, 24, 1, 0, 0, 0),
("3 MARLA", 5, 25, 1, 0, 0, 0),
("3 MARLA", 5, 26, 1, 0, 0, 0),
("3 MARLA", 5, 27, 4, 0, 0, 0),
("3 MARLA", 5, 28, 30, 30, 0, 20),
("3 MARLA", 5, 29, 32, 25, 10, 20),
("3 MARLA", 5, 30, 15, 15, 0, 0),
("3 MARLA", 5, 31, 38, 48, 0, 38);

INSERT INTO FILTER_GREY_MATERIALS (AREA_QTY, LAYOUT_3_ID, MATERIAL_ID, GROUND_QTY, FIRST_FLOOR_QTY, ROOFTOP_QTY, BASEMENT_QTY)
VALUES 
("3 MARLA", 6, 1, 15171, 14320, 5021, 10024),
("3 MARLA", 6, 2, 160, 115, 79, 116),
("3 MARLA", 6, 3, 800, 575, 395, 580),
("3 MARLA", 6, 4, 468, 372, 195, 302),
("3 MARLA", 6, 5, 45, 39, 15, 58),
("3 MARLA", 6, 6, 45, 39, 15, 58),
("3 MARLA", 6, 7, 1, 1, 0, 0),
("3 MARLA", 6, 8, 2204, 0, 0, 0),
("3 MARLA", 6, 9, 8, 6, 8, 5),
("3 MARLA", 6, 10, 5, 3, 10, 5),
("3 MARLA", 6, 11, 1000, 1000, 250, 1680),
("3 MARLA", 6, 12, 59, 42, 20, 0),
("3 MARLA", 6, 13, 12, 11, 20, 0),
("3 MARLA", 6, 14, 5, 3, 2, 0),
("3 MARLA", 6, 15, 5, 3, 3, 0),
("3 MARLA", 6, 16, 17, 17, 11, 15),
("3 MARLA", 6, 17, 17, 15, 11, 15),
("3 MARLA", 6, 18, 29, 25, 18, 0),
("3 MARLA", 6, 19, 16, 16, 0, 0),
("3 MARLA", 6, 20, 3, 3, 0, 0),
("3 MARLA", 6, 21, 3, 3, 0, 0),
("3 MARLA", 6, 22, 1, 1, 0, 0),
("3 MARLA", 6, 23, 35, 32, 22, 0),
("3 MARLA", 6, 24, 1, 0, 0, 0),
("3 MARLA", 6, 25, 1, 0, 0, 0),
("3 MARLA", 6, 26, 1, 0, 0, 0),
("3 MARLA", 6, 27, 4, 0, 0, 0),
("3 MARLA", 6, 28, 28, 28, 0, 0),
("3 MARLA", 6, 29, 29, 22, 10, 0),
("3 MARLA", 6, 30, 12, 12, 0, 0),
("3 MARLA", 6, 31, 35, 45, 0, 0);

INSERT INTO FILTER_GREY_MATERIALS (AREA_QTY, LAYOUT_3_ID, MATERIAL_ID, GROUND_QTY, FIRST_FLOOR_QTY, ROOFTOP_QTY)
VALUES 
("3 MARLA", 7, 1, 15700, 14505, 5021),
("3 MARLA", 7, 2, 165, 118, 79),
("3 MARLA", 7, 3, 825, 590, 395),
("3 MARLA", 7, 4, 470, 385, 195),
("3 MARLA", 7, 5, 45, 42, 15),
("3 MARLA", 7, 6, 45, 42, 15),
("3 MARLA", 7, 7, 1, 1, 0),
("3 MARLA", 7, 8, 2204, 0, 0),
("3 MARLA", 7, 9, 13, 11, 8),
("3 MARLA", 7, 10, 10, 8, 10),
("3 MARLA", 7, 11, 1000, 1000, 250),
("3 MARLA", 7, 12, 60, 42, 20),
("3 MARLA", 7, 13, 17, 16, 20),
("3 MARLA", 7, 14, 8, 7, 2),
("3 MARLA", 7, 15, 10, 8, 3),
("3 MARLA", 7, 16, 22, 22, 11),
("3 MARLA", 7, 17, 22, 20, 11),
("3 MARLA", 7, 18, 34, 30, 18),
("3 MARLA", 7, 19, 16, 16, 0),
("3 MARLA", 7, 20, 3, 3, 0),
("3 MARLA", 7, 21, 3, 3, 0),
("3 MARLA", 7, 22, 1, 1, 0),
("3 MARLA", 7, 23, 40, 37, 22),
("3 MARLA", 7, 24, 1, 0, 0),
("3 MARLA", 7, 25, 1, 0, 0),
("3 MARLA", 7, 26, 1, 0, 0),
("3 MARLA", 7, 27, 4, 0, 0),
("3 MARLA", 7, 28, 35, 35, 0),
("3 MARLA", 7, 29, 35, 28, 10),
("3 MARLA", 7, 30, 18, 18, 0),
("3 MARLA", 7, 31, 41, 51, 0);

INSERT INTO FILTER_GREY_MATERIALS (AREA_QTY, LAYOUT_3_ID, MATERIAL_ID, GROUND_QTY, FIRST_FLOOR_QTY, ROOFTOP_QTY)
VALUES 
("3 MARLA", 8, 1, 16500, 14700, 5021),
("3 MARLA", 8, 2, 175, 128, 79),
("3 MARLA", 8, 3, 875, 640, 395),
("3 MARLA", 8, 4, 490, 395, 195),
("3 MARLA", 8, 5, 50, 45, 15),
("3 MARLA", 8, 6, 50, 45, 15),
("3 MARLA", 8, 7, 1, 1, 0),
("3 MARLA", 8, 8, 2204, 0, 0),
("3 MARLA", 8, 9, 17, 15, 8),
("3 MARLA", 8, 10, 14, 12, 10),
("3 MARLA", 8, 11, 1000, 1000, 250),
("3 MARLA", 8, 12, 64, 46, 20),
("3 MARLA", 8, 13, 21, 20, 20),
("3 MARLA", 8, 14, 12, 11, 2),
("3 MARLA", 8, 15, 14, 12, 3),
("3 MARLA", 8, 16, 26, 26, 11),
("3 MARLA", 8, 17, 26, 24, 11),
("3 MARLA", 8, 18, 38, 34, 18),
("3 MARLA", 8, 19, 16, 17, 0),
("3 MARLA", 8, 20, 3, 3, 0),
("3 MARLA", 8, 21, 3, 3, 0),
("3 MARLA", 8, 22, 1, 1, 0),
("3 MARLA", 8, 23, 44, 41, 22),
("3 MARLA", 8, 24, 1, 0, 0),
("3 MARLA", 8, 25, 1, 0, 0),
("3 MARLA", 8, 26, 1, 0, 0),
("3 MARLA", 8, 27, 4, 0, 0),
("3 MARLA", 8, 28, 38, 35, 0),
("3 MARLA", 8, 29, 37, 30, 10),
("3 MARLA", 8, 30, 24, 20, 0),
("3 MARLA", 8, 31, 43, 53, 0);


SELECT * FROM GREY_MATERIALS;
SELECT * FROM FILTER_GREY_MATERIALS;

SELECT B.MATERIAL_NAME,  A.GROUND_QTY,A.FIRST_FLOOR_QTY , A.ROOFTOP_QTY, A.BASEMENT_QTY FROM FILTER_GREY_MATERIALS AS A INNER JOIN GREY_MATERIALS AS B WHERE A.AREA_QTY="3 MARLA" AND A.LAYOUT_3_ID = 2 AND B.MATERIAL_ID=A.MATERIAL_ID;

-- -------------------------
-- INSERTING 5 MARLA QUANTITIES

INSERT INTO FILTER_GREY_MATERIALS (AREA_QTY, LAYOUT_5_ID, MATERIAL_ID, GROUND_QTY, FIRST_FLOOR_QTY, ROOFTOP_QTY, BASEMENT_QTY)
VALUES  
("5 MARLA", 1, 1, 25600, 24840, 6686, 13910),
("5 MARLA", 1, 2, 284, 249, 94, 251),
("5 MARLA", 1, 3, 1420, 1245, 470, 1255),
("5 MARLA", 1, 4, 795, 697, 263, 702),
("5 MARLA", 1, 5, 56, 48, 38, 54),
("5 MARLA", 1, 6, 56, 48, 38, 54),
("5 MARLA", 1, 7, 2, 2, 1, 0),
("5 MARLA", 1, 8, 3700, 0, 0, 0),
("5 MARLA", 1, 9, 15, 13, 9, 9),
("5 MARLA", 1, 10, 8, 7, 10, 7),
("5 MARLA", 1, 11, 1500, 1500, 350, 1500),
("5 MARLA", 1, 12, 98, 75, 30, 60),
("5 MARLA", 1, 13, 35, 28, 30, 25),
("5 MARLA", 1, 14, 9, 8, 5, 10),
("5 MARLA", 1, 15, 9, 7, 5, 6),
("5 MARLA", 1, 16, 38, 31, 15, 31),
("5 MARLA", 1, 17, 38, 31, 15, 31),
("5 MARLA", 1, 18, 52, 45, 27, 42),
("5 MARLA", 1, 19, 25, 25, 0, 0),
("5 MARLA", 1, 20, 5, 5, 0, 1),
("5 MARLA", 1, 21, 5, 5, 0, 1),
("5 MARLA", 1, 22, 2, 3, 0, 1),
("5 MARLA", 1, 23, 65, 52, 35, 18),
("5 MARLA", 1, 24, 1, 1, 0, 0),
("5 MARLA", 1, 25, 1, 0, 0, 0),
("5 MARLA", 1, 26, 1, 0, 0, 0),
("5 MARLA", 1, 27, 7, 0, 0, 0),
("5 MARLA", 1, 28, 65, 65, 0, 20),
("5 MARLA", 1, 29, 32, 30, 10, 20),
("5 MARLA", 1, 30, 25, 25, 0, 0),
("5 MARLA", 1, 31, 70, 75, 0, 38);


INSERT INTO FILTER_GREY_MATERIALS (AREA_QTY, LAYOUT_5_ID, MATERIAL_ID, GROUND_QTY, FIRST_FLOOR_QTY, ROOFTOP_QTY, BASEMENT_QTY)
VALUES  
("5 MARLA", 2, 1, 25780, 24880, 6870, 14900),
("5 MARLA", 2, 2, 290, 251, 96, 296),
("5 MARLA", 2, 3, 1450, 1255, 480, 1480),
("5 MARLA", 2, 4, 812, 704, 268, 828),
("5 MARLA", 2, 5, 57, 49, 40, 57),
("5 MARLA", 2, 6, 57, 51, 50, 54),
("5 MARLA", 2, 7, 2, 2, 1, 0),
("5 MARLA", 2, 8, 3700, 0, 0, 0),
("5 MARLA", 2, 9, 17, 14, 10, 10),
("5 MARLA", 2, 10, 9, 8, 10, 9),
("5 MARLA", 2, 11, 1500, 1500, 350, 1500),
("5 MARLA", 2, 12, 101, 75, 35, 67),
("5 MARLA", 2, 13, 37, 30, 32, 27),
("5 MARLA", 2, 14, 10, 8, 5, 10),
("5 MARLA", 2, 15, 10, 8, 5, 6),
("5 MARLA", 2, 16, 40, 34, 16, 32),
("5 MARLA", 2, 17, 40, 34, 16, 32),
("5 MARLA", 2, 18, 51, 46, 29, 45),
("5 MARLA", 2, 19, 28, 28, 0, 0),
("5 MARLA", 2, 20, 5, 5, 0, 1),
("5 MARLA", 2, 21, 5, 5, 0, 1),
("5 MARLA", 2, 22, 2, 3, 0, 1),
("5 MARLA", 2, 23, 69, 58, 40, 20),
("5 MARLA", 2, 24, 1, 1, 0, 0),
("5 MARLA", 2, 25, 1, 0, 0, 0),
("5 MARLA", 2, 26, 1, 0, 0, 0),
("5 MARLA", 2, 27, 7, 0, 0, 0),
("5 MARLA", 2, 28, 66, 66, 0, 20),
("5 MARLA", 2, 29, 31, 32, 10, 20),
("5 MARLA", 2, 30, 25, 25, 0, 0),
("5 MARLA", 2, 31, 70, 75, 0, 38);

INSERT INTO FILTER_GREY_MATERIALS (AREA_QTY, LAYOUT_5_ID, MATERIAL_ID, GROUND_QTY, FIRST_FLOOR_QTY, ROOFTOP_QTY)
VALUES 
("5 MARLA", 3, 1, 25764, 25200, 6280),
("5 MARLA", 3, 2, 287, 243, 85),
("5 MARLA", 3, 3, 1435, 1215, 425),
("5 MARLA", 3, 4, 803, 680, 238),
("5 MARLA", 3, 5, 57, 50, 33),
("5 MARLA", 3, 6, 57, 50, 33),
("5 MARLA", 3, 7, 2, 2, 1),
("5 MARLA", 3, 8, 3700, 0, 0),
("5 MARLA", 3, 9, 18, 11, 10),
("5 MARLA", 3, 10, 9, 7, 10),
("5 MARLA", 3, 11, 1500, 1500, 350),
("5 MARLA", 3, 12, 99, 74, 33),
("5 MARLA", 3, 13, 36, 30, 23),
("5 MARLA", 3, 14, 10, 9, 4),
("5 MARLA", 3, 15, 11, 7, 4),
("5 MARLA", 3, 16, 39, 32, 15),
("5 MARLA", 3, 17, 39, 32, 15),
("5 MARLA", 3, 18, 50, 45, 28),
("5 MARLA", 3, 19, 26, 26, 0),
("5 MARLA", 3, 20, 5, 5, 0),
("5 MARLA", 3, 21, 5, 5, 0),
("5 MARLA", 3, 22, 2, 3, 0),
("5 MARLA", 3, 23, 66, 60, 35),
("5 MARLA", 3, 24, 1, 1, 0),
("5 MARLA", 3, 25, 1, 0, 0),
("5 MARLA", 3, 26, 1, 0, 0),
("5 MARLA", 3, 27, 7, 0, 0),
("5 MARLA", 3, 28, 64, 64, 0),
("5 MARLA", 3, 29, 30, 32, 10),
("5 MARLA", 3, 30, 25, 25, 0),
("5 MARLA", 3, 31, 70, 75, 0);

INSERT INTO FILTER_GREY_MATERIALS (AREA_QTY, LAYOUT_5_ID, MATERIAL_ID, GROUND_QTY, FIRST_FLOOR_QTY, ROOFTOP_QTY)
VALUES 
("5 MARLA", 4, 1, 25580, 24300, 6686),
("5 MARLA", 4, 2, 282, 240, 94),
("5 MARLA", 4, 3, 1410, 1200, 470),
("5 MARLA", 4, 4, 789, 672, 263),
("5 MARLA", 4, 5, 55, 47, 38),
("5 MARLA", 4, 6, 55, 47, 38),
("5 MARLA", 4, 7, 2, 2, 1),
("5 MARLA", 4, 8, 3700, 0, 0),
("5 MARLA", 4, 9, 14, 12, 9),
("5 MARLA", 4, 10, 7, 6, 10),
("5 MARLA", 4, 11, 1500, 1500, 350),
("5 MARLA", 4, 12, 97, 74, 30),
("5 MARLA", 4, 13, 34, 27, 30),
("5 MARLA", 4, 14, 8, 7, 5),
("5 MARLA", 4, 15, 8, 6, 5),
("5 MARLA", 4, 16, 37, 30, 15),
("5 MARLA", 4, 17, 37, 30, 15),
("5 MARLA", 4, 18, 51, 44, 27),
("5 MARLA", 4, 19, 24, 24, 0),
("5 MARLA", 4, 20, 5, 5, 0),
("5 MARLA", 4, 21, 5, 5, 0),
("5 MARLA", 4, 22, 2, 3, 0),
("5 MARLA", 4, 23, 64, 51, 35),
("5 MARLA", 4, 24, 1, 1, 0),
("5 MARLA", 4, 25, 1, 0, 0),
("5 MARLA", 4, 26, 1, 0, 0),
("5 MARLA", 4, 27, 7, 0, 0),
("5 MARLA", 4, 28, 64, 64, 0),
("5 MARLA", 4, 29, 31, 29, 10),
("5 MARLA", 4, 30, 25, 25, 0),
("5 MARLA", 4, 31, 70, 75, 0);

-- 5 Marla Mirrors

INSERT INTO FILTER_GREY_MATERIALS (AREA_QTY, LAYOUT_5_ID, MATERIAL_ID, GROUND_QTY, FIRST_FLOOR_QTY, ROOFTOP_QTY, BASEMENT_QTY)
VALUES  
("5 MARLA", 5, 1, 25600, 24840, 6686, 13910),
("5 MARLA", 5, 2, 284, 249, 94, 251),
("5 MARLA", 5, 3, 1420, 1245, 470, 1255),
("5 MARLA", 5, 4, 795, 697, 263, 702),
("5 MARLA", 5, 5, 56, 48, 38, 54),
("5 MARLA", 5, 6, 56, 48, 38, 54),
("5 MARLA", 5, 7, 2, 2, 1, 0),
("5 MARLA", 5, 8, 3700, 0, 0, 0),
("5 MARLA", 5, 9, 15, 13, 9, 9),
("5 MARLA", 5, 10, 8, 7, 10, 7),
("5 MARLA", 5, 11, 1500, 1500, 350, 1500),
("5 MARLA", 5, 12, 98, 75, 30, 60),
("5 MARLA", 5, 13, 35, 28, 30, 25),
("5 MARLA", 5, 14, 9, 8, 5, 10),
("5 MARLA", 5, 15, 9, 7, 5, 6),
("5 MARLA", 5, 16, 38, 31, 15, 31),
("5 MARLA", 5, 17, 38, 31, 15, 31),
("5 MARLA", 5, 18, 52, 45, 27, 42),
("5 MARLA", 5, 19, 25, 25, 0, 0),
("5 MARLA", 5, 20, 5, 5, 0, 1),
("5 MARLA", 5, 21, 5, 5, 0, 1),
("5 MARLA", 5, 22, 2, 3, 0, 1),
("5 MARLA", 5, 23, 65, 52, 35, 18),
("5 MARLA", 5, 24, 1, 1, 0, 0),
("5 MARLA", 5, 25, 1, 0, 0, 0),
("5 MARLA", 5, 26, 1, 0, 0, 0),
("5 MARLA", 5, 27, 7, 0, 0, 0),
("5 MARLA", 5, 28, 65, 65, 0, 20),
("5 MARLA", 5, 29, 32, 30, 10, 20),
("5 MARLA", 5, 30, 25, 25, 0, 0),
("5 MARLA", 5, 31, 70, 75, 0, 38);

INSERT INTO FILTER_GREY_MATERIALS (AREA_QTY, LAYOUT_5_ID, MATERIAL_ID, GROUND_QTY, FIRST_FLOOR_QTY, ROOFTOP_QTY, BASEMENT_QTY)
VALUES  
("5 MARLA", 6, 1, 25780, 24880, 6870, 14900),
("5 MARLA", 6, 2, 290, 251, 96, 296),
("5 MARLA", 6, 3, 1450, 1255, 480, 1480),
("5 MARLA", 6, 4, 812, 704, 268, 828),
("5 MARLA", 6, 5, 57, 49, 40, 57),
("5 MARLA", 6, 6, 57, 51, 50, 54),
("5 MARLA", 6, 7, 2, 2, 1, 0),
("5 MARLA", 6, 8, 3700, 0, 0, 0),
("5 MARLA", 6, 9, 17, 14, 10, 10),
("5 MARLA", 6, 10, 9, 8, 10, 9),
("5 MARLA", 6, 11, 1500, 1500, 350, 1500),
("5 MARLA", 6, 12, 101, 75, 35, 67),
("5 MARLA", 6, 13, 37, 30, 32, 27),
("5 MARLA", 6, 14, 10, 8, 5, 10),
("5 MARLA", 6, 15, 10, 8, 5, 6),
("5 MARLA", 6, 16, 40, 34, 16, 32),
("5 MARLA", 6, 17, 40, 34, 16, 32),
("5 MARLA", 6, 18, 51, 46, 29, 45),
("5 MARLA", 6, 19, 28, 28, 0, 0),
("5 MARLA", 6, 20, 5, 5, 0, 1),
("5 MARLA", 6, 21, 5, 5, 0, 1),
("5 MARLA", 6, 22, 2, 3, 0, 1),
("5 MARLA", 6, 23, 69, 58, 40, 20),
("5 MARLA", 6, 24, 1, 1, 0, 0),
("5 MARLA", 6, 25, 1, 0, 0, 0),
("5 MARLA", 6, 26, 1, 0, 0, 0),
("5 MARLA", 6, 27, 7, 0, 0, 0),
("5 MARLA", 6, 28, 66, 66, 0, 20),
("5 MARLA", 6, 29, 31, 32, 10, 20),
("5 MARLA", 6, 30, 25, 25, 0, 0),
("5 MARLA", 6, 31, 70, 75, 0, 38);

INSERT INTO FILTER_GREY_MATERIALS (AREA_QTY, LAYOUT_5_ID, MATERIAL_ID, GROUND_QTY, FIRST_FLOOR_QTY, ROOFTOP_QTY)
VALUES 
("5 MARLA", 7, 1, 25764, 25200, 6280),
("5 MARLA", 7, 2, 287, 243, 85),
("5 MARLA", 7, 3, 1435, 1215, 425),
("5 MARLA", 7, 4, 803, 680, 238),
("5 MARLA", 7, 5, 57, 50, 33),
("5 MARLA", 7, 6, 57, 50, 33),
("5 MARLA", 7, 7, 2, 2, 1),
("5 MARLA", 7, 8, 3700, 0, 0),
("5 MARLA", 7, 9, 18, 11, 10),
("5 MARLA", 7, 10, 9, 7, 10),
("5 MARLA", 7, 11, 1500, 1500, 350),
("5 MARLA", 7, 12, 99, 74, 33),
("5 MARLA", 7, 13, 36, 30, 23),
("5 MARLA", 7, 14, 10, 9, 4),
("5 MARLA", 7, 15, 11, 7, 4),
("5 MARLA", 7, 16, 39, 32, 15),
("5 MARLA", 7, 17, 39, 32, 15),
("5 MARLA", 7, 18, 50, 45, 28),
("5 MARLA", 7, 19, 26, 26, 0),
("5 MARLA", 7, 20, 5, 5, 0),
("5 MARLA", 7, 21, 5, 5, 0),
("5 MARLA", 7, 22, 2, 3, 0),
("5 MARLA", 7, 23, 66, 60, 35),
("5 MARLA", 7, 24, 1, 1, 0),
("5 MARLA", 7, 25, 1, 0, 0),
("5 MARLA", 7, 26, 1, 0, 0),
("5 MARLA", 7, 27, 7, 0, 0),
("5 MARLA", 7, 28, 64, 64, 0),
("5 MARLA", 7, 29, 30, 32, 10),
("5 MARLA", 7, 30, 25, 25, 0),
("5 MARLA", 7, 31, 70, 75, 0);

INSERT INTO FILTER_GREY_MATERIALS (AREA_QTY, LAYOUT_5_ID, MATERIAL_ID, GROUND_QTY, FIRST_FLOOR_QTY, ROOFTOP_QTY)
VALUES 
("5 MARLA", 8, 1, 25580, 24300, 6686),
("5 MARLA", 8, 2, 282, 240, 94),
("5 MARLA", 8, 3, 1410, 1200, 470),
("5 MARLA", 8, 4, 789, 672, 263),
("5 MARLA", 8, 5, 55, 47, 38),
("5 MARLA", 8, 6, 55, 47, 38),
("5 MARLA", 8, 7, 2, 2, 1),
("5 MARLA", 8, 8, 3700, 0, 0),
("5 MARLA", 8, 9, 14, 12, 9),
("5 MARLA", 8, 10, 7, 6, 10),
("5 MARLA", 8, 11, 1500, 1500, 350),
("5 MARLA", 8, 12, 97, 74, 30),
("5 MARLA", 8, 13, 34, 27, 30),
("5 MARLA", 8, 14, 8, 7, 5),
("5 MARLA", 8, 15, 8, 6, 5),
("5 MARLA", 8, 16, 37, 30, 15),
("5 MARLA", 8, 17, 37, 30, 15),
("5 MARLA", 8, 18, 51, 44, 27),
("5 MARLA", 8, 19, 24, 24, 0),
("5 MARLA", 8, 20, 5, 5, 0),
("5 MARLA", 8, 21, 5, 5, 0),
("5 MARLA", 8, 22, 2, 3, 0),
("5 MARLA", 8, 23, 64, 51, 35),
("5 MARLA", 8, 24, 1, 1, 0),
("5 MARLA", 8, 25, 1, 0, 0),
("5 MARLA", 8, 26, 1, 0, 0),
("5 MARLA", 8, 27, 7, 0, 0),
("5 MARLA", 8, 28, 64, 64, 0),
("5 MARLA", 8, 29, 31, 29, 10),
("5 MARLA", 8, 30, 25, 25, 0),
("5 MARLA", 8, 31, 70, 75, 0);



select * from filter_grey_materials where AREA_QTY="5 MARLA" and layout_5_id=8;


-- --------------------------
-- inserting 7 Marla Quantities

INSERT INTO FILTER_GREY_MATERIALS (AREA_QTY, LAYOUT_7_ID, MATERIAL_ID, GROUND_QTY, FIRST_FLOOR_QTY, ROOFTOP_QTY, BASEMENT_QTY)
VALUES  
("7 MARLA", 1, 1, 37428, 28360, 9288, 18288),
("7 MARLA", 1, 2, 384, 249, 194, 191),
("7 MARLA", 1, 3, 1920, 1245, 970, 955),
("7 MARLA", 1, 4, 1075, 697, 543, 534),
("7 MARLA", 1, 5, 75, 67, 54, 54),
("7 MARLA", 1, 6, 75, 67, 54, 54),
("7 MARLA", 1, 7, 3, 2, 1, 0),
("7 MARLA", 1, 8, 4800, 0, 0, 0),
("7 MARLA", 1, 9, 25, 15, 10, 13),
("7 MARLA", 1, 10, 15, 8, 10, 7),
("7 MARLA", 1, 11, 2000, 2000, 350, 1500),
("7 MARLA", 1, 12, 116, 102, 46, 80),
("7 MARLA", 1, 13, 50, 34, 30, 25),
("7 MARLA", 1, 14, 12, 9, 6, 11),
("7 MARLA", 1, 15, 15, 10, 8, 9),
("7 MARLA", 1, 16, 51, 45, 18, 41),
("7 MARLA", 1, 17, 51, 45, 18, 41),
("7 MARLA", 1, 18, 68, 55, 34, 54),
("7 MARLA", 1, 19, 33, 33, 0, 0),
("7 MARLA", 1, 20, 7, 7, 0, 1),
("7 MARLA", 1, 21, 7, 7, 0, 1),
("7 MARLA", 1, 22, 4, 3, 0, 1),
("7 MARLA", 1, 23, 91, 68, 45, 20),
("7 MARLA", 1, 24, 2, 1, 0, 0),
("7 MARLA", 1, 25, 1, 0, 0, 0),
("7 MARLA", 1, 26, 1, 0, 0, 0),
("7 MARLA", 1, 27, 8, 0, 0, 0),
("7 MARLA", 1, 28, 90, 92, 0, 0),
("7 MARLA", 1, 29, 32, 30, 10, 20),
("7 MARLA", 1, 30, 35, 32, 0, 0),
("7 MARLA", 1, 31, 105, 92, 0, 30);


INSERT INTO FILTER_GREY_MATERIALS (AREA_QTY, LAYOUT_7_ID, MATERIAL_ID, GROUND_QTY, FIRST_FLOOR_QTY, ROOFTOP_QTY, BASEMENT_QTY)
VALUES  
("7 MARLA", 2, 1, 37045, 29010, 9405, 25080),
("7 MARLA", 2, 2, 374, 257, 204, 241),
("7 MARLA", 2, 3, 1870, 1285, 1020, 1205),
("7 MARLA", 2, 4, 1047.2, 719.6, 571.2, 674.8),
("7 MARLA", 2, 5, 72, 71, 58, 65),
("7 MARLA", 2, 6, 72, 71, 58, 70),
("7 MARLA", 2, 7, 3, 2, 1, 0),
("7 MARLA", 2, 8, 4800, 0, 0, 0),
("7 MARLA", 2, 9, 22, 19, 14, 13),
("7 MARLA", 2, 10, 12, 12, 14, 7),
("7 MARLA", 2, 11, 2000, 2000, 350, 1500),
("7 MARLA", 2, 12, 113, 106, 50, 80),
("7 MARLA", 2, 13, 47, 38, 34, 25),
("7 MARLA", 2, 14, 9, 13, 10, 11),
("7 MARLA", 2, 15, 12, 14, 12, 9),
("7 MARLA", 2, 16, 48, 49, 22, 41),
("7 MARLA", 2, 17, 48, 49, 22, 41),
("7 MARLA", 2, 18, 65, 59, 38, 54),
("7 MARLA", 2, 19, 30, 37, 4, 15),
("7 MARLA", 2, 20, 7, 7, 0, 1),
("7 MARLA", 2, 21, 7, 7, 0, 1),
("7 MARLA", 2, 22, 4, 3, 0, 1),
("7 MARLA", 2, 23, 88, 72, 49, 20),
("7 MARLA", 2, 24, 2, 1, 0, 0),
("7 MARLA", 2, 25, 1, 0, 0, 0),
("7 MARLA", 2, 26, 1, 0, 0, 0),
("7 MARLA", 2, 27, 8, 0, 0, 0),
("7 MARLA", 2, 28, 87, 96, 4, 32),
("7 MARLA", 2, 29, 29, 34, 14, 25),
("7 MARLA", 2, 30, 32, 36, 4, 0),
("7 MARLA", 2, 31, 102, 96, 4, 0);

INSERT INTO FILTER_GREY_MATERIALS (AREA_QTY, LAYOUT_7_ID, MATERIAL_ID, GROUND_QTY, FIRST_FLOOR_QTY, ROOFTOP_QTY)
VALUES 
("7 MARLA", 3, 1, 37370, 30475, 9545),
("7 MARLA", 3, 2, 379, 305, 215),
("7 MARLA", 3, 3, 1895, 1525, 1075),
("7 MARLA", 3, 4, 1061.2, 854, 602),
("7 MARLA", 3, 5, 75, 74, 68),
("7 MARLA", 3, 6, 75, 74, 68),
("7 MARLA", 3, 7, 3, 2, 1),
("7 MARLA", 3, 8, 4800, 0, 0),
("7 MARLA", 3, 9, 25, 22, 24),
("7 MARLA", 3, 10, 15, 15, 24),
("7 MARLA", 3, 11, 2000, 2000, 350),
("7 MARLA", 3, 12, 116, 109, 60),
("7 MARLA", 3, 13, 50, 41, 44),
("7 MARLA", 3, 14, 12, 16, 20),
("7 MARLA", 3, 15, 15, 17, 22),
("7 MARLA", 3, 16, 51, 52, 32),
("7 MARLA", 3, 17, 51, 52, 32),
("7 MARLA", 3, 18, 68, 62, 48),
("7 MARLA", 3, 19, 33, 40, 14),
("7 MARLA", 3, 20, 7, 7, 0),
("7 MARLA", 3, 21, 7, 7, 0),
("7 MARLA", 3, 22, 4, 3, 0),
("7 MARLA", 3, 23, 91, 75, 59),
("7 MARLA", 3, 24, 2, 1, 0),
("7 MARLA", 3, 25, 1, 0, 0),
("7 MARLA", 3, 26, 1, 0, 0),
("7 MARLA", 3, 27, 8, 0, 0),
("7 MARLA", 3, 28, 90, 99, 14),
("7 MARLA", 3, 29, 32, 37, 24),
("7 MARLA", 3, 30, 35, 39, 14),
("7 MARLA", 3, 31, 105, 99, 14);

INSERT INTO FILTER_GREY_MATERIALS (AREA_QTY, LAYOUT_7_ID, MATERIAL_ID, GROUND_QTY, FIRST_FLOOR_QTY, ROOFTOP_QTY)
VALUES 
("7 MARLA", 4, 1, 37620, 31080, 9480),
("7 MARLA", 4, 2, 385, 299, 211),
("7 MARLA", 4, 3, 1925, 1495, 1055),
("7 MARLA", 4, 4, 1078, 837.2, 590.8),
("7 MARLA", 4, 5, 78, 72, 66),
("7 MARLA", 4, 6, 78, 72, 66),
("7 MARLA", 4, 7, 3, 2, 1),
("7 MARLA", 4, 8, 4800, 0, 0),
("7 MARLA", 4, 9, 28, 20, 22),
("7 MARLA", 4, 10, 18, 13, 22),
("7 MARLA", 4, 11, 2000, 2000, 350),
("7 MARLA", 4, 12, 119, 107, 58),
("7 MARLA", 4, 13, 53, 39, 42),
("7 MARLA", 4, 14, 15, 14, 18),
("7 MARLA", 4, 15, 18, 15, 20),
("7 MARLA", 4, 16, 54, 50, 30),
("7 MARLA", 4, 17, 54, 50, 30),
("7 MARLA", 4, 18, 71, 60, 46),
("7 MARLA", 4, 19, 36, 38, 12),
("7 MARLA", 4, 20, 7, 7, 0),
("7 MARLA", 4, 21, 7, 7, 0),
("7 MARLA", 4, 22, 4, 3, 0),
("7 MARLA", 4, 23, 94, 73, 57),
("7 MARLA", 4, 24, 2, 1, 0),
("7 MARLA", 4, 25, 1, 0, 0),
("7 MARLA", 4, 26, 1, 0, 0),
("7 MARLA", 4, 27, 8, 0, 0),
("7 MARLA", 4, 28, 93, 97, 12),
("7 MARLA", 4, 29, 35, 35, 22),
("7 MARLA", 4, 30, 38, 37, 12),
("7 MARLA", 4, 31, 108, 97, 12);

-- Mirror of 7 Marla

INSERT INTO FILTER_GREY_MATERIALS (AREA_QTY, LAYOUT_7_ID, MATERIAL_ID, GROUND_QTY, FIRST_FLOOR_QTY, ROOFTOP_QTY, BASEMENT_QTY)
VALUES  
("7 MARLA", 5, 1, 37428, 28360, 9288, 18288),
("7 MARLA", 5, 2, 384, 249, 194, 191),
("7 MARLA", 5, 3, 1920, 1245, 970, 955),
("7 MARLA", 5, 4, 1075, 697, 543, 534),
("7 MARLA", 5, 5, 75, 67, 54, 54),
("7 MARLA", 5, 6, 75, 67, 54, 54),
("7 MARLA", 5, 7, 3, 2, 1, 0),
("7 MARLA", 5, 8, 4800, 0, 0, 0),
("7 MARLA", 5, 9, 25, 15, 10, 13),
("7 MARLA", 5, 10, 15, 8, 10, 7),
("7 MARLA", 5, 11, 2000, 2000, 350, 1500),
("7 MARLA", 5, 12, 116, 102, 46, 80),
("7 MARLA", 5, 13, 50, 34, 30, 25),
("7 MARLA", 5, 14, 12, 9, 6, 11),
("7 MARLA", 5, 15, 15, 10, 8, 9),
("7 MARLA", 5, 16, 51, 45, 18, 41),
("7 MARLA", 5, 17, 51, 45, 18, 41),
("7 MARLA", 5, 18, 68, 55, 34, 54),
("7 MARLA", 5, 19, 33, 33, 0, 0),
("7 MARLA", 5, 20, 7, 7, 0, 1),
("7 MARLA", 5, 21, 7, 7, 0, 1),
("7 MARLA", 5, 22, 4, 3, 0, 1),
("7 MARLA", 5, 23, 91, 68, 45, 20),
("7 MARLA", 5, 24, 2, 1, 0, 0),
("7 MARLA", 5, 25, 1, 0, 0, 0),
("7 MARLA", 5, 26, 1, 0, 0, 0),
("7 MARLA", 5, 27, 8, 0, 0, 0),
("7 MARLA", 5, 28, 90, 92, 0, 0),
("7 MARLA", 5, 29, 32, 30, 10, 20),
("7 MARLA", 5, 30, 35, 32, 0, 0),
("7 MARLA", 5, 31, 105, 92, 0, 30);

INSERT INTO FILTER_GREY_MATERIALS (AREA_QTY, LAYOUT_7_ID, MATERIAL_ID, GROUND_QTY, FIRST_FLOOR_QTY, ROOFTOP_QTY, BASEMENT_QTY)
VALUES  
("7 MARLA", 6, 1, 37045, 29010, 9405, 25080),
("7 MARLA", 6, 2, 374, 257, 204, 241),
("7 MARLA", 6, 3, 1870, 1285, 1020, 1205),
("7 MARLA", 6, 4, 1047.2, 719.6, 571.2, 674.8),
("7 MARLA", 6, 5, 72, 71, 58, 65),
("7 MARLA", 6, 6, 72, 71, 58, 70),
("7 MARLA", 6, 7, 3, 2, 1, 0),
("7 MARLA", 6, 8, 4800, 0, 0, 0),
("7 MARLA", 6, 9, 22, 19, 14, 13),
("7 MARLA", 6, 10, 12, 12, 14, 7),
("7 MARLA", 6, 11, 2000, 2000, 350, 1500),
("7 MARLA", 6, 12, 113, 106, 50, 80),
("7 MARLA", 6, 13, 47, 38, 34, 25),
("7 MARLA", 6, 14, 9, 13, 10, 11),
("7 MARLA", 6, 15, 12, 14, 12, 9),
("7 MARLA", 6, 16, 48, 49, 22, 41),
("7 MARLA", 6, 17, 48, 49, 22, 41),
("7 MARLA", 6, 18, 65, 59, 38, 54),
("7 MARLA", 6, 19, 30, 37, 4, 15),
("7 MARLA", 6, 20, 7, 7, 0, 1),
("7 MARLA", 6, 21, 7, 7, 0, 1),
("7 MARLA", 6, 22, 4, 3, 0, 1),
("7 MARLA", 6, 23, 88, 72, 49, 20),
("7 MARLA", 6, 24, 2, 1, 0, 0),
("7 MARLA", 6, 25, 1, 0, 0, 0),
("7 MARLA", 6, 26, 1, 0, 0, 0),
("7 MARLA", 6, 27, 8, 0, 0, 0),
("7 MARLA", 6, 28, 87, 96, 4, 32),
("7 MARLA", 6, 29, 29, 34, 14, 25),
("7 MARLA", 6, 30, 32, 36, 4, 0),
("7 MARLA", 6, 31, 102, 96, 4, 0);

INSERT INTO FILTER_GREY_MATERIALS (AREA_QTY, LAYOUT_7_ID, MATERIAL_ID, GROUND_QTY, FIRST_FLOOR_QTY, ROOFTOP_QTY)
VALUES 
("7 MARLA", 7, 1, 37370, 30475, 9545),
("7 MARLA", 7, 2, 379, 305, 215),
("7 MARLA", 7, 3, 1895, 1525, 1075),
("7 MARLA", 7, 4, 1061.2, 854, 602),
("7 MARLA", 7, 5, 75, 74, 68),
("7 MARLA", 7, 6, 75, 74, 68),
("7 MARLA", 7, 7, 3, 2, 1),
("7 MARLA", 7, 8, 4800, 0, 0),
("7 MARLA", 7, 9, 25, 22, 24),
("7 MARLA", 7, 10, 15, 15, 24),
("7 MARLA", 7, 11, 2000, 2000, 350),
("7 MARLA", 7, 12, 116, 109, 60),
("7 MARLA", 7, 13, 50, 41, 44),
("7 MARLA", 7, 14, 12, 16, 20),
("7 MARLA", 7, 15, 15, 17, 22),
("7 MARLA", 7, 16, 51, 52, 32),
("7 MARLA", 7, 17, 51, 52, 32),
("7 MARLA", 7, 18, 68, 62, 48),
("7 MARLA", 7, 19, 33, 40, 14),
("7 MARLA", 7, 20, 7, 7, 0),
("7 MARLA", 7, 21, 7, 7, 0),
("7 MARLA", 7, 22, 4, 3, 0),
("7 MARLA", 7, 23, 91, 75, 59),
("7 MARLA", 7, 24, 2, 1, 0),
("7 MARLA", 7, 25, 1, 0, 0),
("7 MARLA", 7, 26, 1, 0, 0),
("7 MARLA", 7, 27, 8, 0, 0),
("7 MARLA", 7, 28, 90, 99, 14),
("7 MARLA", 7, 29, 32, 37, 24),
("7 MARLA", 7, 30, 35, 39, 14),
("7 MARLA", 7, 31, 105, 99, 14);


INSERT INTO FILTER_GREY_MATERIALS (AREA_QTY, LAYOUT_7_ID, MATERIAL_ID, GROUND_QTY, FIRST_FLOOR_QTY, ROOFTOP_QTY)
VALUES 
("7 MARLA", 8, 1, 37620, 31080, 9480),
("7 MARLA", 8, 2, 385, 299, 211),
("7 MARLA", 8, 3, 1925, 1495, 1055),
("7 MARLA", 8, 4, 1078, 837.2, 590.8),
("7 MARLA", 8, 5, 78, 72, 66),
("7 MARLA", 8, 6, 78, 72, 66),
("7 MARLA", 8, 7, 3, 2, 1),
("7 MARLA", 8, 8, 4800, 0, 0),
("7 MARLA", 8, 9, 28, 20, 22),
("7 MARLA", 8, 10, 18, 13, 22),
("7 MARLA", 8, 11, 2000, 2000, 350),
("7 MARLA", 8, 12, 119, 107, 58),
("7 MARLA", 8, 13, 53, 39, 42),
("7 MARLA", 8, 14, 15, 14, 18),
("7 MARLA", 8, 15, 18, 15, 20),
("7 MARLA", 8, 16, 54, 50, 30),
("7 MARLA", 8, 17, 54, 50, 30),
("7 MARLA", 8, 18, 71, 60, 46),
("7 MARLA", 8, 19, 36, 38, 12),
("7 MARLA", 8, 20, 7, 7, 0),
("7 MARLA", 8, 21, 7, 7, 0),
("7 MARLA", 8, 22, 4, 3, 0),
("7 MARLA", 8, 23, 94, 73, 57),
("7 MARLA", 8, 24, 2, 1, 0),
("7 MARLA", 8, 25, 1, 0, 0),
("7 MARLA", 8, 26, 1, 0, 0),
("7 MARLA", 8, 27, 8, 0, 0),
("7 MARLA", 8, 28, 93, 97, 12),
("7 MARLA", 8, 29, 35, 35, 22),
("7 MARLA", 8, 30, 38, 37, 12),
("7 MARLA", 8, 31, 108, 97, 12);



select * from filter_grey_materials where area_qty = "7 MARLA" and layout_7_id = '8';

SELECT B.MATERIAL_NAME,  A.GROUND_QTY,A.FIRST_FLOOR_QTY , A.ROOFTOP_QTY, A.BASEMENT_QTY FROM FILTER_GREY_MATERIALS AS A INNER JOIN GREY_MATERIALS AS B WHERE A.AREA_QTY="7 MARLA" AND A.LAYOUT_7_ID = 2 AND B.MATERIAL_ID=A.MATERIAL_ID;



-- --------------------------------
-- inserting 10 Marla Quantities

INSERT INTO FILTER_GREY_MATERIALS (AREA_QTY, LAYOUT_10_ID, MATERIAL_ID, GROUND_QTY, FIRST_FLOOR_QTY, ROOFTOP_QTY, BASEMENT_QTY)
VALUES  
("10 MARLA", 1, 1, 47471, 38760, 12160, 29467),
("10 MARLA", 1, 2, 485, 370, 260, 298),
("10 MARLA", 1, 3, 2425, 1850, 1300, 1490),
("10 MARLA", 1, 4, 1358, 1036, 728, 834.4),
("10 MARLA", 1, 5, 98, 88, 61, 85),
("10 MARLA", 1, 6, 98, 88, 61, 85),
("10 MARLA", 1, 7, 3, 2, 1, 0),
("10 MARLA", 1, 8, 6200, 0, 0, 0),
("10 MARLA", 1, 9, 35, 21, 14, 13),
("10 MARLA", 1, 10, 19, 13, 10, 7),
("10 MARLA", 1, 11, 2500, 2200, 400, 1500),
("10 MARLA", 1, 12, 158, 132, 51, 80),
("10 MARLA", 1, 13, 57, 49, 30, 25),
("10 MARLA", 1, 14, 14, 11, 8, 11),
("10 MARLA", 1, 15, 19, 13, 10, 12),
("10 MARLA", 1, 16, 64, 52, 24, 50),
("10 MARLA", 1, 17, 64, 52, 24, 50),
("10 MARLA", 1, 18, 91, 73, 44, 54),
("10 MARLA", 1, 19, 42, 42, 0, 0),
("10 MARLA", 1, 20, 10, 10, 0, 1),
("10 MARLA", 1, 21, 10, 10, 0, 1),
("10 MARLA", 1, 22, 5, 5, 0, 1),
("10 MARLA", 1, 23, 117, 88, 52, 20),
("10 MARLA", 1, 24, 2, 1, 0, 0),
("10 MARLA", 1, 25, 1, 0, 0, 0),
("10 MARLA", 1, 26, 1, 0, 0, 0),
("10 MARLA", 1, 27, 9, 2, 0, 0),
("10 MARLA", 1, 28, 110, 119, 0, 0),
("10 MARLA", 1, 29, 42, 42, 16, 20),
("10 MARLA", 1, 30, 52, 56, 0, 0),
("10 MARLA", 1, 31, 157, 124, 0, 20);

INSERT INTO FILTER_GREY_MATERIALS (AREA_QTY, LAYOUT_10_ID, MATERIAL_ID, GROUND_QTY, FIRST_FLOOR_QTY, ROOFTOP_QTY, BASEMENT_QTY)
VALUES  
("10 MARLA", 2, 1, 46995, 38050, 11870, 31786),
("10 MARLA", 2, 2, 473, 366, 257, 302),
("10 MARLA", 2, 3, 2365, 1830, 1285, 1510),
("10 MARLA", 2, 4, 1320, 1016, 719, 845),
("10 MARLA", 2, 5, 93, 84, 58, 89),
("10 MARLA", 2, 6, 93, 84, 58, 89),
("10 MARLA", 2, 7, 3, 2, 1, 0),
("10 MARLA", 2, 8, 6200, 0, 0, 0),
("10 MARLA", 2, 9, 30, 17, 11, 17),
("10 MARLA", 2, 10, 14, 9, 7, 11),
("10 MARLA", 2, 11, 2500, 2200, 400, 1500),
("10 MARLA", 2, 12, 153, 128, 48, 84),
("10 MARLA", 2, 13, 52, 45, 27, 29),
("10 MARLA", 2, 14, 9, 7, 5, 15),
("10 MARLA", 2, 15, 14, 9, 7, 16),
("10 MARLA", 2, 16, 59, 48, 21, 54),
("10 MARLA", 2, 17, 59, 48, 21, 54),
("10 MARLA", 2, 18, 86, 69, 41, 58),
("10 MARLA", 2, 19, 37, 38, 0, 4),
("10 MARLA", 2, 20, 10, 10, 0, 1),
("10 MARLA", 2, 21, 10, 10, 0, 1),
("10 MARLA", 2, 22, 5, 5, 0, 1),
("10 MARLA", 2, 23, 112, 84, 49, 24),
("10 MARLA", 2, 24, 2, 1, 0, 0),
("10 MARLA", 2, 25, 1, 0, 0, 0),
("10 MARLA", 2, 26, 1, 0, 0, 0),
("10 MARLA", 2, 27, 9, 2, 0, 0),
("10 MARLA", 2, 28, 105, 115, 0, 4),
("10 MARLA", 2, 29, 37, 38, 0, 24),
("10 MARLA", 2, 30, 47, 52, 0, 4),
("10 MARLA", 2, 31, 152, 120, 0, 24);


INSERT INTO FILTER_GREY_MATERIALS (AREA_QTY, LAYOUT_10_ID, MATERIAL_ID, GROUND_QTY, FIRST_FLOOR_QTY, ROOFTOP_QTY)
VALUES  
("10 MARLA", 3, 1, 47205, 37805, 12305),
("10 MARLA", 3, 2, 481, 372, 264),
("10 MARLA", 3, 3, 2405, 1860, 1320),
("10 MARLA", 3, 4, 1346, 1041, 740),
("10 MARLA", 3, 5, 96, 82, 61),
("10 MARLA", 3, 6, 96, 82, 63),
("10 MARLA", 3, 7, 3, 2, 1),
("10 MARLA", 3, 8, 6200, 0, 0),
("10 MARLA", 3, 9, 33, 15, 14),
("10 MARLA", 3, 10, 17, 7, 10),
("10 MARLA", 3, 11, 2500, 2200, 400),
("10 MARLA", 3, 12, 156, 126, 51),
("10 MARLA", 3, 13, 55, 43, 30),
("10 MARLA", 3, 14, 12, 5, 8),
("10 MARLA", 3, 15, 17, 7, 10),
("10 MARLA", 3, 16, 62, 46, 24),
("10 MARLA", 3, 17, 62, 46, 24),
("10 MARLA", 3, 18, 89, 67, 44),
("10 MARLA", 3, 19, 40, 36, 3),
("10 MARLA", 3, 20, 10, 10, 0),
("10 MARLA", 3, 21, 10, 10, 0),
("10 MARLA", 3, 22, 5, 5, 0),
("10 MARLA", 3, 23, 115, 82, 52),
("10 MARLA", 3, 24, 2, 1, 0),
("10 MARLA", 3, 25, 1, 0, 0),
("10 MARLA", 3, 26, 1, 0, 0),
("10 MARLA", 3, 27, 9, 2, 0),
("10 MARLA", 3, 28, 108, 113, 3),
("10 MARLA", 3, 29, 40, 36, 3),
("10 MARLA", 3, 30, 50, 50, 3),
("10 MARLA", 3, 31, 155, 118, 3);


INSERT INTO FILTER_GREY_MATERIALS (AREA_QTY, LAYOUT_10_ID, MATERIAL_ID, GROUND_QTY, FIRST_FLOOR_QTY, ROOFTOP_QTY)
VALUES  
("10 MARLA", 4, 1, 47380, 38563, 12280),
("10 MARLA", 4, 2, 482, 368, 260),
("10 MARLA", 4, 3, 2410, 1840, 1300),
("10 MARLA", 4, 4, 1349, 1030, 728),
("10 MARLA", 4, 5, 98, 86, 59),
("10 MARLA", 4, 6, 98, 86, 61),
("10 MARLA", 4, 7, 3, 2, 1),
("10 MARLA", 4, 8, 6200, 0, 0),
("10 MARLA", 4, 9, 35, 19, 12),
("10 MARLA", 4, 10, 19, 11, 8),
("10 MARLA", 4, 11, 2500, 2200, 400),
("10 MARLA", 4, 12, 158, 130, 49),
("10 MARLA", 4, 13, 57, 47, 28),
("10 MARLA", 4, 14, 14, 9, 6),
("10 MARLA", 4, 15, 19, 11, 8),
("10 MARLA", 4, 16, 64, 50, 22),
("10 MARLA", 4, 17, 64, 50, 22),
("10 MARLA", 4, 18, 91, 71, 42),
("10 MARLA", 4, 19, 42, 40, 1),
("10 MARLA", 4, 20, 10, 10, 0),
("10 MARLA", 4, 21, 10, 10, 0),
("10 MARLA", 4, 22, 5, 5, 0),
("10 MARLA", 4, 23, 117, 86, 50),
("10 MARLA", 4, 24, 2, 1, 0),
("10 MARLA", 4, 25, 1, 0, 0),
("10 MARLA", 4, 26, 1, 0, 0),
("10 MARLA", 4, 27, 9, 2, 0),
("10 MARLA", 4, 28, 110, 117, 1),
("10 MARLA", 4, 29, 42, 40, 1),
("10 MARLA", 4, 30, 52, 54, 1),
("10 MARLA", 4, 31, 157, 122, 1);

-- Mirror of 10 Marla Quantities

INSERT INTO FILTER_GREY_MATERIALS (AREA_QTY, LAYOUT_10_ID, MATERIAL_ID, GROUND_QTY, FIRST_FLOOR_QTY, ROOFTOP_QTY, BASEMENT_QTY)
VALUES  
("10 MARLA", 5, 1, 47471, 38760, 12160, 29467),
("10 MARLA", 5, 2, 485, 370, 260, 298),
("10 MARLA", 5, 3, 2425, 1850, 1300, 1490),
("10 MARLA", 5, 4, 1358, 1036, 728, 834.4),
("10 MARLA", 5, 5, 98, 88, 61, 85),
("10 MARLA", 5, 6, 98, 88, 61, 85),
("10 MARLA", 5, 7, 3, 2, 1, 0),
("10 MARLA", 5, 8, 6200, 0, 0, 0),
("10 MARLA", 5, 9, 35, 21, 14, 13),
("10 MARLA", 5, 10, 19, 13, 10, 7),
("10 MARLA", 5, 11, 2500, 2200, 400, 1500),
("10 MARLA", 5, 12, 158, 132, 51, 80),
("10 MARLA", 5, 13, 57, 49, 30, 25),
("10 MARLA", 5, 14, 14, 11, 8, 11),
("10 MARLA", 5, 15, 19, 13, 10, 12),
("10 MARLA", 5, 16, 64, 52, 24, 50),
("10 MARLA", 5, 17, 64, 52, 24, 50),
("10 MARLA", 5, 18, 91, 73, 44, 54),
("10 MARLA", 5, 19, 42, 42, 0, 0),
("10 MARLA", 5, 20, 10, 10, 0, 1),
("10 MARLA", 5, 21, 10, 10, 0, 1),
("10 MARLA", 5, 22, 5, 5, 0, 1),
("10 MARLA", 5, 23, 117, 88, 52, 20),
("10 MARLA", 5, 24, 2, 1, 0, 0),
("10 MARLA", 5, 25, 1, 0, 0, 0),
("10 MARLA", 5, 26, 1, 0, 0, 0),
("10 MARLA", 5, 27, 9, 2, 0, 0),
("10 MARLA", 5, 28, 110, 119, 0, 0),
("10 MARLA", 5, 29, 42, 42, 16, 20),
("10 MARLA", 5, 30, 52, 56, 0, 0),
("10 MARLA", 5, 31, 157, 124, 0, 20);

INSERT INTO FILTER_GREY_MATERIALS (AREA_QTY, LAYOUT_10_ID, MATERIAL_ID, GROUND_QTY, FIRST_FLOOR_QTY, ROOFTOP_QTY, BASEMENT_QTY)
VALUES  
("10 MARLA", 6, 1, 46995, 38050, 11870, 31786),
("10 MARLA", 6, 2, 473, 366, 257, 302),
("10 MARLA", 6, 3, 2365, 1830, 1285, 1510),
("10 MARLA", 6, 4, 1320, 1016, 719, 845),
("10 MARLA", 6, 5, 93, 84, 58, 89),
("10 MARLA", 6, 6, 93, 84, 58, 89),
("10 MARLA", 6, 7, 3, 2, 1, 0),
("10 MARLA", 6, 8, 6200, 0, 0, 0),
("10 MARLA", 6, 9, 30, 17, 11, 17),
("10 MARLA", 6, 10, 14, 9, 7, 11),
("10 MARLA", 6, 11, 2500, 2200, 400, 1500),
("10 MARLA", 6, 12, 153, 128, 48, 84),
("10 MARLA", 6, 13, 52, 45, 27, 29),
("10 MARLA", 6, 14, 9, 7, 5, 15),
("10 MARLA", 6, 15, 14, 9, 7, 16),
("10 MARLA", 6, 16, 59, 48, 21, 54),
("10 MARLA", 6, 17, 59, 48, 21, 54),
("10 MARLA", 6, 18, 86, 69, 41, 58),
("10 MARLA", 6, 19, 37, 38, 0, 4),
("10 MARLA", 6, 20, 10, 10, 0, 1),
("10 MARLA", 6, 21, 10, 10, 0, 1),
("10 MARLA", 6, 22, 5, 5, 0, 1),
("10 MARLA", 6, 23, 112, 84, 49, 24),
("10 MARLA", 6, 24, 2, 1, 0, 0),
("10 MARLA", 6, 25, 1, 0, 0, 0),
("10 MARLA", 6, 26, 1, 0, 0, 0),
("10 MARLA", 6, 27, 9, 2, 0, 0),
("10 MARLA", 6, 28, 105, 115, 0, 4),
("10 MARLA", 6, 29, 37, 38, 0, 24),
("10 MARLA", 6, 30, 47, 52, 0, 4),
("10 MARLA", 6, 31, 152, 120, 0, 24);


INSERT INTO FILTER_GREY_MATERIALS (AREA_QTY, LAYOUT_10_ID, MATERIAL_ID, GROUND_QTY, FIRST_FLOOR_QTY, ROOFTOP_QTY)
VALUES  
("10 MARLA", 7, 1, 47205, 37805, 12305),
("10 MARLA", 7, 2, 481, 372, 264),
("10 MARLA", 7, 3, 2405, 1860, 1320),
("10 MARLA", 7, 4, 1346, 1041, 740),
("10 MARLA", 7, 5, 96, 82, 61),
("10 MARLA", 7, 6, 96, 82, 63),
("10 MARLA", 7, 7, 3, 2, 1),
("10 MARLA", 7, 8, 6200, 0, 0),
("10 MARLA", 7, 9, 33, 15, 14),
("10 MARLA", 7, 10, 17, 7, 10),
("10 MARLA", 7, 11, 2500, 2200, 400),
("10 MARLA", 7, 12, 156, 126, 51),
("10 MARLA", 7, 13, 55, 43, 30),
("10 MARLA", 7, 14, 12, 5, 8),
("10 MARLA", 7, 15, 17, 7, 10),
("10 MARLA", 7, 16, 62, 46, 24),
("10 MARLA", 7, 17, 62, 46, 24),
("10 MARLA", 7, 18, 89, 67, 44),
("10 MARLA", 7, 19, 40, 36, 3),
("10 MARLA", 7, 20, 10, 10, 0),
("10 MARLA", 7, 21, 10, 10, 0),
("10 MARLA", 7, 22, 5, 5, 0),
("10 MARLA", 7, 23, 115, 82, 52),
("10 MARLA", 7, 24, 2, 1, 0),
("10 MARLA", 7, 25, 1, 0, 0),
("10 MARLA", 7, 26, 1, 0, 0),
("10 MARLA", 7, 27, 9, 2, 0),
("10 MARLA", 7, 28, 108, 113, 3),
("10 MARLA", 7, 29, 40, 36, 3),
("10 MARLA", 7, 30, 50, 50, 3),
("10 MARLA", 7, 31, 155, 118, 3);

INSERT INTO FILTER_GREY_MATERIALS (AREA_QTY, LAYOUT_10_ID, MATERIAL_ID, GROUND_QTY, FIRST_FLOOR_QTY, ROOFTOP_QTY)
VALUES  
("10 MARLA", 8, 1, 47380, 38563, 12280),
("10 MARLA", 8, 2, 482, 368, 260),
("10 MARLA", 8, 3, 2410, 1840, 1300),
("10 MARLA", 8, 4, 1349, 1030, 728),
("10 MARLA", 8, 5, 98, 86, 59),
("10 MARLA", 8, 6, 98, 86, 61),
("10 MARLA", 8, 7, 3, 2, 1),
("10 MARLA", 8, 8, 6200, 0, 0),
("10 MARLA", 8, 9, 35, 19, 12),
("10 MARLA", 8, 10, 19, 11, 8),
("10 MARLA", 8, 11, 2500, 2200, 400),
("10 MARLA", 8, 12, 158, 130, 49),
("10 MARLA", 8, 13, 57, 47, 28),
("10 MARLA", 8, 14, 14, 9, 6),
("10 MARLA", 8, 15, 19, 11, 8),
("10 MARLA", 8, 16, 64, 50, 22),
("10 MARLA", 8, 17, 64, 50, 22),
("10 MARLA", 8, 18, 91, 71, 42),
("10 MARLA", 8, 19, 42, 40, 1),
("10 MARLA", 8, 20, 10, 10, 0),
("10 MARLA", 8, 21, 10, 10, 0),
("10 MARLA", 8, 22, 5, 5, 0),
("10 MARLA", 8, 23, 117, 86, 50),
("10 MARLA", 8, 24, 2, 1, 0),
("10 MARLA", 8, 25, 1, 0, 0),
("10 MARLA", 8, 26, 1, 0, 0),
("10 MARLA", 8, 27, 9, 2, 0),
("10 MARLA", 8, 28, 110, 117, 1),
("10 MARLA", 8, 29, 42, 40, 1),
("10 MARLA", 8, 30, 52, 54, 1),
("10 MARLA", 8, 31, 157, 122, 1);


select * from filter_grey_materials where area_qty="10 MARLA" and layout_10_id = "8";

SELECT B.MATERIAL_NAME,B.BRAND,  A.GROUND_QTY,A.FIRST_FLOOR_QTY , A.ROOFTOP_QTY, A.BASEMENT_QTY FROM FILTER_GREY_MATERIALS AS A INNER JOIN GREY_MATERIALS AS B WHERE A.AREA_QTY="10 MARLA" AND A.LAYOUT_10_ID = 5 AND B.MATERIAL_ID=A.MATERIAL_ID;

-- -------------------------------------

-- INSERTING 20 MARLA QUANTITIES

INSERT INTO FILTER_GREY_MATERIALS (AREA_QTY, LAYOUT_20_ID, MATERIAL_ID, GROUND_QTY, FIRST_FLOOR_QTY, ROOFTOP_QTY, BASEMENT_QTY)
VALUES  
("20 MARLA", 1, 1, 92970, 78970, 26061, 48694),
("20 MARLA", 1, 2, 985, 835, 360, 506),
("20 MARLA", 1, 3, 4925, 4175, 1800, 2530),
("20 MARLA", 1, 4, 2758, 2338, 1008, 1416.8),
("20 MARLA", 1, 5, 198, 178, 91, 180),
("20 MARLA", 1, 6, 198, 178, 91, 104),
("20 MARLA", 1, 7, 5, 5, 3, 2),
("20 MARLA", 1, 8, 12000, 0, 0, 0),
("20 MARLA", 1, 9, 55, 39, 35, 21),
("20 MARLA", 1, 10, 37, 27, 21, 20),
("20 MARLA", 1, 11, 5000, 4500, 600, 5000),
("20 MARLA", 1, 12, 308, 272, 81, 201),
("20 MARLA", 1, 13, 119, 103, 48, 110),
("20 MARLA", 1, 14, 34, 28, 12, 20),
("20 MARLA", 1, 15, 39, 27, 10, 12),
("20 MARLA", 1, 16, 109, 89, 55, 50),
("20 MARLA", 1, 17, 109, 89, 55, 50),
("20 MARLA", 1, 18, 178, 126, 67, 54),
("20 MARLA", 1, 19, 75, 75, 0, 0),
("20 MARLA", 1, 20, 20, 20, 0, 1),
("20 MARLA", 1, 21, 20, 20, 0, 1),
("20 MARLA", 1, 22, 10, 10, 0, 1),
("20 MARLA", 1, 23, 237, 158, 92, 20),
("20 MARLA", 1, 24, 3, 2, 0, 0),
("20 MARLA", 1, 25, 1, 0, 0, 0),
("20 MARLA", 1, 26, 1, 0, 0, 0),
("20 MARLA", 1, 27, 11, 11, 0, 0),
("20 MARLA", 1, 28, 210, 210, 0, 0),
("20 MARLA", 1, 29, 68, 68, 24, 20),
("20 MARLA", 1, 30, 102, 104, 0, 0),
("20 MARLA", 1, 31, 359, 302, 0, 20);


INSERT INTO FILTER_GREY_MATERIALS (AREA_QTY, LAYOUT_20_ID, MATERIAL_ID, GROUND_QTY, FIRST_FLOOR_QTY, ROOFTOP_QTY, BASEMENT_QTY)
VALUES  
("20 MARLA", 2, 1, 93206, 78330, 25890, 67890),
("20 MARLA", 2, 2, 990, 830, 358, 523),
("20 MARLA", 2, 3, 4950, 4150, 1790, 2615),
("20 MARLA", 2, 4, 2772, 2324, 1002.4, 1464.4),
("20 MARLA", 2, 5, 200, 176, 90, 184),
("20 MARLA", 2, 6, 200, 176, 90, 108),
("20 MARLA", 2, 7, 7, 3, 2, 4),
("20 MARLA", 2, 8, 12000, 0, 0, 0),
("20 MARLA", 2, 9, 57, 37, 34, 25),
("20 MARLA", 2, 10, 39, 25, 20, 24),
("20 MARLA", 2, 11, 5000, 4500, 600, 5000),
("20 MARLA", 2, 12, 310, 270, 80, 205),
("20 MARLA", 2, 13, 121, 101, 47, 114),
("20 MARLA", 2, 14, 36, 26, 11, 24),
("20 MARLA", 2, 15, 41, 25, 9, 16),
("20 MARLA", 2, 16, 111, 87, 54, 54),
("20 MARLA", 2, 17, 111, 87, 54, 54),
("20 MARLA", 2, 18, 180, 124, 66, 58),
("20 MARLA", 2, 19, 75, 75, 0, 0),
("20 MARLA", 2, 20, 20, 20, 0, 1),
("20 MARLA", 2, 21, 20, 20, 0, 1),
("20 MARLA", 2, 22, 10, 10, 0, 1),
("20 MARLA", 2, 23, 239, 156, 91, 24),
("20 MARLA", 2, 24, 3, 2, 0, 0),
("20 MARLA", 2, 25, 1, 0, 0, 0),
("20 MARLA", 2, 26, 1, 0, 0, 0),
("20 MARLA", 2, 27, 11, 11, 0, 0),
("20 MARLA", 2, 28, 210, 210, 0, 0),
("20 MARLA", 2, 29, 70, 66, 23, 24),
("20 MARLA", 2, 30, 104, 102, 0, 4),
("20 MARLA", 2, 31, 361, 300, 0, 24);


INSERT INTO FILTER_GREY_MATERIALS (AREA_QTY, LAYOUT_20_ID, MATERIAL_ID, GROUND_QTY, FIRST_FLOOR_QTY, ROOFTOP_QTY)
VALUES  
("20 MARLA", 3, 1, 93548, 78503, 25567),
("20 MARLA", 3, 2, 993, 836, 354),
("20 MARLA", 3, 3, 4965, 4180, 1770),
("20 MARLA", 3, 4, 2780.4, 2340.8, 991.2),
("20 MARLA", 3, 5, 203, 178, 183),
("20 MARLA", 3, 6, 203, 178, 107),
("20 MARLA", 3, 7, 7, 3, 3),
("20 MARLA", 3, 8, 12000, 0, 0),
("20 MARLA", 3, 9, 60, 39, 24),
("20 MARLA", 3, 10, 42, 27, 23),
("20 MARLA", 3, 11, 5000, 4500, 600),
("20 MARLA", 3, 12, 313, 272, 204),
("20 MARLA", 3, 13, 124, 103, 113),
("20 MARLA", 3, 14, 39, 28, 23),
("20 MARLA", 3, 15, 44, 27, 15),
("20 MARLA", 3, 16, 114, 89, 53),
("20 MARLA", 3, 17, 114, 89, 53),
("20 MARLA", 3, 18, 183, 126, 57),
("20 MARLA", 3, 19, 75, 75, 0),
("20 MARLA", 3, 20, 20, 20, 0),
("20 MARLA", 3, 21, 20, 20, 0),
("20 MARLA", 3, 22, 10, 10, 0),
("20 MARLA", 3, 23, 242, 158, 23),
("20 MARLA", 3, 24, 3, 2, 0),
("20 MARLA", 3, 25, 1, 0, 0),
("20 MARLA", 3, 26, 1, 0, 0),
("20 MARLA", 3, 27, 11, 11, 0),
("20 MARLA", 3, 28, 210, 210, 0),
("20 MARLA", 3, 29, 73, 68, 23),
("20 MARLA", 3, 30, 107, 104, 3),
("20 MARLA", 3, 31, 364, 302, 23);


INSERT INTO FILTER_GREY_MATERIALS (AREA_QTY, LAYOUT_20_ID, MATERIAL_ID, GROUND_QTY, FIRST_FLOOR_QTY, ROOFTOP_QTY)
VALUES  
("20 MARLA", 4, 1, 93003, 78205, 25391),
("20 MARLA", 4, 2, 985, 833, 351),
("20 MARLA", 4, 3, 4925, 4165, 1755),
("20 MARLA", 4, 4, 2758, 2332.4, 982.8),
("20 MARLA", 4, 5, 199, 175, 180),
("20 MARLA", 4, 6, 199, 175, 104),
("20 MARLA", 4, 7, 7, 3, 3),
("20 MARLA", 4, 8, 12000, 0, 0),
("20 MARLA", 4, 9, 56, 36, 21),
("20 MARLA", 4, 10, 38, 24, 20),
("20 MARLA", 4, 11, 5000, 4500, 600),
("20 MARLA", 4, 12, 309, 269, 201),
("20 MARLA", 4, 13, 120, 100, 110),
("20 MARLA", 4, 14, 35, 25, 20),
("20 MARLA", 4, 15, 40, 24, 12),
("20 MARLA", 4, 16, 110, 86, 50),
("20 MARLA", 4, 17, 110, 86, 50),
("20 MARLA", 4, 18, 179, 123, 54),
("20 MARLA", 4, 19, 75, 75, 0),
("20 MARLA", 4, 20, 20, 20, 0),
("20 MARLA", 4, 21, 20, 20, 0),
("20 MARLA", 4, 22, 10, 10, 0),
("20 MARLA", 4, 23, 238, 155, 20),
("20 MARLA", 4, 24, 3, 2, 0),
("20 MARLA", 4, 25, 1, 0, 0),
("20 MARLA", 4, 26, 1, 0, 0),
("20 MARLA", 4, 27, 11, 11, 0),
("20 MARLA", 4, 28, 210, 210, 0),
("20 MARLA", 4, 29, 69, 65, 20),
("20 MARLA", 4, 30, 103, 101, 0),
("20 MARLA", 4, 31, 360, 299, 20);

-- Mirror of 20 Marla

INSERT INTO FILTER_GREY_MATERIALS (AREA_QTY, LAYOUT_20_ID, MATERIAL_ID, GROUND_QTY, FIRST_FLOOR_QTY, ROOFTOP_QTY, BASEMENT_QTY)
VALUES  
("20 MARLA", 5, 1, 92970, 78970, 26061, 48694),
("20 MARLA", 5, 2, 985, 835, 360, 506),
("20 MARLA", 5, 3, 4925, 4175, 1800, 2530),
("20 MARLA", 5, 4, 2758, 2338, 1008, 1416.8),
("20 MARLA", 5, 5, 198, 178, 91, 180),
("20 MARLA", 5, 6, 198, 178, 91, 104),
("20 MARLA", 5, 7, 5, 5, 3, 2),
("20 MARLA", 5, 8, 12000, 0, 0, 0),
("20 MARLA", 5, 9, 55, 39, 35, 21),
("20 MARLA", 5, 10, 37, 27, 21, 20),
("20 MARLA", 5, 11, 5000, 4500, 600, 5000),
("20 MARLA", 5, 12, 308, 272, 81, 201),
("20 MARLA", 5, 13, 119, 103, 48, 110),
("20 MARLA", 5, 14, 34, 28, 12, 20),
("20 MARLA", 5, 15, 39, 27, 10, 12),
("20 MARLA", 5, 16, 109, 89, 55, 50),
("20 MARLA", 5, 17, 109, 89, 55, 50),
("20 MARLA", 5, 18, 178, 126, 67, 54),
("20 MARLA", 5, 19, 75, 75, 0, 0),
("20 MARLA", 5, 20, 20, 20, 0, 1),
("20 MARLA", 5, 21, 20, 20, 0, 1),
("20 MARLA", 5, 22, 10, 10, 0, 1),
("20 MARLA", 5, 23, 237, 158, 92, 20),
("20 MARLA", 5, 24, 3, 2, 0, 0),
("20 MARLA", 5, 25, 1, 0, 0, 0),
("20 MARLA", 5, 26, 1, 0, 0, 0),
("20 MARLA", 5, 27, 11, 11, 0, 0),
("20 MARLA", 5, 28, 210, 210, 0, 0),
("20 MARLA", 5, 29, 68, 68, 24, 20),
("20 MARLA", 5, 30, 102, 104, 0, 0),
("20 MARLA", 5, 31, 359, 302, 0, 20);



INSERT INTO FILTER_GREY_MATERIALS (AREA_QTY, LAYOUT_20_ID, MATERIAL_ID, GROUND_QTY, FIRST_FLOOR_QTY, ROOFTOP_QTY, BASEMENT_QTY)
VALUES  
("20 MARLA", 6, 1, 93206, 78330, 25890, 67890),
("20 MARLA", 6, 2, 990, 830, 358, 523),
("20 MARLA", 6, 3, 4950, 4150, 1790, 2615),
("20 MARLA", 6, 4, 2772, 2324, 1002.4, 1464.4),
("20 MARLA", 6, 5, 200, 176, 90, 184),
("20 MARLA", 6, 6, 200, 176, 90, 108),
("20 MARLA", 6, 7, 7, 3, 2, 4),
("20 MARLA", 6, 8, 12000, 0, 0, 0),
("20 MARLA", 6, 9, 57, 37, 34, 25),
("20 MARLA", 6, 10, 39, 25, 20, 24),
("20 MARLA", 6, 11, 5000, 4500, 600, 5000),
("20 MARLA", 6, 12, 310, 270, 80, 205),
("20 MARLA", 6, 13, 121, 101, 47, 114),
("20 MARLA", 6, 14, 36, 26, 11, 24),
("20 MARLA", 6, 15, 41, 25, 9, 16),
("20 MARLA", 6, 16, 111, 87, 54, 54),
("20 MARLA", 6, 17, 111, 87, 54, 54),
("20 MARLA", 6, 18, 180, 124, 66, 58),
("20 MARLA", 6, 19, 75, 75, 0, 0),
("20 MARLA", 6, 20, 20, 20, 0, 1),
("20 MARLA", 6, 21, 20, 20, 0, 1),
("20 MARLA", 6, 22, 10, 10, 0, 1),
("20 MARLA", 6, 23, 239, 156, 91, 24),
("20 MARLA", 6, 24, 3, 2, 0, 0),
("20 MARLA", 6, 25, 1, 0, 0, 0),
("20 MARLA", 6, 26, 1, 0, 0, 0),
("20 MARLA", 6, 27, 11, 11, 0, 0),
("20 MARLA", 6, 28, 210, 210, 0, 0),
("20 MARLA", 6, 29, 70, 66, 23, 24),
("20 MARLA", 6, 30, 104, 102, 0, 4),
("20 MARLA", 6, 31, 361, 300, 0, 24);


INSERT INTO FILTER_GREY_MATERIALS (AREA_QTY, LAYOUT_20_ID, MATERIAL_ID, GROUND_QTY, FIRST_FLOOR_QTY, ROOFTOP_QTY)
VALUES  
("20 MARLA", 7, 1, 93548, 78503, 25567),
("20 MARLA", 7, 2, 993, 836, 354),
("20 MARLA", 7, 3, 4965, 4180, 1770),
("20 MARLA", 7, 4, 2780.4, 2340.8, 991.2),
("20 MARLA", 7, 5, 203, 178, 183),
("20 MARLA", 7, 6, 203, 178, 107),
("20 MARLA", 7, 7, 7, 3, 3),
("20 MARLA", 7, 8, 12000, 0, 0),
("20 MARLA", 7, 9, 60, 39, 24),
("20 MARLA", 7, 10, 42, 27, 23),
("20 MARLA", 7, 11, 5000, 4500, 600),
("20 MARLA", 7, 12, 313, 272, 204),
("20 MARLA", 7, 13, 124, 103, 113),
("20 MARLA", 7, 14, 39, 28, 23),
("20 MARLA", 7, 15, 44, 27, 15),
("20 MARLA", 7, 16, 114, 89, 53),
("20 MARLA", 7, 17, 114, 89, 53),
("20 MARLA", 7, 18, 183, 126, 57),
("20 MARLA", 7, 19, 75, 75, 0),
("20 MARLA", 7, 20, 20, 20, 0),
("20 MARLA", 7, 21, 20, 20, 0),
("20 MARLA", 7, 22, 10, 10, 0),
("20 MARLA", 7, 23, 242, 158, 23),
("20 MARLA", 7, 24, 3, 2, 0),
("20 MARLA", 7, 25, 1, 0, 0),
("20 MARLA", 7, 26, 1, 0, 0),
("20 MARLA", 7, 27, 11, 11, 0),
("20 MARLA", 7, 28, 210, 210, 0),
("20 MARLA", 7, 29, 73, 68, 23),
("20 MARLA", 7, 30, 107, 104, 3),
("20 MARLA", 7, 31, 364, 302, 23);


INSERT INTO FILTER_GREY_MATERIALS (AREA_QTY, LAYOUT_20_ID, MATERIAL_ID, GROUND_QTY, FIRST_FLOOR_QTY, ROOFTOP_QTY)
VALUES  
("20 MARLA", 8, 1, 93003, 78205, 25391),
("20 MARLA", 8, 2, 985, 833, 351),
("20 MARLA", 8, 3, 4925, 4165, 1755),
("20 MARLA", 8, 4, 2758, 2332.4, 982.8),
("20 MARLA", 8, 5, 199, 175, 180),
("20 MARLA", 8, 6, 199, 175, 104),
("20 MARLA", 8, 7, 7, 3, 3),
("20 MARLA", 8, 8, 12000, 0, 0),
("20 MARLA", 8, 9, 56, 36, 21),
("20 MARLA", 8, 10, 38, 24, 20),
("20 MARLA", 8, 11, 5000, 4500, 600),
("20 MARLA", 8, 12, 309, 269, 201),
("20 MARLA", 8, 13, 120, 100, 110),
("20 MARLA", 8, 14, 35, 25, 20),
("20 MARLA", 8, 15, 40, 24, 12),
("20 MARLA", 8, 16, 110, 86, 50),
("20 MARLA", 8, 17, 110, 86, 50),
("20 MARLA", 8, 18, 179, 123, 54),
("20 MARLA", 8, 19, 75, 75, 0),
("20 MARLA", 8, 20, 20, 20, 0),
("20 MARLA", 8, 21, 20, 20, 0),
("20 MARLA", 8, 22, 10, 10, 0),
("20 MARLA", 8, 23, 238, 155, 20),
("20 MARLA", 8, 24, 3, 2, 0),
("20 MARLA", 8, 25, 1, 0, 0),
("20 MARLA", 8, 26, 1, 0, 0),
("20 MARLA", 8, 27, 11, 11, 0),
("20 MARLA", 8, 28, 210, 210, 0),
("20 MARLA", 8, 29, 69, 65, 20),
("20 MARLA", 8, 30, 103, 101, 0),
("20 MARLA", 8, 31, 360, 299, 20);


select * from filter_grey_materials ;

select * from filter_grey_materials where area_qty="20 Marla" and layout_20_id = "3";

SELECT A.MATERIAL_NAME , A.BRAND,A.RATE, B.AREA_QTY, B.GROUND_QTY,
 B.FIRST_FLOOR_QTY, B.ROOFTOP_QTY, B.BASEMENT_QTY 
 FROM grey_materials AS A, FILTER_GREY_MATERIALS AS B 
 WHERE B.AREA_QTY = "20 MARLA" AND B.LAYOUT_20_ID = "3" AND A.MATERIAL_ID = B.MATERIAL_ID;


SELECT 
    A.MATERIAL_NAME,
    A.BRAND,
    A.FACTOR,
    ROUND((A.RATE),0),
	(B.GROUND_QTY + B.ROOFTOP_QTY) AS total_quantity,
    ROUND((A.RATE * (B.GROUND_QTY+ B.ROOFTOP_QTY)),0) AS total_cost
FROM 
    grey_materials AS A
JOIN 
    FILTER_GREY_MATERIALS AS B ON A.MATERIAL_ID = B.MATERIAL_ID
WHERE 
    B.AREA_QTY = "20 MARLA" 
    AND B.LAYOUT_20_ID = "3";






SELECT 
    A.MATERIAL_NAME,
    A.BRAND,
    A.RATE,
    B.AREA_QTY,
    B.GROUND_QTY,
    B.FIRST_FLOOR_QTY,
    B.ROOFTOP_QTY,
    B.BASEMENT_QTY,
    (B.GROUND_QTY * A.RATE) AS GROUND_COST,
    (B.FIRST_FLOOR_QTY * A.RATE) AS FIRST_FLOOR_COST,
    (B.ROOFTOP_QTY * A.RATE) AS ROOFTOP_COST
FROM 
    grey_materials AS A, 
    FILTER_GREY_MATERIALS AS B 
WHERE 
    B.AREA_QTY = "20 MARLA" 
    AND B.LAYOUT_20_ID = "3" 
    AND A.MATERIAL_ID = B.MATERIAL_ID;
    

SELECT 
    SUM(GROUND_material_cost) AS 1_total_cost,
    SUM(ROOFTOP_material_cost) AS 3_total_cost


FROM (
    SELECT 
        (B.GROUND_QTY * A.RATE) AS GROUND_material_cost,
        (B.ROOFTOP_QTY * A.RATE) AS ROOFTOP_material_cost
                
    FROM 
        grey_materials AS A
    JOIN 
        FILTER_GREY_MATERIALS AS B ON A.MATERIAL_ID = B.MATERIAL_ID
    WHERE 
        B.AREA_QTY = "20 MARLA" 
        AND B.LAYOUT_20_ID = "3"
) AS subquery;

-- ------------------
-- checking

 SELECT 
    SUM(GROUND_material_cost) AS 1_total_cost,
    SUM(FIRST_FLOOR_material_cost) as 2_total_cost,
    SUM(ROOFTOP_material_cost) AS 3_total_cost
FROM (
    SELECT 
        (B.GROUND_QTY * A.RATE) AS GROUND_material_cost,
        (B.ROOFTOP_QTY * A.RATE) AS ROOFTOP_material_cost, -- Added comma here
        (B.FIRST_FLOOR_QTY * A.RATE) AS FIRST_FLOOR_material_cost
    FROM 
        grey_materials AS A
    JOIN 
        FILTER_GREY_MATERIALS AS B ON A.MATERIAL_ID = B.MATERIAL_ID
    WHERE 
        B.AREA_QTY = "3 Marla"
        AND B.LAYOUT_3_ID = 3
) AS subquery;

SELECT 
                        A.MATERIAL_NAME,
                        A.BRAND,
                        A.FACTOR,
                        ROUND((A.RATE),0),
                        (B.GROUND_QTY + B.FIRST_FLOOR_QTY + B.ROOFTOP_QTY) AS total_quantity,
                        ROUND((A.RATE * (B.GROUND_QTY + B.FIRST_FLOOR_QTY + B.ROOFTOP_QTY)),0) AS total_cost
                    FROM 
                        grey_materials AS A
                    JOIN 
                        FILTER_GREY_MATERIALS AS B ON A.MATERIAL_ID = B.MATERIAL_ID
                    WHERE 
                        B.AREA_QTY = "3 MARLA"
                        AND B.LAYOUT_3_ID = 4;


-- --------------------------------------

DROP TABLE IF EXISTS LABOUR;

CREATE TABLE LABOUR
(
LABOUR_ID INT PRIMARY KEY auto_increment,
LABOUR_TYPE VARCHAR(170) NOT NULL,
FACTOR VARCHAR(15) NOT NULL,
RATE FLOAT NOT NULL
);

INSERT INTO LABOUR VALUES
(1,"FOUNDATION","sqft",286),
(2,"PLUMBING","sqft",31),
(3,"ELECTRICAL","sqft",32);

INSERT INTO LABOUR VALUES
(4, "Paint", "sqft", 30),
(5, "Tiles Installation", "sqft", 20),
(6, "Electrician", "day", 2000),
(7, "Kitchen Slab", "sqft", 150),
(8, "Washroom Slab", "sqft", 80),
(9, "Window Installation", "sqft", 800),
(10, "False Ceiling", "sqft", 25),
(11, "Carpenter", "day", 2500),
(12, "Plumber", "day", 2000);


SELECT * FROM LABOUR;

-- ------------------------------------

DROP TABLE IF EXISTS FILTER_LABOUR;

CREATE TABLE FILTER_LABOUR
(
FILTER_LABOUR_ID INT NOT NULL primary key auto_increment,
AREA_SQFTS VARCHAR(20) NOT NULL,
LAYOUT_3_ID INT default NULL,
LAYOUT_5_ID INT default NULL,
LAYOUT_7_ID INT default NULL,
LAYOUT_10_ID INT default NULL,
LAYOUT_20_ID INT default NULL,
LABOUR_ID INT default NULL,
GROUND_SQFTS INT ,
FIRST_FLOOR_SQFTS INT ,
BASEMENT_SQFTS INT NULL,
FOREIGN KEY (LABOUR_ID) REFERENCES LABOUR(LABOUR_ID),
FOREIGN KEY (LAYOUT_3_ID) REFERENCES LAYOUT_3(ID),
FOREIGN KEY (LAYOUT_5_ID) REFERENCES LAYOUT_5(ID),
FOREIGN KEY (LAYOUT_7_ID) REFERENCES LAYOUT_7(ID),
FOREIGN KEY (LAYOUT_10_ID) REFERENCES LAYOUT_10(ID),
FOREIGN KEY (LAYOUT_20_ID) REFERENCES LAYOUT_20(ID)

);

-- 3 MARLA LABOUR
 
INSERT INTO FILTER_LABOUR
(FILTER_LABOUR_ID,AREA_SQFTS,LAYOUT_3_ID,LABOUR_ID,GROUND_SQFTS,FIRST_FLOOR_SQFTS,BASEMENT_SQFTS)
VALUES  (1,"3 MARLA",1,1,720,670,670);
 


INSERT INTO FILTER_LABOUR
(AREA_SQFTS,LAYOUT_3_ID,LABOUR_ID,GROUND_SQFTS,FIRST_FLOOR_SQFTS,BASEMENT_SQFTS)
VALUES
("3 MARLA",1,2,720,670,350),
("3 MARLA",1,3,720,670,350),
("3 MARLA",2,1,710,660,600),
("3 MARLA",2,2,710,660,100),
("3 MARLA",2,3,710,660,350);  
 
INSERT INTO FILTER_LABOUR
(AREA_SQFTS,LAYOUT_3_ID,LABOUR_ID,GROUND_SQFTS,FIRST_FLOOR_SQFTS)
VALUES
("3 MARLA",3,1,710,665),
("3 MARLA",3,2,710,665),
("3 MARLA",3,3,710,665),
("3 MARLA",4,1,725,675),
("3 MARLA",4,2,725,675),  
("3 MARLA",4,3,725,675);  
  
-- MIRRORS OF 3 MARLA

INSERT INTO FILTER_LABOUR
(AREA_SQFTS,LAYOUT_3_ID,LABOUR_ID,GROUND_SQFTS,FIRST_FLOOR_SQFTS,BASEMENT_SQFTS)
VALUES
("3 MARLA",5,1,720,670,350),
("3 MARLA",5,2,720,670,350),
("3 MARLA",5,3,720,670,350),
("3 MARLA",6,1,710,660,600),
("3 MARLA",6,2,710,660,100),
("3 MARLA",6,3,710,660,350);  
 
INSERT INTO FILTER_LABOUR
(AREA_SQFTS,LAYOUT_3_ID,LABOUR_ID,GROUND_SQFTS,FIRST_FLOOR_SQFTS)
VALUES
("3 MARLA",7,1,710,665),
("3 MARLA",7,2,710,665),
("3 MARLA",7,3,710,665),
("3 MARLA",8,1,725,675),
("3 MARLA",8,2,725,675),  
("3 MARLA",8,3,725,675);  

-- 5 MARLA LABOUR

INSERT INTO FILTER_LABOUR
(AREA_SQFTS,LAYOUT_5_ID,LABOUR_ID,GROUND_SQFTS,FIRST_FLOOR_SQFTS,BASEMENT_SQFTS)
VALUES
("5 MARLA",1,1,1170,1125,1125),
("5 MARLA",1,2,1170,1125,350),
("5 MARLA",1,3,1170,1125,1000),
("5 MARLA",2,1,1173,1125,1125),
("5 MARLA",2,2,1173,1125,1000),
("5 MARLA",2,3,1173,1125,1000);  
 
INSERT INTO FILTER_LABOUR
(AREA_SQFTS,LAYOUT_5_ID,LABOUR_ID,GROUND_SQFTS,FIRST_FLOOR_SQFTS)
VALUES
("5 MARLA",3,1,1171,1128),
("5 MARLA",3,2,1171,1128),
("5 MARLA",3,3,1171,1128),
("5 MARLA",4,1,1168,1120),
("5 MARLA",4,2,1168,1120),  
("5 MARLA",4,3,1168,1120);  

-- MIRROR OF 5 MARLA

INSERT INTO FILTER_LABOUR
(AREA_SQFTS,LAYOUT_5_ID,LABOUR_ID,GROUND_SQFTS,FIRST_FLOOR_SQFTS,BASEMENT_SQFTS)
VALUES
("5 MARLA",5,1,1170,1125,1125),
("5 MARLA",5,2,1170,1125,350),
("5 MARLA",5,3,1170,1125,1000),
("5 MARLA",6,1,1173,1125,1125),
("5 MARLA",6,2,1173,1125,1000),
("5 MARLA",6,3,1173,1125,1000);  
 
INSERT INTO FILTER_LABOUR
(AREA_SQFTS,LAYOUT_5_ID,LABOUR_ID,GROUND_SQFTS,FIRST_FLOOR_SQFTS)
VALUES
("5 MARLA",7,1,1171,1128),
("5 MARLA",7,2,1171,1128),
("5 MARLA",7,3,1171,1128),
("5 MARLA",8,1,1168,1120),
("5 MARLA",8,2,1168,1120),  
("5 MARLA",8,3,1168,1120);  

-- 7 MARLA

INSERT INTO FILTER_LABOUR
(AREA_SQFTS,LAYOUT_7_ID,LABOUR_ID,GROUND_SQFTS,FIRST_FLOOR_SQFTS,BASEMENT_SQFTS)
VALUES
("7 MARLA",1,1,1615,1575,1100),
("7 MARLA",1,2,1615,1575,400),
("7 MARLA",1,3,1615,1575,1100),
("7 MARLA",2,1,1605,1580,1100),
("7 MARLA",2,2,1605,1580,1000),
("7 MARLA",2,3,1605,1580,1000);  
 
INSERT INTO FILTER_LABOUR
(AREA_SQFTS,LAYOUT_7_ID,LABOUR_ID,GROUND_SQFTS,FIRST_FLOOR_SQFTS)
VALUES
("7 MARLA",3,1,1605,1590),
("7 MARLA",3,2,1605,1590),
("7 MARLA",3,3,1605,1590),
("7 MARLA",4,1,1630,1595),
("7 MARLA",4,2,1630,1595),  
("7 MARLA",4,3,1630,1595);  

-- MIRRORS OF 7 MARLA

INSERT INTO FILTER_LABOUR
(AREA_SQFTS,LAYOUT_7_ID,LABOUR_ID,GROUND_SQFTS,FIRST_FLOOR_SQFTS,BASEMENT_SQFTS)
VALUES
("7 MARLA",5,1,1615,1575,1100),
("7 MARLA",5,2,1615,1575,400),
("7 MARLA",5,3,1615,1575,1100),
("7 MARLA",6,1,1605,1580,1100),
("7 MARLA",6,2,1605,1580,1000),
("7 MARLA",6,3,1605,1580,1000);  
 
INSERT INTO FILTER_LABOUR
(AREA_SQFTS,LAYOUT_7_ID,LABOUR_ID,GROUND_SQFTS,FIRST_FLOOR_SQFTS)
VALUES
("7 MARLA",7,1,1605,1590),
("7 MARLA",7,2,1605,1590),
("7 MARLA",7,3,1605,1590),
("7 MARLA",8,1,1630,1595),
("7 MARLA",8,2,1630,1595),  
("7 MARLA",8,3,1630,1595);  

-- 10 MARLA

INSERT INTO FILTER_LABOUR
(AREA_SQFTS,LAYOUT_10_ID,LABOUR_ID,GROUND_SQFTS,FIRST_FLOOR_SQFTS,BASEMENT_SQFTS)
VALUES
("10 MARLA",1,1,2320,2275,1100),
("10 MARLA",1,2,2320,2275,400),
("10 MARLA",1,3,2320,2275,1100),
("10 MARLA",2,1,2305,2265,1200),
("10 MARLA",2,2,2305,2265,1100),
("10 MARLA",2,3,2305,2265,1100);  
 
INSERT INTO FILTER_LABOUR
(AREA_SQFTS,LAYOUT_10_ID,LABOUR_ID,GROUND_SQFTS,FIRST_FLOOR_SQFTS)
VALUES
("10 MARLA",3,1,2310,2260),
("10 MARLA",3,2,2310,2260),
("10 MARLA",3,3,2310,2260),
("10 MARLA",4,1,2315,2270),
("10 MARLA",4,2,2315,2270),  
("10 MARLA",4,3,2315,2270);  

-- MIRROR OF 10 MARLA

INSERT INTO FILTER_LABOUR
(AREA_SQFTS,LAYOUT_10_ID,LABOUR_ID,GROUND_SQFTS,FIRST_FLOOR_SQFTS,BASEMENT_SQFTS)
VALUES
("10 MARLA",5,1,2320,2275,1100),
("10 MARLA",5,2,2320,2275,400),
("10 MARLA",5,3,2320,2275,1100),
("10 MARLA",6,1,2305,2265,1200),
("10 MARLA",6,2,2305,2265,1100),
("10 MARLA",6,3,2305,2265,1100);  
 
INSERT INTO FILTER_LABOUR
(AREA_SQFTS,LAYOUT_10_ID,LABOUR_ID,GROUND_SQFTS,FIRST_FLOOR_SQFTS)
VALUES
("10 MARLA",7,1,2310,2260),
("10 MARLA",7,2,2310,2260),
("10 MARLA",7,3,2310,2260),
("10 MARLA",8,1,2315,2270),
("10 MARLA",8,2,2315,2270),  
("10 MARLA",8,3,2315,2270);  

-- 20 MARLA

INSERT INTO FILTER_LABOUR
(AREA_SQFTS,LAYOUT_20_ID,LABOUR_ID,GROUND_SQFTS,FIRST_FLOOR_SQFTS,BASEMENT_SQFTS)
VALUES
("20 MARLA",1,1,4550,4480,2000),
("20 MARLA",1,2,4550,4480,500),
("20 MARLA",1,3,4550,4480,2000),
("20 MARLA",2,1,4560,4470,2100),
("20 MARLA",2,2,4560,4470,1500),
("20 MARLA",2,3,4560,4470,1500);  
 
INSERT INTO FILTER_LABOUR
(AREA_SQFTS,LAYOUT_20_ID,LABOUR_ID,GROUND_SQFTS,FIRST_FLOOR_SQFTS)
VALUES
("20 MARLA",3,1,4565,4475),
("20 MARLA",3,2,4565,4475),
("20 MARLA",3,3,4565,4475),
("20 MARLA",4,1,4555,4468),
("20 MARLA",4,2,4555,4468),  
("20 MARLA",4,3,4555,4468);  

-- MIRRORS

INSERT INTO FILTER_LABOUR
(AREA_SQFTS,LAYOUT_20_ID,LABOUR_ID,GROUND_SQFTS,FIRST_FLOOR_SQFTS,BASEMENT_SQFTS)
VALUES
("20 MARLA",5,1,4550,4480,2000),
("20 MARLA",5,2,4550,4480,500),
("20 MARLA",5,3,4550,4480,2000),
("20 MARLA",6,1,4560,4470,2100),
("20 MARLA",6,2,4560,4470,1500),
("20 MARLA",6,3,4560,4470,1500);  
 
INSERT INTO FILTER_LABOUR
(AREA_SQFTS,LAYOUT_20_ID,LABOUR_ID,GROUND_SQFTS,FIRST_FLOOR_SQFTS)
VALUES
("20 MARLA",7,1,4565,4475),
("20 MARLA",7,2,4565,4475),
("20 MARLA",7,3,4565,4475),
("20 MARLA",8,1,4555,4468),
("20 MARLA",8,2,4555,4468),  
("20 MARLA",8,3,4555,4468);  

-- ---------------
-- Finishing Materials
-- 3_1 Marla

INSERT INTO filter_labour (AREA_SQFTS, LAYOUT_3_ID, LABOUR_ID, GROUND_SQFTS, FIRST_FLOOR_SQFTS, BASEMENT_SQFTS)
VALUES 
("3 Marla", 1, 4, 4945, 3440, 3170),
("3 Marla", 1, 5, 1179, 713, 727),
("3 Marla", 1, 6, 10, 10, 10),
("3 Marla", 1, 7, 32, 0, 4),
("3 Marla", 1, 8, 4, 8, 0),
("3 Marla", 1, 9, 5, 4, 2),
("3 Marla", 1, 10, 667, 586, 401),
("3 Marla", 1, 11, 15, 15, 15),
("3 Marla", 1, 12, 15, 15, 15);

-- 3_2 Marla
INSERT INTO filter_labour (AREA_SQFTS, LAYOUT_3_ID, LABOUR_ID, GROUND_SQFTS, FIRST_FLOOR_SQFTS, BASEMENT_SQFTS)
VALUES 
("3 Marla", 2, 4, 4780, 3505, 2442),
("3 Marla", 2, 5, 971, 681, 765),
("3 Marla", 2, 6, 10, 10, 10),
("3 Marla", 2, 7, 32, 0, 0),
("3 Marla", 2, 8, 4, 4, 0),
("3 Marla", 2, 9, 5, 4, 0),
("3 Marla", 2, 10, 706, 625, 675),
("3 Marla", 2, 11, 15, 15, 15),
("3 Marla", 2, 12, 15, 15, 15);

-- 3_3 Marla

INSERT INTO filter_labour (AREA_SQFTS, LAYOUT_3_ID, LABOUR_ID, GROUND_SQFTS, FIRST_FLOOR_SQFTS, BASEMENT_SQFTS)
VALUES 
("3 Marla", 3, 4, 3950, 3344, 0),
("3 Marla", 3, 5, 1115, 944, 0),
("3 Marla", 3, 6, 10, 10, 0),
("3 Marla", 3, 7, 26, 0, 0),
("3 Marla", 3, 8, 8, 8, 0),
("3 Marla", 3, 9, 5, 4, 0),
("3 Marla", 3, 10, 720, 565, 0),
("3 Marla", 3, 11, 15, 15, 0),
("3 Marla", 3, 12, 15, 15, 0);

-- 3_4 Marla

INSERT INTO filter_labour (AREA_SQFTS, LAYOUT_3_ID, LABOUR_ID, GROUND_SQFTS, FIRST_FLOOR_SQFTS, BASEMENT_SQFTS)
VALUES 
("3 Marla", 4, 4, 4280, 3256, 0),
("3 Marla", 4, 5, 1210, 945, 0),
("3 Marla", 4, 6, 10, 10, 0),
("3 Marla", 4, 7, 27, 0, 0),
("3 Marla", 4, 8, 24, 16, 0),
("3 Marla", 4, 9, 5, 4, 0),
("3 Marla", 4, 10, 696, 615, 0),
("3 Marla", 4, 11, 15, 15, 0),
("3 Marla", 4, 12, 15, 15, 0);

-- 3 Mirrors

-- 3_5 Marla

INSERT INTO filter_labour (AREA_SQFTS, LAYOUT_3_ID, LABOUR_ID, GROUND_SQFTS, FIRST_FLOOR_SQFTS, BASEMENT_SQFTS)
VALUES 
("3 Marla", 5, 4, 4945, 3440, 3170),
("3 Marla", 5, 5, 1179, 713, 727),
("3 Marla", 5, 6, 10, 10, 10),
("3 Marla", 5, 7, 32, 0, 4),
("3 Marla", 5, 8, 4, 8, 0),
("3 Marla", 5, 9, 5, 4, 2),
("3 Marla", 5, 10, 667, 586, 401),
("3 Marla", 5, 11, 15, 15, 15),
("3 Marla", 5, 12, 15, 15, 15);

-- 3_6 Marla
INSERT INTO filter_labour (AREA_SQFTS, LAYOUT_3_ID, LABOUR_ID, GROUND_SQFTS, FIRST_FLOOR_SQFTS, BASEMENT_SQFTS)
VALUES 
("3 Marla", 6, 4, 4780, 3505, 2442),
("3 Marla", 6, 5, 971, 681, 765),
("3 Marla", 6, 6, 10, 10, 10),
("3 Marla", 6, 7, 32, 0, 0),
("3 Marla", 6, 8, 4, 4, 0),
("3 Marla", 6, 9, 5, 4, 0),
("3 Marla", 6, 10, 706, 625, 675),
("3 Marla", 6, 11, 15, 15, 15),
("3 Marla", 6, 12, 15, 15, 15);

-- 3_7 Marla

INSERT INTO filter_labour (AREA_SQFTS, LAYOUT_3_ID, LABOUR_ID, GROUND_SQFTS, FIRST_FLOOR_SQFTS, BASEMENT_SQFTS)
VALUES 
("3 Marla", 7, 4, 3950, 3344, 0),
("3 Marla", 7, 5, 1115, 944, 0),
("3 Marla", 7, 6, 10, 10, 0),
("3 Marla", 7, 7, 26, 0, 0),
("3 Marla", 7, 8, 8, 8, 0),
("3 Marla", 7, 9, 5, 4, 0),
("3 Marla", 7, 10, 720, 565, 0),
("3 Marla", 7, 11, 15, 15, 0),
("3 Marla", 7, 12, 15, 15, 0);

-- 3_8 Marla

INSERT INTO filter_labour (AREA_SQFTS, LAYOUT_3_ID, LABOUR_ID, GROUND_SQFTS, FIRST_FLOOR_SQFTS, BASEMENT_SQFTS)
VALUES 
("3 Marla", 8, 4, 4280, 3256, 0),
("3 Marla", 8, 5, 1210, 945, 0),
("3 Marla", 8, 6, 10, 10, 0),
("3 Marla", 8, 7, 27, 0, 0),
("3 Marla", 8, 8, 24, 16, 0),
("3 Marla", 8, 9, 5, 4, 0),
("3 Marla", 8, 10, 696, 615, 0),
("3 Marla", 8, 11, 15, 15, 0),
("3 Marla", 8, 12, 15, 15, 0);

-- 5 Marla

-- 5_1 Marla

INSERT INTO filter_labour (AREA_SQFTS, LAYOUT_5_ID, LABOUR_ID, GROUND_SQFTS, FIRST_FLOOR_SQFTS, BASEMENT_SQFTS)
VALUES 
("5 Marla", 1, 4, 5966, 4559, 3080),
("5 Marla", 1, 5, 1567, 1304, 1113),
("5 Marla", 1, 6, 10, 10, 10),
("5 Marla", 1, 7, 53, 0, 0),
("5 Marla", 1, 8, 4, 8, 0),
("5 Marla", 1, 9, 6, 5, 0),
("5 Marla", 1, 10, 1114, 993, 1023),
("5 Marla", 1, 11, 15, 15, 15),
("5 Marla", 1, 12, 15, 15, 15);

-- 5_2 Marla

INSERT INTO filter_labour (AREA_SQFTS, LAYOUT_5_ID, LABOUR_ID, GROUND_SQFTS, FIRST_FLOOR_SQFTS, BASEMENT_SQFTS)
VALUES 
("5 MARLA", 2, 4, 6330, 4543, 3872),
("5 MARLA", 2, 5, 1538, 1371, 1434),
("5 MARLA", 2, 6, 10, 10, 10),
("5 MARLA", 2, 7, 44, 0, 0),
("5 MARLA", 2, 8, 12, 12, 4),
("5 MARLA", 2, 9, 8, 7, 2),
("5 MARLA", 2, 10, 1075, 905, 951),
("5 MARLA", 2, 11, 15, 15, 15),
("5 MARLA", 2, 12, 15, 15, 15);

-- 5_ 3 Marla

INSERT INTO filter_labour (AREA_SQFTS, LAYOUT_5_ID, LABOUR_ID, GROUND_SQFTS, FIRST_FLOOR_SQFTS, BASEMENT_SQFTS)
VALUES 
("5 Marla", 3, 4, 5942, 4708, 0),
("5 Marla", 3, 5, 1693, 1230, 90),
("5 Marla", 3, 6, 10, 10, 0),
("5 Marla", 3, 7, 45, 0, 0),
("5 Marla", 3, 8, 8, 8, 0),
("5 Marla", 3, 9, 7, 7, 0),
("5 Marla", 3, 10, 1061, 857, 0),
("5 Marla", 3, 11, 15, 15, 0),
("5 Marla", 3, 12, 15, 15, 0);

-- 5_4 Marla

INSERT INTO filter_labour (AREA_SQFTS, LAYOUT_5_ID, LABOUR_ID, GROUND_SQFTS, FIRST_FLOOR_SQFTS, BASEMENT_SQFTS)
VALUES 
("5 Marla", 4, 4, 5923, 4361, 0),
("5 Marla", 4, 5, 1688, 1242, 0),
("5 Marla", 4, 6, 10, 10, 0),
("5 Marla", 4, 7, 48, 0, 0),
("5 Marla", 4, 8, 8, 8, 0),
("5 Marla", 4, 9, 7, 6, 0),
("5 Marla", 4, 10, 1058, 937, 0),
("5 Marla", 4, 11, 15, 15, 0),
("5 Marla", 4, 12, 15, 15, 0);

-- 5 Marla Mirrors

-- 5_5 Marla

INSERT INTO filter_labour (AREA_SQFTS, LAYOUT_5_ID, LABOUR_ID, GROUND_SQFTS, FIRST_FLOOR_SQFTS, BASEMENT_SQFTS)
VALUES 
("5 Marla", 5, 4, 5966, 4559, 3080),
("5 Marla", 5, 5, 1567, 1304, 1113),
("5 Marla", 5, 6, 10, 10, 10),
("5 Marla", 5, 7, 53, 0, 0),
("5 Marla", 5, 8, 4, 8, 0),
("5 Marla", 5, 9, 6, 5, 0),
("5 Marla", 5, 10, 1114, 993, 1023),
("5 Marla", 5, 11, 15, 15, 15),
("5 Marla", 5, 12, 15, 15, 15);

-- 5_6 Marla

INSERT INTO filter_labour (AREA_SQFTS, LAYOUT_5_ID, LABOUR_ID, GROUND_SQFTS, FIRST_FLOOR_SQFTS, BASEMENT_SQFTS)
VALUES 
("5 MARLA", 6, 4, 6330, 4543, 3872),
("5 MARLA", 6, 5, 1538, 1371, 1434),
("5 MARLA", 6, 6, 10, 10, 10),
("5 MARLA", 6, 7, 44, 0, 0),
("5 MARLA", 6, 8, 12, 12, 4),
("5 MARLA", 6, 9, 8, 7, 2),
("5 MARLA", 6, 10, 1075, 905, 951),
("5 MARLA", 6, 11, 15, 15, 15),
("5 MARLA", 6, 12, 15, 15, 15);

-- 5_ 7 Marla

INSERT INTO filter_labour (AREA_SQFTS, LAYOUT_5_ID, LABOUR_ID, GROUND_SQFTS, FIRST_FLOOR_SQFTS, BASEMENT_SQFTS)
VALUES 
("5 Marla", 7, 4, 5942, 4708, 0),
("5 Marla", 7, 5, 1693, 1230, 90),
("5 Marla", 7, 6, 10, 10, 0),
("5 Marla", 7, 7, 45, 0, 0),
("5 Marla", 7, 8, 8, 8, 0),
("5 Marla", 7, 9, 7, 7, 0),
("5 Marla", 7, 10, 1061, 857, 0),
("5 Marla", 7, 11, 15, 15, 0),
("5 Marla", 7, 12, 15, 15, 0);

-- 5_8 Marla

INSERT INTO filter_labour (AREA_SQFTS, LAYOUT_5_ID, LABOUR_ID, GROUND_SQFTS, FIRST_FLOOR_SQFTS, BASEMENT_SQFTS)
VALUES 
("5 Marla", 8, 4, 5923, 4361, 0),
("5 Marla", 8, 5, 1688, 1242, 0),
("5 Marla", 8, 6, 10, 10, 0),
("5 Marla", 8, 7, 48, 0, 0),
("5 Marla", 8, 8, 8, 8, 0),
("5 Marla", 8, 9, 7, 6, 0),
("5 Marla", 8, 10, 1058, 937, 0),
("5 Marla", 8, 11, 15, 15, 0),
("5 Marla", 8, 12, 15, 15, 0);


-- 7 Marla

-- 7_1 Marla

INSERT INTO filter_labour (AREA_SQFTS, LAYOUT_7_ID, LABOUR_ID, GROUND_SQFTS, FIRST_FLOOR_SQFTS, BASEMENT_SQFTS)
VALUES 
("7 MARLA", 1, 4, 7360, 3540, 2992),
("7 MARLA", 1, 5, 2039, 1245, 1210),
("7 MARLA", 1, 6, 14, 14, 14),
("7 MARLA", 1, 7, 48, 0, 0),
("7 MARLA", 1, 8, 8, 8, 0),
("7 MARLA", 1, 9, 9, 7, 0),
("7 MARLA", 1, 10, 1085, 1041, 1120),
("7 MARLA", 1, 11, 20, 20, 20),
("7 MARLA", 1, 12, 20, 20, 20);

-- 7_2 Marla

INSERT INTO filter_labour (AREA_SQFTS, LAYOUT_7_ID, LABOUR_ID, GROUND_SQFTS, FIRST_FLOOR_SQFTS, BASEMENT_SQFTS)
VALUES 
("7 MARLA", 2, 4, 7010, 3580, 3047),
("7 MARLA", 2, 5, 2070, 1266, 922),
("7 MARLA", 2, 6, 14, 14, 14),
("7 MARLA", 2, 7, 48, 0, 0),
("7 MARLA", 2, 8, 8, 8, 4),
("7 MARLA", 2, 9, 9, 7, 2),
("7 MARLA", 2, 10, 1070, 1123, 634),
("7 MARLA", 2, 11, 20, 20, 20),
("7 MARLA", 2, 12, 20, 20, 20);


-- 7_3 Marla

INSERT INTO filter_labour (AREA_SQFTS, LAYOUT_7_ID, LABOUR_ID, GROUND_SQFTS, FIRST_FLOOR_SQFTS, BASEMENT_SQFTS)
VALUES 
("7 MARLA", 3, 4, 7420, 3920, 0),
("7 MARLA", 3, 5, 2114, 1708, 0),
("7 MARLA", 3, 6, 14, 14, 0),
("7 MARLA", 3, 7, 64, 0, 0),
("7 MARLA", 3, 8, 8, 4, 0),
("7 MARLA", 3, 9, 8, 6, 0),
("7 MARLA", 3, 10, 1011, 1007, 0),
("7 MARLA", 3, 11, 20, 20, 0),
("7 MARLA", 3, 12, 20, 20, 0);


-- 7_4 Marla

INSERT INTO filter_labour (AREA_SQFTS, LAYOUT_7_ID, LABOUR_ID, GROUND_SQFTS, FIRST_FLOOR_SQFTS, BASEMENT_SQFTS)
VALUES 
("7 MARLA", 4, 4, 7630, 3850, 0),
("7 MARLA", 4, 5, 2034, 1359, 0),
("7 MARLA", 4, 6, 14, 14, 0),
("7 MARLA", 4, 7, 42, 0, 0),
("7 MARLA", 4, 8, 8, 16, 0),
("7 MARLA", 4, 9, 9, 8, 0),
("7 MARLA", 4, 10, 1060, 1154, 0),
("7 MARLA", 4, 11, 20, 20, 0),
("7 MARLA", 4, 12, 20, 20, 0);

-- 7 Marla Mirrors

-- 7_5 Marla

INSERT INTO filter_labour (AREA_SQFTS, LAYOUT_7_ID, LABOUR_ID, GROUND_SQFTS, FIRST_FLOOR_SQFTS, BASEMENT_SQFTS)
VALUES 
("7 MARLA", 5, 4, 7360, 3540, 2992),
("7 MARLA", 5, 5, 2039, 1245, 1210),
("7 MARLA", 5, 6, 14, 14, 14),
("7 MARLA", 5, 7, 48, 0, 0),
("7 MARLA", 5, 8, 8, 8, 0),
("7 MARLA", 5, 9, 9, 7, 0),
("7 MARLA", 5, 10, 1085, 1041, 1120),
("7 MARLA", 5, 11, 20, 20, 20),
("7 MARLA", 5, 12, 20, 20, 20);

-- 7_6 Marla

INSERT INTO filter_labour (AREA_SQFTS, LAYOUT_7_ID, LABOUR_ID, GROUND_SQFTS, FIRST_FLOOR_SQFTS, BASEMENT_SQFTS)
VALUES 
("7 MARLA", 6, 4, 7010, 3580, 3047),
("7 MARLA", 6, 5, 2070, 1266, 922),
("7 MARLA", 6, 6, 14, 14, 14),
("7 MARLA", 6, 7, 48, 0, 0),
("7 MARLA", 6, 8, 8, 8, 4),
("7 MARLA", 6, 9, 9, 7, 2),
("7 MARLA", 6, 10, 1070, 1123, 634),
("7 MARLA", 6, 11, 20, 20, 20),
("7 MARLA", 6, 12, 20, 20, 20);


-- 7_7 Marla

INSERT INTO filter_labour (AREA_SQFTS, LAYOUT_7_ID, LABOUR_ID, GROUND_SQFTS, FIRST_FLOOR_SQFTS, BASEMENT_SQFTS)
VALUES 
("7 MARLA", 7, 4, 7420, 3920, 0),
("7 MARLA", 7, 5, 2114, 1708, 0),
("7 MARLA", 7, 6, 14, 14, 0),
("7 MARLA", 7, 7, 64, 0, 0),
("7 MARLA", 7, 8, 8, 4, 0),
("7 MARLA", 7, 9, 8, 6, 0),
("7 MARLA", 7, 10, 1011, 1007, 0),
("7 MARLA", 7, 11, 20, 20, 0),
("7 MARLA", 7, 12, 20, 20, 0);


-- 7_8 Marla

INSERT INTO filter_labour (AREA_SQFTS, LAYOUT_7_ID, LABOUR_ID, GROUND_SQFTS, FIRST_FLOOR_SQFTS, BASEMENT_SQFTS)
VALUES 
("7 MARLA", 8, 4, 7630, 3850, 0),
("7 MARLA", 8, 5, 2034, 1359, 0),
("7 MARLA", 8, 6, 14, 14, 0),
("7 MARLA", 8, 7, 42, 0, 0),
("7 MARLA", 8, 8, 8, 16, 0),
("7 MARLA", 8, 9, 9, 8, 0),
("7 MARLA", 8, 10, 1060, 1154, 0),
("7 MARLA", 8, 11, 20, 20, 0),
("7 MARLA", 8, 12, 20, 20, 0);


-- 10 Marla

-- 10_1 Marla

INSERT INTO filter_labour (AREA_SQFTS, LAYOUT_10_ID, LABOUR_ID, GROUND_SQFTS, FIRST_FLOOR_SQFTS, BASEMENT_SQFTS)
VALUES 
("10 MARLA", 1, 4, 9646, 5580, 3542),
("10 MARLA", 1, 5, 2770, 2167, 1687),
("10 MARLA", 1, 6, 14, 14, 14),
("10 MARLA", 1, 7, 60, 60, 0),
("10 MARLA", 1, 8, 12, 16, 0),
("10 MARLA", 1, 9, 9, 9, 0),
("10 MARLA", 1, 10, 1546, 1764, 1568),
("10 MARLA", 1, 11, 20, 20, 20),
("10 MARLA", 1, 12, 20, 20, 20);


-- 10_2 Marla

INSERT INTO filter_labour (AREA_SQFTS, LAYOUT_10_ID, LABOUR_ID, GROUND_SQFTS, FIRST_FLOOR_SQFTS, BASEMENT_SQFTS)
VALUES 
("10 MARLA", 2, 4, 9213, 5335, 3785),
("10 MARLA", 2, 5, 2741, 1933, 1773),
("10 MARLA", 2, 6, 14, 14, 14),
("10 MARLA", 2, 7, 60, 60, 0),
("10 MARLA", 2, 8, 12, 12, 6),
("10 MARLA", 2, 9, 10, 9, 2),
("10 MARLA", 2, 10, 1552, 1682, 1384),
("10 MARLA", 2, 11, 20, 20, 20),
("10 MARLA", 2, 12, 20, 20, 20);


-- 10_3 Marla

INSERT INTO filter_labour (AREA_SQFTS, LAYOUT_10_ID, LABOUR_ID, GROUND_SQFTS, FIRST_FLOOR_SQFTS, BASEMENT_SQFTS)
VALUES 
("10 MARLA", 3, 4, 9480, 4953, 0),
("10 MARLA", 3, 5, 2830, 2050, 0),
("10 MARLA", 3, 6, 14, 14, 0),
("10 MARLA", 3, 7, 51, 57, 0),
("10 MARLA", 3, 8, 12, 12, 0),
("10 MARLA", 3, 9, 11, 10, 0),
("10 MARLA", 3, 10, 1587, 1650, 0),
("10 MARLA", 3, 11, 20, 20, 0),
("10 MARLA", 3, 12, 20, 20, 0);

-- 10_4 Marla

INSERT INTO filter_labour (AREA_SQFTS, LAYOUT_10_ID, LABOUR_ID, GROUND_SQFTS, FIRST_FLOOR_SQFTS, BASEMENT_SQFTS)
VALUES 
("10 MARLA", 4, 4, 9463, 5302, 0),
("10 MARLA", 4, 5, 3058, 2365, 0),
("10 MARLA", 4, 6, 14, 14, 0),
("10 MARLA", 4, 7, 51, 51, 0),
("10 MARLA", 4, 8, 18, 18, 0),
("10 MARLA", 4, 9, 9, 7, 0),
("10 MARLA", 4, 10, 1739, 1613, 0),
("10 MARLA", 4, 11, 20, 20, 0),
("10 MARLA", 4, 12, 20, 20, 0);

-- 10 Marla Mirrors

-- 10_5 Marla

INSERT INTO filter_labour (AREA_SQFTS, LAYOUT_10_ID, LABOUR_ID, GROUND_SQFTS, FIRST_FLOOR_SQFTS, BASEMENT_SQFTS)
VALUES 
("10 MARLA", 5, 4, 9646, 5580, 3542),
("10 MARLA", 5, 5, 2770, 2167, 1687),
("10 MARLA", 5, 6, 14, 14, 14),
("10 MARLA", 5, 7, 60, 60, 0),
("10 MARLA", 5, 8, 12, 16, 0),
("10 MARLA", 5, 9, 9, 9, 0),
("10 MARLA", 5, 10, 1546, 1764, 1568),
("10 MARLA", 5, 11, 20, 20, 20),
("10 MARLA", 5, 12, 20, 20, 20);


-- 10_6 Marla

INSERT INTO filter_labour (AREA_SQFTS, LAYOUT_10_ID, LABOUR_ID, GROUND_SQFTS, FIRST_FLOOR_SQFTS, BASEMENT_SQFTS)
VALUES 
("10 MARLA", 6, 4, 9213, 5335, 3785),
("10 MARLA", 6, 5, 2741, 1933, 1773),
("10 MARLA", 6, 6, 14, 14, 14),
("10 MARLA", 6, 7, 60, 60, 0),
("10 MARLA", 6, 8, 12, 12, 6),
("10 MARLA", 6, 9, 10, 9, 2),
("10 MARLA", 6, 10, 1552, 1682, 1384),
("10 MARLA", 6, 11, 20, 20, 20),
("10 MARLA", 6, 12, 20, 20, 20);


-- 10_7 Marla

INSERT INTO filter_labour (AREA_SQFTS, LAYOUT_10_ID, LABOUR_ID, GROUND_SQFTS, FIRST_FLOOR_SQFTS, BASEMENT_SQFTS)
VALUES 
("10 MARLA", 7, 4, 9480, 4953, 0),
("10 MARLA", 7, 5, 2830, 2050, 0),
("10 MARLA", 7, 6, 14, 14, 0),
("10 MARLA", 7, 7, 51, 57, 0),
("10 MARLA", 7, 8, 12, 12, 0),
("10 MARLA", 7, 9, 11, 10, 0),
("10 MARLA", 7, 10, 1587, 1650, 0),
("10 MARLA", 7, 11, 20, 20, 0),
("10 MARLA", 7, 12, 20, 20, 0);

-- 10_8 Marla

INSERT INTO filter_labour (AREA_SQFTS, LAYOUT_10_ID, LABOUR_ID, GROUND_SQFTS, FIRST_FLOOR_SQFTS, BASEMENT_SQFTS)
VALUES 
("10 MARLA", 8, 4, 9463, 5302, 0),
("10 MARLA", 8, 5, 3058, 2365, 0),
("10 MARLA", 8, 6, 14, 14, 0),
("10 MARLA", 8, 7, 51, 51, 0),
("10 MARLA", 8, 8, 18, 18, 0),
("10 MARLA", 8, 9, 9, 7, 0),
("10 MARLA", 8, 10, 1739, 1613, 0),
("10 MARLA", 8, 11, 20, 20, 0),
("10 MARLA", 8, 12, 20, 20, 0);


-- 20 Marla

-- 20_1 Marla

INSERT INTO filter_labour (AREA_SQFTS, LAYOUT_20_ID, LABOUR_ID, GROUND_SQFTS, FIRST_FLOOR_SQFTS, BASEMENT_SQFTS)
VALUES 
("20 MARLA", 1, 4, 15630, 8217, 4852),
("20 MARLA", 1, 5, 5529, 3327, 2800),
("20 MARLA", 1, 6, 25, 25, 25),
("20 MARLA", 1, 7, 58, 58, 0),
("20 MARLA", 1, 8, 32, 16, 0),
("20 MARLA", 1, 9, 12, 11, 0),
("20 MARLA", 1, 10, 3022, 3000, 2660),
("20 MARLA", 1, 11, 30, 30, 30),
("20 MARLA", 1, 12, 30, 30, 30);

-- 20_2 Marla

INSERT INTO filter_labour (AREA_SQFTS, LAYOUT_20_ID, LABOUR_ID, GROUND_SQFTS, FIRST_FLOOR_SQFTS, BASEMENT_SQFTS)
VALUES 
("20 MARLA", 2, 4, 1545, 8118, 6028),
("20 MARLA", 2, 5, 5466, 4281, 3179),
("20 MARLA", 2, 6, 25, 25, 25),
("20 MARLA", 2, 7, 78, 84, 0),
("20 MARLA", 2, 8, 32, 32, 8),
("20 MARLA", 2, 9, 12, 11, 2),
("20 MARLA", 2, 10, 3328, 2574, 2436),
("20 MARLA", 2, 11, 30, 30, 30),
("20 MARLA", 2, 12, 30, 30, 30);


-- 20_3 Marla

INSERT INTO filter_labour (AREA_SQFTS, LAYOUT_20_ID, LABOUR_ID, GROUND_SQFTS, FIRST_FLOOR_SQFTS, BASEMENT_SQFTS)
VALUES 
("20 MARLA", 3, 4, 15608, 8426, 0),
("20 MARLA", 3, 5, 5106, 3419, 0),
("20 MARLA", 3, 6, 25, 25, 0),
("20 MARLA", 3, 7, 56, 62, 0),
("20 MARLA", 3, 8, 24, 32, 0),
("20 MARLA", 3, 9, 12, 11, 0),
("20 MARLA", 3, 10, 2586, 2094, 0),
("20 MARLA", 3, 11, 30, 30, 0),
("20 MARLA", 3, 12, 30, 30, 0);

-- 20_4 Marla

INSERT INTO filter_labour (AREA_SQFTS, LAYOUT_20_ID, LABOUR_ID, GROUND_SQFTS, FIRST_FLOOR_SQFTS, BASEMENT_SQFTS)
VALUES 
("20 MARLA", 4, 4, 15125, 7249, 0),
("20 MARLA", 4, 5, 5299, 3486, 0),
("20 MARLA", 4, 6, 25, 25, 0),
("20 MARLA", 4, 7, 52, 52, 0),
("20 MARLA", 4, 8, 24, 24, 0),
("20 MARLA", 4, 9, 12, 11, 0),
("20 MARLA", 4, 10, 2004, 2110, 0),
("20 MARLA", 4, 11, 30, 30, 0),
("20 MARLA", 4, 12, 30, 30, 0);

-- 20 Marla Mirrors

-- 20_5 Marla

INSERT INTO filter_labour (AREA_SQFTS, LAYOUT_20_ID, LABOUR_ID, GROUND_SQFTS, FIRST_FLOOR_SQFTS, BASEMENT_SQFTS)
VALUES 
("20 MARLA", 5, 4, 15630, 8217, 4852),
("20 MARLA", 5, 5, 5529, 3327, 2800),
("20 MARLA", 5, 6, 25, 25, 25),
("20 MARLA", 5, 7, 58, 58, 0),
("20 MARLA", 5, 8, 32, 16, 0),
("20 MARLA", 5, 9, 12, 11, 0),
("20 MARLA", 5, 10, 3022, 3000, 2660),
("20 MARLA", 5, 11, 30, 30, 30),
("20 MARLA", 5, 12, 30, 30, 30);

-- 20_6 Marla

INSERT INTO filter_labour (AREA_SQFTS, LAYOUT_20_ID, LABOUR_ID, GROUND_SQFTS, FIRST_FLOOR_SQFTS, BASEMENT_SQFTS)
VALUES 
("20 MARLA", 6, 4, 1545, 8118, 6028),
("20 MARLA", 6, 5, 5466, 4281, 3179),
("20 MARLA", 6, 6, 25, 25, 25),
("20 MARLA", 6, 7, 78, 84, 0),
("20 MARLA", 6, 8, 32, 32, 8),
("20 MARLA", 6, 9, 12, 11, 2),
("20 MARLA", 6, 10, 3328, 2574, 2436),
("20 MARLA", 6, 11, 30, 30, 30),
("20 MARLA", 6, 12, 30, 30, 30);


-- 20_7 Marla

INSERT INTO filter_labour (AREA_SQFTS, LAYOUT_20_ID, LABOUR_ID, GROUND_SQFTS, FIRST_FLOOR_SQFTS, BASEMENT_SQFTS)
VALUES 
("20 MARLA", 7, 4, 15608, 8426, 0),
("20 MARLA", 7, 5, 5106, 3419, 0),
("20 MARLA", 7, 6, 25, 25, 0),
("20 MARLA", 7, 7, 56, 62, 0),
("20 MARLA", 7, 8, 24, 32, 0),
("20 MARLA", 7, 9, 12, 11, 0),
("20 MARLA", 7, 10, 2586, 2094, 0),
("20 MARLA", 7, 11, 30, 30, 0),
("20 MARLA", 7, 12, 30, 30, 0);

-- 20_8 Marla

INSERT INTO filter_labour (AREA_SQFTS, LAYOUT_20_ID, LABOUR_ID, GROUND_SQFTS, FIRST_FLOOR_SQFTS, BASEMENT_SQFTS)
VALUES 
("20 MARLA", 8, 4, 15125, 7249, 0),
("20 MARLA", 8, 5, 5299, 3486, 0),
("20 MARLA", 8, 6, 25, 25, 0),
("20 MARLA", 8, 7, 52, 52, 0),
("20 MARLA", 8, 8, 24, 24, 0),
("20 MARLA", 8, 9, 12, 11, 0),
("20 MARLA", 8, 10, 2004, 2110, 0),
("20 MARLA", 8, 11, 30, 30, 0),
("20 MARLA", 8, 12, 30, 30, 0);






UPDATE filter_labour
SET AREA_SQFTS = UPPER(AREA_SQFTS);

select* from filter_labour;
SELECT * FROM FILTER_LABOUR WHERE AREA_SQFTS="20 MARLA";
SELECT * FROM FILTER_LABOUR where filter_labour_id>120 and area_sqfts="20 MARLA"; 
SELECT * FROM LABOUR;





SELECT A.LABOUR_ID, A.LABOUR_TYPE, B.GROUND_SQFTS, B.FIRST_FLOOR_SQFTS, B.BASEMENT_SQFTS,A.RATE AS RATE , A.FACTOR,
A.RATE*B.GROUND_SQFTS AS LABOUR_A, A.RATE*FIRST_FLOOR_SQFTS AS LABOUR_B 
FROM LABOUR AS A INNER JOIN FILTER_LABOUR AS B
WHERE AREA_SQFTS = "3 MARLA" AND LAYOUT_3_ID=1 AND A.LABOUR_ID = B.LABOUR_ID;
 

SELECT 
    A.LABOUR_TYPE,
    ROUND((A.RATE * (B.GROUND_SQFTS+ B.FIRST_FLOOR_SQFTS)),0) AS total_cost
FROM 
    LABOUR AS A
JOIN 
    FILTER_LABOUR AS B ON A.LABOUR_ID = B.LABOUR_ID
WHERE 
    B.AREA_SQFTS= '3 MARLA'
    AND B.LAYOUT_3_ID = 1;

SELECT 
    SUM(total_cost) AS total_cost_sum
FROM (
    SELECT 
        A.LABOUR_TYPE,
        A.FACTOR,
        ROUND((A.RATE),0) AS rate_rounded,
        (B.GROUND_SQFTS+B.FIRST_FLOOR_SQFTS) AS total_quantity,
        ROUND((A.RATE * (B.GROUND_SQFTS + B.FIRST_FLOOR_SQFTS)),0) AS total_cost
    FROM 
        LABOUR AS A
    JOIN 
        FILTER_LABOUR AS B ON A.LABOUR_ID = B.LABOUR_ID
    WHERE 
        B.AREA_SQFTS= '3 MARLA'
        AND B.LAYOUT_3_ID = 1
) AS subquery;	

 
-- ------------------------------
DROP TABLE IF EXISTS FINISHING_MATERIALS;
 
CREATE TABLE FINISHING_MATERIALS
(
MATERIAL_ID INT PRIMARY KEY AUTO_INCREMENT,
MATERIAL_NAME VARCHAR(250),
FACTOR VARCHAR(15),
RATE_A FLOAT,
CLASS_A VARCHAR(200),
RATE_B FLOAT,
CLASS_B VARCHAR(200),
RATE_C FLOAT,
CLASS_C VARCHAR(200),
RATE_D FLOAT,
CLASS_D VARCHAR(200)
);

INSERT INTO FINISHING_MATERIALS 
VALUES
(1,'Main Gate', 'Sqft', 14500, 'Al-Hadeed (Wrought Iron)', 9000, 'Aluminium House (Aluminium)', 6000, 'Steel Tech Ind. (Steel)', 4700, 'Metal Craft (Metal)');


INSERT INTO FINISHING_MATERIALS (MATERIAL_NAME, FACTOR, RATE_A, CLASS_A, RATE_B, CLASS_B, RATE_C, CLASS_C, RATE_D, CLASS_D)
VALUES
('Garage Tiles', 'Sqft', 600, 'Master Tiles (Porcelain Tiles)', 350, 'Sonex Tiles (Ceramic Tiles)', 250, 'Orient Tiles (Vinyl Tile)', 170, 'Popular Tiles (Concrete Tile)'),
('Door Bell', 'Unit', 1150, 'Clopal Night Rider', 910, 'Clopal Platinum Switch', 730, 'Clopal Ideas White', 670, 'Clopal Cloud'),
('Entrance Door', 'Cft', 95000, 'Master Door (Teak Wood)', 46000, 'Star Plywood (MDF)', 28000, 'Master (UPVC)', 14000, 'Al Qaim (Fiber Glass)'),
('Fan Dimmer', 'Unit', 1830, 'Clopal Pearl Bravo Series', 1500, 'Clopal Platinum Switch', 1360, 'Clopal ARC Series', 1250, 'Clopal Cloud Series'),
('Telephone Socket', 'Unit', 1200, 'Clopal Night Rider', 1010, 'Clopal Pearl Bravo', 980, 'Clopal Elegant', 790, 'Clopal ARC'),
('Universal Switch Socket', 'Unit', 3170, 'Clopal Pearl Bravo Series', 2700, 'Clopal Pearl Bravo', 2360, 'Clopal Platinum Switches', 1900, 'Clopal ARC'),
('Distribution Board', 'Unit', 9120, 'Royal Electric 24/36', 6700, 'Royal Electric 20/30', 3720, 'Royal Electric 15/25', 1500, 'Royal Electric 10/12'),
('Power Sockets', 'Unit', 1240, 'Clopal Pearl Bravo Series', 1160, 'Clopal Platinum Switch', 870, 'Clopal Golden Metalic', 720, 'Clopal Idea White'),
('Switch Board', 'Unit', 1360, 'Clopal Platinum Switches', 1240, 'Clopal Night Rider', 1180, 'Clopal ARC', 960, 'Clopal Cloud'),
('Room Door', 'Cft', 95000, 'Master Door (Teak Wood)', 46000, 'Star Plywood (MDF)', 28000, 'Master (UPVC)', 14000, 'Al Qaim (Fiber Glass)'),
('Room Window aluminium+glass', 'Sqft', 1900, 'Al Farooq (aluminum frames with double-glazed tempered glass)', 1200, 'Al Fazal (Standard aluminum frames with single-glazed glass)', 900, 'AL Hafeez (Basic aluminum frames with single-glazed glass)', 900, 'AL Hafeez (Basic aluminum frames with single-glazed glass)'),
('Wardrobe', 'Unit', 103500, 'ANTONIA Watdrobe', 78000, 'JERICHO Wardrobe Pak Tameer', 54000, 'ZOLA Wardrobe Pak Tameer', 33000, 'Elyse Wardrobe Furniture City'),
('Fans', 'Unit', 14300, 'Royals fans (Lifestyle Ornament)', 11070, 'GFC fans', 9500, 'Royals Fan (Deluxe Imperial)', 8300, 'Rico Innovative Fans (Deluxe Standard)'),
('Lights', 'Unit', 1270, 'Osaka 7W Light', 1100, 'Coarts 7W Light', 500, 'Orient Lighting', 320, 'Delta Lite'),
('Paint', 'Gallon', 5000, 'Brighto Weather sheet', 4700, 'Alwan Enamel Paint', 4500, 'Happilac Plastic Emulsion', 2800, 'Alwan Wall Emulsion'),
('Washroom Door', 'Cft', 95000, 'Master Door (Teak Wood)', 46000, 'Star Plywood (MDF)', 28000, 'Master (UPVC)', 14000, 'Al Qaim (Fiber Glass)'),
('Washroom Exhaust Fan', 'Unit', 5370, 'GFC Plastic Exhaust Wooden', 4590, 'Royal  Exhaust Fan (2 Way)', 3790, 'Royal Exhaust Plastic Fan(1 Way)', 2990, 'GFC Window Exhaust'),
('Washroom Slab Marble', 'Sqft', 1200, 'Ziarat Supreme White', 800, 'Ziarat White', 600, 'Strawberry Pink', 350, 'Ziarat Grey'),
('Washroom Tiles', 'Sqft', 950, 'Master Tiles (Ceramic Tiles)', 600, 'National Tiles (Cermaic Tiles)', 400, 'Popular Tiles (Ceramic Tiles)', 300, 'Milano Tiles (Ceramic Tiles)'),
('Washroom Wall Tiles', 'Sqft', 950, 'Master Tiles (Ceramic Tiles)', 600, 'National Tiles (Cermaic Tiles)', 400, 'Popular Tiles (Ceramic Tiles)', 300, 'Milano Tiles (Ceramic Tiles)'),
('Washroom Window', 'Unit', 25400, '4 by 5 Aluminium Window', 20320, '4 by 4 Aluminium Window', 15240, '3 by 4 Aluminium Window', 11430, '3 by 3 Aluminium Window'),
('Washroom Mirror', 'Unit', 17500, 'LED Vanity Royal Mirror', 13500, 'LED Fancy Royal Mirror', 8500, 'LED Round Vanity Royal Mirror', 2780, 'Faisal Sanitary Plastic Mirror'),
('Muslim Shower Set', 'Unit', 3050, 'Master Sanitary Fitting', 2710, 'Vigo', 1950, 'Echo Sanitary Ware', 1650, 'Faco Sanitary Ware'),
('Senitary Set (Shower Set)', 'Unit', 45000, 'Grohe Pakistan', 28000, 'Cera Sanitary Ware', 18000, 'Sonex Sanitary Ware', 16000, 'Faisal Sanitary Ware'),
('Toilet Seat', 'Unit', 26600, 'Master Sanitary Ware', 18400, 'Pool Sanitary Ware', 15600, 'GALAXY Sanitary Ware', 11660, 'Pool Sanitary Ware'),
('Wash Basin', 'Unit', 35000, 'Kohler Sanitary', 19000, 'Sonex Sanitary', 15000, 'Faisal Sanitary', 11000, 'Master Sanitary'),
('Kitchen Cabinets', 'Linear Foot', 12000, 'Inter Wood (MDF with laminate finish)', 10000, 'Master Kitchen (MDF with Laminate finish)', 8000, 'Al Habib (Engineered Wood MDF)', 4500, 'Al Habib (Particle Board or MDF)'),
('Kitchen Exhaust Fans', 'Unit', 11400, 'Royal Exhaust Metal High Speed', 5510, 'GFC Metal Vip Exhaust Fan', 4390, 'Royal Metal Exhaust Fan', 2990, 'Royal Fans'),
('Kitchen Hood', 'Unit', 64800, 'HAIER HOOD', 56000, 'Hanco Hood', 33000, 'Nas Gas Hood', 31250, 'Super Asia Kitchen Hood'),
('Kitchen Slabs', 'Sqft', 3000, 'Granite', 1200, 'Ziarat Supreme White', 800, 'Ziarat White', 350, 'Ziarat Grey'),
('Kitchen Stove', 'Unit', 81400, 'Dawlance', 76200, 'Haier', 24000, 'Golden Fuji', 17100, 'Aardee Gas Hob'),
('Kitchen Wall Tiles', 'Sqft', 1400, 'Sonex Ceramics', 1050, 'Master Tiles', 800, 'Stile Tiles', 500, 'Popular Tiles'),
('Kitchen Wash Basin', 'Unit', 33120, 'Impotrted Double Kitchen Sink', 23500, 'Impotrted Double Kitchen Sink', 22250, 'Imported Double Kitchen Sink', 16000, 'Sus 304 Stainless Steel'),
('Kitchen Window', 'Sqft', 1900, 'Al Farooq (aluminum frames with double-glazed tempered glass)', 1200, 'Al Fazal (Standard aluminum frames with single-glazed glass)', 900, 'AL Hafeez (Basic aluminum frames with single-glazed glass)', 900, 'AL Hafeez (Basic aluminum frames with single-glazed glass)'),
('Floor Tiles', 'Sqft', 1300, 'Master Tiles (Ceramic Tiles)', 700, 'Sonex Tiles (Cermaic Tiles)', 550, 'Popular Tiles (Ceramic Tiles)', 300, 'Milano Tiles (Ceramic Tiles)'),
('Stairs Reiling', 'Linear Foot', 3000, 'Stainless Steel Solutions', 2500, 'Aluminium Creations Pakistan', 1500, 'Steel Crafts Pakistan', 1200, 'Apna Iron Works'),
('Stairs Tiles', 'Sqft', 800, 'Granite', 550, 'Hard Wood (Maple)', 350, 'Ceramic', 150, 'Vinyl'),
('Chandelier', 'Unit', 560000, 'Naeem Trading',560000, 'Naeem Trading', 280000, 'Ceiling Lighting Crystal Chandelier',280000, 'Ceiling Lighting Crystal Chandelier'),
('False Ceiling', 'Sqft', 150, 'Decorita Home services', 120, 'Decorita Home services', 100, 'Decorita Home services', 100, 'Decorita Home services'),
('Floor Skirting', 'Sqft', 2500, 'Indus Gold', 1800, 'Sunny Grey', 1500, 'Diana Marble', 1000, 'Sahara Beige'),
('Geyser', 'Unit', 55500, 'Nas Gas Super Heavy', 49800, 'Nas Gas Super Deluxe', 49800, 'Nas Gas Super Deluxe', 41250, 'Nas Gas Deluxe');



SELECT * FROM FINISHING_MATERIALS;

SELECT Material_Name, Factor, Rate_A,Class_A,Rate_B, Class_B, Rate_C, Class_C, Rate_D, Class_D 
from Finishing_Materials;

-- -------------------------

DROP TABLE IF EXISTS FILTER_FINISHING_MATERIALS;
 
CREATE TABLE FILTER_FINISHING_MATERIALS
(
FILTER_FINISHING_MATERIAL_ID INT NOT NULL primary key auto_increment,
AREA_QTY VARCHAR(20) NOT NULL,
LAYOUT_3_ID INT default NULL,
LAYOUT_5_ID INT default NULL,
LAYOUT_7_ID INT default NULL,
LAYOUT_10_ID INT default NULL,
LAYOUT_20_ID INT default NULL,
MATERIAL_ID INT default NULL,
GROUND_QTY INT ,
FIRST_FLOOR_QTY INT ,
ROOFTOP_QTY INT ,
BASEMENT_QTY INT NULL,
FOREIGN KEY (MATERIAL_ID) REFERENCES FINISHING_MATERIALS(MATERIAL_ID),
FOREIGN KEY (LAYOUT_3_ID) REFERENCES LAYOUT_3(ID),
FOREIGN KEY (LAYOUT_5_ID) REFERENCES LAYOUT_5(ID),
FOREIGN KEY (LAYOUT_7_ID) REFERENCES LAYOUT_7(ID),
FOREIGN KEY (LAYOUT_10_ID) REFERENCES LAYOUT_10(ID),
FOREIGN KEY (LAYOUT_20_ID) REFERENCES LAYOUT_20(ID)
);

SELECT * FROM FILTER_GREY_MATERIALS;
SELECT * FROM FINISHING_MATERIALS;
SELECT * FROM FILTER_FINISHING_MATERIALS;


-- 3_1
INSERT INTO FILTER_FINISHING_MATERIALS (AREA_QTY, LAYOUT_3_ID, MATERIAL_ID, GROUND_QTY, FIRST_FLOOR_QTY, ROOFTOP_QTY, BASEMENT_QTY) 
VALUES 
('3 MARLA', 1, 1, 48, 0, 0, 0),
('3 MARLA', 1, 2, 131, 0, 0, 0),
('3 MARLA', 1, 3, 1, 0, 0, 0),
('3 MARLA', 1, 4, 3.5, 0, 0, 0),
('3 MARLA', 1, 5, 6, 5, 1, 2),
('3 MARLA', 1, 6, 2, 3, 0, 0),
('3 MARLA', 1, 7, 6, 5, 1, 2),
('3 MARLA', 1, 8, 1, 0, 0, 0),
('3 MARLA', 1, 9, 6, 5, 1, 1),
('3 MARLA', 1, 10, 6, 5, 1, 1),
('3 MARLA', 1, 11, 4.375, 6.5625, 2.1875, 2.1875),
('3 MARLA', 1, 12, 57, 42, 24, 30),
('3 MARLA', 1, 13, 2, 2, 0, 1),
('3 MARLA', 1, 14, 6, 5, 1, 2),
('3 MARLA', 1, 15, 75, 64, 10, 26),
('3 MARLA', 1, 16, 6, 5, 2, 5),
('3 MARLA', 1, 17, 5.25, 3.5, 0, 3.5),
('3 MARLA', 1, 18, 1, 2, 0, 1),
('3 MARLA', 1, 19, 4, 8, 0, 4),
('3 MARLA', 1, 20, 45, 63, 0, 35),
('3 MARLA', 1, 21, 150, 186, 0, 150),
('3 MARLA', 1, 22, 1, 2, 0, 1),
('3 MARLA', 1, 23, 1, 2, 0, 1),
('3 MARLA', 1, 24, 1, 2, 0, 1),
('3 MARLA', 1, 25, 1, 2, 0, 1),
('3 MARLA', 1, 26, 1, 2, 0, 1),
('3 MARLA', 1, 27, 1, 2, 0, 1),
('3 MARLA', 1, 28, 24, 0, 0, 0),
('3 MARLA', 1, 29, 1, 0, 0, 0),
('3 MARLA', 1, 30, 1, 0, 0, 0),
('3 MARLA', 1, 31, 32, 0, 0, 0),
('3 MARLA', 1, 32, 1, 0, 0, 0),
('3 MARLA', 1, 33, 126, 0, 0, 0),
('3 MARLA', 1, 34, 1, 0, 0, 0),
('3 MARLA', 1, 35, 20, 0, 0, 0),
('3 MARLA', 1, 36, 554, 372, 81, 450),
('3 MARLA', 1, 37, 14, 14, 0, 14),
('3 MARLA', 1, 38, 92, 92, 0, 92),
('3 MARLA', 1, 39, 1, 1, 0, 1),
('3 MARLA', 1, 40, 586, 586, 81, 401),
('3 MARLA', 1, 41, 148, 115, 71, 55),
('3 MARLA', 1, 42, 1, 0, 0, 0);
	
 
 -- 3_2
 
INSERT INTO FILTER_FINISHING_MATERIALS (AREA_QTY, LAYOUT_3_ID, MATERIAL_ID, GROUND_QTY, FIRST_FLOOR_QTY, ROOFTOP_QTY, BASEMENT_QTY) 
VALUES 
('3 MARLA', 2, 1, 48, 0, 0, 0),
('3 MARLA', 2, 2, 140, 0, 0, 0),
('3 MARLA', 2, 3, 1, 1, 0, 0),
('3 MARLA', 2, 4, 3.5, 0, 0, 0),
('3 MARLA', 2, 5, 5, 4, 1, 2),
('3 MARLA', 2, 6, 2, 3, 0, 0),
('3 MARLA', 2, 7, 5, 4, 1, 2),
('3 MARLA', 2, 8, 1, 1, 0, 0),
('3 MARLA', 2, 9, 5, 4, 1, 1),
('3 MARLA', 2, 10, 5, 4, 1, 1),
('3 MARLA', 2, 11, 8.75, 2.1875, 2.1875, 0),
('3 MARLA', 2, 12, 81, 54, 36, 0),
('3 MARLA', 2, 13, 1, 2, 0, 0),
('3 MARLA', 2, 14, 5, 4, 1, 2),
('3 MARLA', 2, 15, 80, 72, 10, 26),
('3 MARLA', 2, 16, 6, 5, 2, 5),
('3 MARLA', 2, 17, 1.75, 8.75, 0, 0),
('3 MARLA', 2, 18, 1, 1, 0, 0),
('3 MARLA', 2, 19, 4, 4, 0, 0),
('3 MARLA', 2, 20, 27.5, 36, 0, 0),
('3 MARLA', 2, 21, 111, 130, 0, 0),
('3 MARLA', 2, 22, 1, 1, 0, 0),
('3 MARLA', 2, 23, 1, 1, 0, 0),
('3 MARLA', 2, 24, 1, 1, 0, 0),
('3 MARLA', 2, 25, 1, 1, 0, 0),
('3 MARLA', 2, 26, 1, 1, 0, 0),
('3 MARLA', 2, 27, 1, 1, 0, 0),
('3 MARLA', 2, 28, 42, 0, 0, 0),
('3 MARLA', 2, 29, 1, 0, 0, 0),
('3 MARLA', 2, 30, 1, 0, 0, 0),
('3 MARLA', 2, 31, 31.5, 0, 0, 0),
('3 MARLA', 2, 32, 1, 0, 0, 0),
('3 MARLA', 2, 33, 162, 0, 0, 0),
('3 MARLA', 2, 34, 1, 0, 0, 0),
('3 MARLA', 2, 35, 20, 0, 0, 0),
('3 MARLA', 2, 36, 352.75, 416, 81, 675),
('3 MARLA', 2, 37, 15, 15, 0, 15),
('3 MARLA', 2, 38, 98.4, 99, 0, 90),
('3 MARLA', 2, 39, 1, 1, 0, 0),
('3 MARLA', 2, 40, 625, 625, 81, 675),
('3 MARLA', 2, 41, 101, 61, 81, 53),
('3 MARLA', 2, 42, 1, 0, 0, 0);

 
-- 3_3
 
INSERT INTO FILTER_FINISHING_MATERIALS (AREA_QTY, LAYOUT_3_ID, MATERIAL_ID, GROUND_QTY, FIRST_FLOOR_QTY, ROOFTOP_QTY, BASEMENT_QTY) 
VALUES 
('3 MARLA', 3, 1, 48, 0, 0, NULL),
('3 MARLA', 3, 2, 135, 0, 0, NULL),
('3 MARLA', 3, 3, 1, 1, 0, NULL),
('3 MARLA', 3, 4, 3.5, 0, 0, NULL),
('3 MARLA', 3, 5, 5, 4, 1, NULL),
('3 MARLA', 3, 6, 3, 4, 0, NULL),
('3 MARLA', 3, 7, 5, 5, 1, NULL),
('3 MARLA', 3, 8, 1, 1, 0, NULL),
('3 MARLA', 3, 9, 5, 5, 1, NULL),
('3 MARLA', 3, 10, 5, 5, 1, NULL),
('3 MARLA', 3, 11, 4.375, 4.375, 2.1875, NULL),
('3 MARLA', 3, 12, 72, 66, 36, NULL),
('3 MARLA', 3, 13, 1, 2, 0, NULL),
('3 MARLA', 3, 14, 5, 4, 1, NULL),
('3 MARLA', 3, 15, 83, 69, 12, NULL),
('3 MARLA', 3, 16, 6, 5, 2, NULL),
('3 MARLA', 3, 17, 3.5, 3.5, 0, NULL),
('3 MARLA', 3, 18, 2, 2, 0, NULL),
('3 MARLA', 3, 19, 8, 8, 0, NULL),
('3 MARLA', 3, 20, 62, 88, 0, NULL),
('3 MARLA', 3, 21, 195, 307, 0, NULL),
('3 MARLA', 3, 22, 2, 2, 0, NULL),
('3 MARLA', 3, 23, 2, 2, 0, NULL),
('3 MARLA', 3, 24, 2, 2, 0, NULL),
('3 MARLA', 3, 25, 2, 2, 0, NULL),
('3 MARLA', 3, 26, 2, 2, 0, NULL),
('3 MARLA', 3, 27, 2, 2, 0, NULL),
('3 MARLA', 3, 28, 40, 0, 0, NULL),
('3 MARLA', 3, 29, 1, 0, 0, NULL),
('3 MARLA', 3, 30, 1, 0, 0, NULL),
('3 MARLA', 3, 31, 26, 0, 0, NULL),
('3 MARLA', 3, 32, 1, 0, 0, NULL),
('3 MARLA', 3, 33, 138, 0, 0, NULL),
('3 MARLA', 3, 34, 1, 0, 0, NULL),
('3 MARLA', 3, 35, 24, 0, 0, NULL),
('3 MARLA', 3, 36, 410, 459, 81, NULL),
('3 MARLA', 3, 37, 15, 14, 0, NULL),
('3 MARLA', 3, 38, 90, 90, 0, NULL),
('3 MARLA', 3, 39, 1, 1, 0, NULL),
('3 MARLA', 3, 40, 639, 565, 81, NULL),
('3 MARLA', 3, 41, 102, 92, 77, NULL),
('3 MARLA', 3, 42, 1, 0, 0, NULL);


-- 3_4

INSERT INTO FILTER_FINISHING_MATERIALS (AREA_QTY, LAYOUT_3_ID, MATERIAL_ID, GROUND_QTY, FIRST_FLOOR_QTY, ROOFTOP_QTY, BASEMENT_QTY) 
VALUES 
('3 MARLA', 4, 1, 48, 0, 0, NULL),
('3 MARLA', 4, 2, 176, 0, 0, NULL),
('3 MARLA', 4, 3, 1, 1, 0, NULL),
('3 MARLA', 4, 4, 3.5, 0, 0, NULL),
('3 MARLA', 4, 5, 6, 3, 1, NULL),
('3 MARLA', 4, 6, 4, 1, 0, NULL),
('3 MARLA', 4, 7, 9, 3, 1, NULL),
('3 MARLA', 4, 8, 1, 1, 0, NULL),
('3 MARLA', 4, 9, 6, 3, 1, NULL),
('3 MARLA', 4, 10, 9, 3, 1, NULL),
('3 MARLA', 4, 11, 13.125, 8.75, 2.1875, NULL),
('3 MARLA', 4, 12, 102, 96, 24, NULL),
('3 MARLA', 4, 13, 2, 3, 0, NULL),
('3 MARLA', 4, 14, 6, 3, 1, NULL),
('3 MARLA', 4, 15, 105, 70, 11, NULL),
('3 MARLA', 4, 16, 6, 5, 2, NULL),
('3 MARLA', 4, 17, 5.25, 3.5, 0, NULL),
('3 MARLA', 4, 18, 3, 2, 0, NULL),
('3 MARLA', 4, 19, 24, 16, 0, NULL),
('3 MARLA', 4, 20, 75, 78, 0, NULL),
('3 MARLA', 4, 21, 317, 267, 0, NULL),
('3 MARLA', 4, 22, 3, 2, 0, NULL),
('3 MARLA', 4, 23, 3, 2, 0, NULL),
('3 MARLA', 4, 24, 3, 2, 0, NULL),
('3 MARLA', 4, 25, 3, 2, 0, NULL),
('3 MARLA', 4, 26, 3, 2, 0, NULL),
('3 MARLA', 4, 27, 3, 2, 0, NULL),
('3 MARLA', 4, 28, 36, 0, 0, NULL),
('3 MARLA', 4, 29, 1, 0, 0, NULL),
('3 MARLA', 4, 30, 1, 0, 0, NULL),
('3 MARLA', 4, 31, 27, 0, 0, NULL),
('3 MARLA', 4, 32, 1, 0, 0, NULL),
('3 MARLA', 4, 33, 126, 0, 0, NULL),
('3 MARLA', 4, 34, 1, 0, 0, NULL),
('3 MARLA', 4, 35, 30, 0, 0, NULL),
('3 MARLA', 4, 36, 345, 541, 81, NULL),
('3 MARLA', 4, 37, 15, 15, 0, NULL),
('3 MARLA', 4, 38, 90, 99, 0, NULL),
('3 MARLA', 4, 39, 1, 1, 0, NULL),
('3 MARLA', 4, 40, 615, 615, 81, NULL),
('3 MARLA', 4, 41, 110, 78, 79, NULL),
('3 MARLA', 4, 42, 1, 0, 0, NULL);

 -- 3_5
 
 INSERT INTO FILTER_FINISHING_MATERIALS (AREA_QTY, LAYOUT_3_ID, MATERIAL_ID, GROUND_QTY, FIRST_FLOOR_QTY, ROOFTOP_QTY, BASEMENT_QTY) 
VALUES 
('3 MARLA', 5, 1, 48, 0, 0, 0),
('3 MARLA', 5, 2, 131, 0, 0, 0),
('3 MARLA', 5, 3, 1, 0, 0, 0),
('3 MARLA', 5, 4, 3.5, 0, 0, 0),
('3 MARLA', 5, 5, 6, 5, 1, 2),
('3 MARLA', 5, 6, 2, 3, 0, 0),
('3 MARLA', 5, 7, 6, 5, 1, 2),
('3 MARLA', 5, 8, 1, 0, 0, 0),
('3 MARLA', 5, 9, 6, 5, 1, 1),
('3 MARLA', 5, 10, 6, 5, 1, 1),
('3 MARLA', 5, 11, 4.375, 6.5625, 2.1875, 2.1875),
('3 MARLA', 5, 12, 57, 42, 24, 30),
('3 MARLA', 5, 13, 2, 2, 0, 1),
('3 MARLA', 5, 14, 6, 5, 1, 2),
('3 MARLA', 5, 15, 75, 64, 10, 26),
('3 MARLA', 5, 16, 6, 5, 2, 5),
('3 MARLA', 5, 17, 5.25, 3.5, 0, 3.5),
('3 MARLA', 5, 18, 1, 2, 0, 1),
('3 MARLA', 5, 19, 4, 8, 0, 4),
('3 MARLA', 5, 20, 45, 63, 0, 35),
('3 MARLA', 5, 21, 150, 186, 0, 150),
('3 MARLA', 5, 22, 1, 2, 0, 1),
('3 MARLA', 5, 23, 1, 2, 0, 1),
('3 MARLA', 5, 24, 1, 2, 0, 1),
('3 MARLA', 5, 25, 1, 2, 0, 1),
('3 MARLA', 5, 26, 1, 2, 0, 1),
('3 MARLA', 5, 27, 1, 2, 0, 1),
('3 MARLA', 5, 28, 24, 0, 0, 0),
('3 MARLA', 5, 29, 1, 0, 0, 0),
('3 MARLA', 5, 30, 1, 0, 0, 0),
('3 MARLA', 5, 31, 32, 0, 0, 0),
('3 MARLA', 5, 32, 1, 0, 0, 0),
('3 MARLA', 5, 33, 126, 0, 0, 0),
('3 MARLA', 5, 34, 1, 0, 0, 0),
('3 MARLA', 5, 35, 20, 0, 0, 0),
('3 MARLA', 5, 36, 554, 372, 81, 450),
('3 MARLA', 5, 37, 14, 14, 0, 14),
('3 MARLA', 5, 38, 92, 92, 0, 92),
('3 MARLA', 5, 39, 1, 1, 0, 1),
('3 MARLA', 5, 40, 586, 586, 81, 401),
('3 MARLA', 5, 41, 148, 115, 71, 55),
('3 MARLA', 5, 42, 1, 0, 0, 0);


 -- 3_6
INSERT INTO FILTER_FINISHING_MATERIALS (AREA_QTY, LAYOUT_3_ID, MATERIAL_ID, GROUND_QTY, FIRST_FLOOR_QTY, ROOFTOP_QTY, BASEMENT_QTY) 
VALUES 
('3 MARLA', 6, 1, 48, 0, 0, 0),
('3 MARLA', 6, 2, 140, 0, 0, 0),
('3 MARLA', 6, 3, 1, 1, 0, 0),
('3 MARLA', 6, 4, 3.5, 0, 0, 0),
('3 MARLA', 6, 5, 5, 4, 1, 2),
('3 MARLA', 6, 6, 2, 3, 0, 0),
('3 MARLA', 6, 7, 5, 4, 1, 2),
('3 MARLA', 6, 8, 1, 1, 0, 0),
('3 MARLA', 6, 9, 5, 4, 1, 1),
('3 MARLA', 6, 10, 5, 4, 1, 1),
('3 MARLA', 6, 11, 8.75, 2.1875, 2.1875, 0),
('3 MARLA', 6, 12, 81, 54, 36, 0),
('3 MARLA', 6, 13, 1, 2, 0, 0),
('3 MARLA', 6, 14, 5, 4, 1, 2),
('3 MARLA', 6, 15, 80, 72, 10, 26),
('3 MARLA', 6, 16, 6, 5, 2, 5),
('3 MARLA', 6, 17, 1.75, 8.75, 0, 0),
('3 MARLA', 6, 18, 1, 1, 0, 0),
('3 MARLA', 6, 19, 4, 4, 0, 0),
('3 MARLA', 6, 20, 27.5, 36, 0, 0),
('3 MARLA', 6, 21, 111, 130, 0, 0),
('3 MARLA', 6, 22, 1, 1, 0, 0),
('3 MARLA', 6, 23, 1, 1, 0, 0),
('3 MARLA', 6, 24, 1, 1, 0, 0),
('3 MARLA', 6, 25, 1, 1, 0, 0),
('3 MARLA', 6, 26, 1, 1, 0, 0),
('3 MARLA', 6, 27, 1, 1, 0, 0),
('3 MARLA', 6, 28, 42, 0, 0, 0),
('3 MARLA', 6, 29, 1, 0, 0, 0),
('3 MARLA', 6, 30, 1, 0, 0, 0),
('3 MARLA', 6, 31, 31.5, 0, 0, 0),
('3 MARLA', 6, 32, 1, 0, 0, 0),
('3 MARLA', 6, 33, 162, 0, 0, 0),
('3 MARLA', 6, 34, 1, 0, 0, 0),
('3 MARLA', 6, 35, 20, 0, 0, 0),
('3 MARLA', 6, 36, 352.75, 416, 81, 675),
('3 MARLA', 6, 37, 15, 15, 0, 15),
('3 MARLA', 6, 38, 98.4, 99, 0, 90),
('3 MARLA', 6, 39, 1, 1, 0, 0),
('3 MARLA', 6, 40, 625, 625, 81, 675),
('3 MARLA', 6, 41, 101, 61, 81, 53),
('3 MARLA', 6, 42, 1, 0, 0, 0);
 

 -- 3_7
 
 INSERT INTO FILTER_FINISHING_MATERIALS (AREA_QTY, LAYOUT_3_ID, MATERIAL_ID, GROUND_QTY, FIRST_FLOOR_QTY, ROOFTOP_QTY, BASEMENT_QTY) 
VALUES 
('3 MARLA', 7, 1, 48, 0, 0, NULL),
('3 MARLA', 7, 2, 135, 0, 0, NULL),
('3 MARLA', 7, 3, 1, 1, 0, NULL),
('3 MARLA', 7, 4, 3.5, 0, 0, NULL),
('3 MARLA', 7, 5, 5, 4, 1, NULL),
('3 MARLA', 7, 6, 3, 4, 0, NULL),
('3 MARLA', 7, 7, 5, 5, 1, NULL),
('3 MARLA', 7, 8, 1, 1, 0, NULL),
('3 MARLA', 7, 9, 5, 5, 1, NULL),
('3 MARLA', 7, 10, 5, 5, 1, NULL),
('3 MARLA', 7, 11, 4.375, 4.375, 2.1875, NULL),
('3 MARLA', 7, 12, 72, 66, 36, NULL),
('3 MARLA', 7, 13, 1, 2, 0, NULL),
('3 MARLA', 7, 14, 5, 4, 1, NULL),
('3 MARLA', 7, 15, 83, 69, 12, NULL),
('3 MARLA', 7, 16, 6, 5, 2, NULL),
('3 MARLA', 7, 17, 3.5, 3.5, 0, NULL),
('3 MARLA', 7, 18, 2, 2, 0, NULL),
('3 MARLA', 7, 19, 8, 8, 0, NULL),
('3 MARLA', 7, 20, 62, 88, 0, NULL),
('3 MARLA', 7, 21, 195, 307, 0, NULL),
('3 MARLA', 7, 22, 2, 2, 0, NULL),
('3 MARLA', 7, 23, 2, 2, 0, NULL),
('3 MARLA', 7, 24, 2, 2, 0, NULL),
('3 MARLA', 7, 25, 2, 2, 0, NULL),
('3 MARLA', 7, 26, 2, 2, 0, NULL),
('3 MARLA', 7, 27, 2, 2, 0, NULL),
('3 MARLA', 7, 28, 40, 0, 0, NULL),
('3 MARLA', 7, 29, 1, 0, 0, NULL),
('3 MARLA', 7, 30, 1, 0, 0, NULL),
('3 MARLA', 7, 31, 26, 0, 0, NULL),
('3 MARLA', 7, 32, 1, 0, 0, NULL),
('3 MARLA', 7, 33, 138, 0, 0, NULL),
('3 MARLA', 7, 34, 1, 0, 0, NULL),
('3 MARLA', 7, 35, 24, 0, 0, NULL),
('3 MARLA', 7, 36, 410, 459, 81, NULL),
('3 MARLA', 7, 37, 15, 14, 0, NULL),
('3 MARLA', 7, 38, 90, 90, 0, NULL),
('3 MARLA', 7, 39, 1, 1, 0, NULL),
('3 MARLA', 7, 40, 639, 565, 81, NULL),
('3 MARLA', 7, 41, 102, 92, 77, NULL),
('3 MARLA', 7, 42, 1, 0, 0, NULL);



-- 3_8

INSERT INTO FILTER_FINISHING_MATERIALS (AREA_QTY, LAYOUT_3_ID, MATERIAL_ID, GROUND_QTY, FIRST_FLOOR_QTY, ROOFTOP_QTY, BASEMENT_QTY) 
VALUES 
('3 MARLA', 8, 1, 48, 0, 0, NULL),
('3 MARLA', 8, 2, 176, 0, 0, NULL),
('3 MARLA', 8, 3, 1, 1, 0, NULL),
('3 MARLA', 8, 4, 3.5, 0, 0, NULL),
('3 MARLA', 8, 5, 6, 3, 1, NULL),
('3 MARLA', 8, 6, 4, 1, 0, NULL),
('3 MARLA', 8, 7, 9, 3, 1, NULL),
('3 MARLA', 8, 8, 1, 1, 0, NULL),
('3 MARLA', 8, 9, 6, 3, 1, NULL),
('3 MARLA', 8, 10, 9, 3, 1, NULL),
('3 MARLA', 8, 11, 13.125, 8.75, 2.1875, NULL),
('3 MARLA', 8, 12, 102, 96, 24, NULL),
('3 MARLA', 8, 13, 2, 3, 0, NULL),
('3 MARLA', 8, 14, 6, 3, 1, NULL),
('3 MARLA', 8, 15, 105, 70, 11, NULL),
('3 MARLA', 8, 16, 6, 5, 2, NULL),
('3 MARLA', 8, 17, 5.25, 3.5, 0, NULL),
('3 MARLA', 8, 18, 3, 2, 0, NULL),
('3 MARLA', 8, 19, 24, 16, 0, NULL),
('3 MARLA', 8, 20, 75, 78, 0, NULL),
('3 MARLA', 8, 21, 317, 267, 0, NULL),
('3 MARLA', 8, 22, 3, 2, 0, NULL),
('3 MARLA', 8, 23, 3, 2, 0, NULL),
('3 MARLA', 8, 24, 3, 2, 0, NULL),
('3 MARLA', 8, 25, 3, 2, 0, NULL),
('3 MARLA', 8, 26, 3, 2, 0, NULL),
('3 MARLA', 8, 27, 3, 2, 0, NULL),
('3 MARLA', 8, 28, 36, 0, 0, NULL),
('3 MARLA', 8, 29, 1, 0, 0, NULL),
('3 MARLA', 8, 30, 1, 0, 0, NULL),
('3 MARLA', 8, 31, 27, 0, 0, NULL),
('3 MARLA', 8, 32, 1, 0, 0, NULL),
('3 MARLA', 8, 33, 126, 0, 0, NULL),
('3 MARLA', 8, 34, 1, 0, 0, NULL),
('3 MARLA', 8, 35, 30, 0, 0, NULL),
('3 MARLA', 8, 36, 345, 541, 81, NULL),
('3 MARLA', 8, 37, 15, 15, 0, NULL),
('3 MARLA', 8, 38, 90, 99, 0, NULL),
('3 MARLA', 8, 39, 1, 1, 0, NULL),
('3 MARLA', 8, 40, 615, 615, 81, NULL),
('3 MARLA', 8, 41, 110, 78, 79, NULL),
('3 MARLA', 8, 42, 1, 0, 0, NULL);
 
 
-- 5_1
 
INSERT INTO FILTER_FINISHING_MATERIALS (AREA_QTY, LAYOUT_5_ID, MATERIAL_ID, GROUND_QTY, FIRST_FLOOR_QTY, ROOFTOP_QTY, BASEMENT_QTY) 
VALUES 
('5 MARLA', 1, 1, 60, 0, 0, 0),
('5 MARLA', 1, 2, 279, 0, 0, 0),
('5 MARLA', 1, 3, 1, 1, 0, 0),
('5 MARLA', 1, 4, 3.5, 0, 0, 0),
('5 MARLA', 1, 5, 5, 5, 1, 2),
('5 MARLA', 1, 6, 3, 3, 0, 0),
('5 MARLA', 1, 7, 7, 5, 1, 3),
('5 MARLA', 1, 8, 1, 1, 0, 0),
('5 MARLA', 1, 9, 7, 7, 1, 1),
('5 MARLA', 1, 10, 7, 7, 1, 2),
('5 MARLA', 1, 11, 10.9375, 8.75, 2.1875, 0),
('5 MARLA', 1, 12, 102, 72, 42, 0),
('5 MARLA', 1, 13, 1, 2, 0, 0),
('5 MARLA', 1, 14, 5, 5, 1, 2),
('5 MARLA', 1, 15, 89, 72, 12, 30),
('5 MARLA', 1, 16, 6, 5, 2, 5),
('5 MARLA', 1, 17, 0.875, 3.5, 0, 0),
('5 MARLA', 1, 18, 1, 2, 0, 0),
('5 MARLA', 1, 19, 4, 8, 0, 0),
('5 MARLA', 1, 20, 36, 103, 0, 0),
('5 MARLA', 1, 21, 141, 324, 0, 0),
('5 MARLA', 1, 22, 1, 2, 0, 0),
('5 MARLA', 1, 23, 1, 2, 0, 0),
('5 MARLA', 1, 24, 1, 2, 0, 0),
('5 MARLA', 1, 25, 1, 2, 0, 0),
('5 MARLA', 1, 26, 1, 2, 0, 0),
('5 MARLA', 1, 27, 1, 2, 0, 0),
('5 MARLA', 1, 28, 70, 0, 0, 0),
('5 MARLA', 1, 29, 1, 0, 0, 0),
('5 MARLA', 1, 30, 1, 0, 0, 0),
('5 MARLA', 1, 31, 53, 0, 0, 0),
('5 MARLA', 1, 32, 1, 0, 0, 0),
('5 MARLA', 1, 33, 228, 0, 0, 0),
('5 MARLA', 1, 34, 1, 0, 0, 0),
('5 MARLA', 1, 35, 24, 0, 0, 0),
('5 MARLA', 1, 36, 672, 787, 121, 1023),
('5 MARLA', 1, 37, 15, 15, 0, 15),
('5 MARLA', 1, 38, 90, 90, 0, 90),
('5 MARLA', 1, 39, 1, 1, 0, 1),
('5 MARLA', 1, 40, 993, 993, 121, 1023),
('5 MARLA', 1, 41, 151, 141, 100, 67),
('5 MARLA', 1, 42, 1, 0, 0, 0);

 
-- 5_2
 
 INSERT INTO FILTER_FINISHING_MATERIALS (AREA_QTY, LAYOUT_5_ID, MATERIAL_ID, GROUND_QTY, FIRST_FLOOR_QTY, ROOFTOP_QTY, BASEMENT_QTY) 
VALUES 
('5 MARLA', 2, 1, 60, 0, 0, 0),
('5 MARLA', 2, 2, 131, 0, 0, 0),
('5 MARLA', 2, 3, 1, 1, 0, 0),
('5 MARLA', 2, 4, 3.5, 0, 0, 0),
('5 MARLA', 2, 5, 5, 4, 1, 3),
('5 MARLA', 2, 6, 3, 2, 0, 0),
('5 MARLA', 2, 7, 7, 4, 1, 3),
('5 MARLA', 2, 8, 1, 1, 0, 0),
('5 MARLA', 2, 9, 7, 4, 1, 3),
('5 MARLA', 2, 10, 7, 4, 1, 3),
('5 MARLA', 2, 11, 8.75, 8.75, 2.1875, 2.1875),
('5 MARLA', 2, 12, 108, 144, 42, 30),
('5 MARLA', 2, 13, 2, 2, 0, 1),
('5 MARLA', 2, 14, 5, 4, 1, 3),
('5 MARLA', 2, 15, 86, 80, 14, 35),
('5 MARLA', 2, 16, 6, 5, 2, 5),
('5 MARLA', 2, 17, 5.25, 5.25, 0, 1.75),
('5 MARLA', 2, 18, 3, 3, 0, 1),
('5 MARLA', 2, 19, 12, 12, 0, 4),
('5 MARLA', 2, 20, 117, 117, 0, 144),
('5 MARLA', 2, 21, 418, 418, 0, 273),
('5 MARLA', 2, 22, 3, 3, 0, 1),
('5 MARLA', 2, 23, 3, 3, 0, 1),
('5 MARLA', 2, 24, 3, 3, 0, 1),
('5 MARLA', 2, 25, 3, 3, 0, 1),
('5 MARLA', 2, 26, 3, 3, 0, 1),
('5 MARLA', 2, 27, 3, 3, 0, 1),
('5 MARLA', 2, 28, 58, 0, 0, 0),
('5 MARLA', 2, 29, 1, 0, 0, 0),
('5 MARLA', 2, 30, 1, 0, 0, 0),
('5 MARLA', 2, 31, 44, 0, 0, 0),
('5 MARLA', 2, 32, 1, 0, 0, 0),
('5 MARLA', 2, 33, 193, 0, 0, 0),
('5 MARLA', 2, 34, 1, 0, 0, 0),
('5 MARLA', 2, 35, 24, 0, 0, 0),
('5 MARLA', 2, 36, 480, 746, 109, 927),
('5 MARLA', 2, 37, 15, 15, 0, 15),
('5 MARLA', 2, 38, 90, 90, 0, 90),
('5 MARLA', 2, 39, 1, 1, 0, 1),
('5 MARLA', 2, 40, 966, 905, 109, 951),
('5 MARLA', 2, 41, 100, 133, 81, 71),
('5 MARLA', 2, 42, 1, 0, 0, 0);

 
 -- 5_3
 
 INSERT INTO FILTER_FINISHING_MATERIALS (AREA_QTY, LAYOUT_5_ID, MATERIAL_ID, GROUND_QTY, FIRST_FLOOR_QTY, ROOFTOP_QTY, BASEMENT_QTY) 
VALUES 
('5 MARLA', 3, 1, 60, 0, 0, NULL),
('5 MARLA', 3, 2, 286, 0, 0, NULL),
('5 MARLA', 3, 3, 1, 1, 0, NULL),
('5 MARLA', 3, 4, 3.5, 0, 0, NULL),
('5 MARLA', 3, 5, 6, 4, 1, NULL),
('5 MARLA', 3, 6, 3, 2, 0, NULL),
('5 MARLA', 3, 7, 6, 4, 1, NULL),
('5 MARLA', 3, 8, 1, 1, 0, NULL),
('5 MARLA', 3, 9, 6, 4, 1, NULL),
('5 MARLA', 3, 10, 6, 4, 1, NULL),
('5 MARLA', 3, 11, 8.75, 8.75, 2.1875, NULL),
('5 MARLA', 3, 12, 84, 120, 36, NULL),
('5 MARLA', 3, 13, 2, 2, 0, NULL),
('5 MARLA', 3, 14, 6, 4, 1, NULL),
('5 MARLA', 3, 15, 106, 97, 17, NULL),
('5 MARLA', 3, 16, 6, 5, 2, NULL),
('5 MARLA', 3, 17, 3.5, 3.5, 0, NULL),
('5 MARLA', 3, 18, 2, 2, 0, NULL),
('5 MARLA', 3, 19, 8, 8, 0, NULL),
('5 MARLA', 3, 20, 104, 117, 0, NULL),
('5 MARLA', 3, 21, 312, 312, 0, NULL),
('5 MARLA', 3, 22, 2, 2, 0, NULL),
('5 MARLA', 3, 23, 2, 2, 0, NULL),
('5 MARLA', 3, 24, 2, 2, 0, NULL),
('5 MARLA', 3, 25, 2, 2, 0, NULL),
('5 MARLA', 3, 26, 2, 2, 0, NULL),
('5 MARLA', 3, 27, 2, 2, 0, NULL),
('5 MARLA', 3, 28, 60, 0, 0, NULL),
('5 MARLA', 3, 29, 1, 0, 0, NULL),
('5 MARLA', 3, 30, 1, 0, 0, NULL),
('5 MARLA', 3, 31, 45, 0, 0, NULL),
('5 MARLA', 3, 32, 1, 0, 0, NULL),
('5 MARLA', 3, 33, 198, 0, 0, NULL),
('5 MARLA', 3, 34, 1, 0, 0, NULL),
('5 MARLA', 3, 35, 36, 0, 0, NULL),
('5 MARLA', 3, 36, 571, 715, 132, NULL),
('5 MARLA', 3, 37, 15, 15, 0, NULL),
('5 MARLA', 3, 38, 90, 90, 90, NULL),
('5 MARLA', 3, 39, 1, 1, 0, NULL),
('5 MARLA', 3, 40, 929, 857, 132, NULL),
('5 MARLA', 3, 41, 160, 118, 86, NULL),
('5 MARLA', 3, 42, 1, 0, 0, NULL);

 
-- 5_4 
 
INSERT INTO FILTER_FINISHING_MATERIALS (AREA_QTY, LAYOUT_5_ID, MATERIAL_ID, GROUND_QTY, FIRST_FLOOR_QTY, ROOFTOP_QTY, BASEMENT_QTY) 
VALUES 
('5 MARLA', 4, 1, 60, 0, 0, NULL),
('5 MARLA', 4, 2, 265, 0, 0, NULL),
('5 MARLA', 4, 3, 1, 1, 0, NULL),
('5 MARLA', 4, 4, 3.5, 0, 0, NULL),
('5 MARLA', 4, 5, 6, 5, 1, NULL),
('5 MARLA', 4, 6, 2, 2, 0, NULL),
('5 MARLA', 4, 7, 6, 5, 1, NULL),
('5 MARLA', 4, 8, 1, 1, 0, NULL),
('5 MARLA', 4, 9, 6, 5, 1, NULL),
('5 MARLA', 4, 10, 6, 5, 1, NULL),
('5 MARLA', 4, 11, 10.9375, 8.75, 2.1875, NULL),
('5 MARLA', 4, 12, 54, 48, 42, NULL),
('5 MARLA', 4, 13, 1, 2, 0, NULL),
('5 MARLA', 4, 14, 6, 5, 1, NULL),
('5 MARLA', 4, 15, 99, 91, 16, NULL),
('5 MARLA', 4, 16, 6, 5, 2, NULL),
('5 MARLA', 4, 17, 3.5, 3.5, 0, NULL),
('5 MARLA', 4, 18, 2, 2, 0, NULL),
('5 MARLA', 4, 19, 8, 8, 0, NULL),
('5 MARLA', 4, 20, 84, 84, 0, NULL),
('5 MARLA', 4, 21, 288, 288, 0, NULL),
('5 MARLA', 4, 22, 2, 2, 0, NULL),
('5 MARLA', 4, 23, 2, 2, 0, NULL),
('5 MARLA', 4, 24, 2, 2, 0, NULL),
('5 MARLA', 4, 25, 2, 2, 0, NULL),
('5 MARLA', 4, 26, 2, 2, 0, NULL),
('5 MARLA', 4, 27, 2, 2, 0, NULL),
('5 MARLA', 4, 28, 64, 0, 0, NULL),
('5 MARLA', 4, 29, 1, 0, 0, NULL),
('5 MARLA', 4, 30, 1, 0, 0, NULL),
('5 MARLA', 4, 31, 48, 0, 0, NULL),
('5 MARLA', 4, 32, 1, 0, 0, NULL),
('5 MARLA', 4, 33, 210, 0, 0, NULL),
('5 MARLA', 4, 34, 1, 0, 0, NULL),
('5 MARLA', 4, 35, 36, 0, 0, NULL),
('5 MARLA', 4, 36, 630, 780, 121, NULL),
('5 MARLA', 4, 37, 15, 15, 0, NULL),
('5 MARLA', 4, 38, 90, 90, 0, NULL),
('5 MARLA', 4, 39, 1, 1, 0, NULL),
('5 MARLA', 4, 40, 937, 937, 121, NULL),
('5 MARLA', 4, 41, 131, 822, 93, NULL),
('5 MARLA', 4, 42, 1, 0, 0, NULL);
 
 -- 5_5

INSERT INTO FILTER_FINISHING_MATERIALS (AREA_QTY, LAYOUT_5_ID, MATERIAL_ID, GROUND_QTY, FIRST_FLOOR_QTY, ROOFTOP_QTY, BASEMENT_QTY) 
VALUES 
('5 MARLA', 5, 1, 60, 0, 0, 0),
('5 MARLA', 5, 2, 279, 0, 0, 0),
('5 MARLA', 5, 3, 1, 1, 0, 0),
('5 MARLA', 5, 4, 3.5, 0, 0, 0),
('5 MARLA', 5, 5, 5, 5, 1, 2),
('5 MARLA', 5, 6, 3, 3, 0, 0),
('5 MARLA', 5, 7, 7, 5, 1, 3),
('5 MARLA', 5, 8, 1, 1, 0, 0),
('5 MARLA', 5, 9, 7, 7, 1, 1),
('5 MARLA', 5, 10, 7, 7, 1, 2),
('5 MARLA', 5, 11, 10.9375, 8.75, 2.1875, 0),
('5 MARLA', 5, 12, 102, 72, 42, 0),
('5 MARLA', 5, 13, 1, 2, 0, 0),
('5 MARLA', 5, 14, 5, 5, 1, 2),
('5 MARLA', 5, 15, 89, 72, 12, 30),
('5 MARLA', 5, 16, 6, 5, 2, 5),
('5 MARLA', 5, 17, 0.875, 3.5, 0, 0),
('5 MARLA', 5, 18, 1, 2, 0, 0),
('5 MARLA', 5, 19, 4, 8, 0, 0),
('5 MARLA', 5, 20, 36, 103, 0, 0),
('5 MARLA', 5, 21, 141, 324, 0, 0),
('5 MARLA', 5, 22, 1, 2, 0, 0),
('5 MARLA', 5, 23, 1, 2, 0, 0),
('5 MARLA', 5, 24, 1, 2, 0, 0),
('5 MARLA', 5, 25, 1, 2, 0, 0),
('5 MARLA', 5, 26, 1, 2, 0, 0),
('5 MARLA', 5, 27, 1, 2, 0, 0),
('5 MARLA', 5, 28, 70, 0, 0, 0),
('5 MARLA', 5, 29, 1, 0, 0, 0),
('5 MARLA', 5, 30, 1, 0, 0, 0),
('5 MARLA', 5, 31, 53, 0, 0, 0),
('5 MARLA', 5, 32, 1, 0, 0, 0),
('5 MARLA', 5, 33, 228, 0, 0, 0),
('5 MARLA', 5, 34, 1, 0, 0, 0),
('5 MARLA', 5, 35, 24, 0, 0, 0),
('5 MARLA', 5, 36, 672, 787, 121, 1023),
('5 MARLA', 5, 37, 15, 15, 0, 15),
('5 MARLA', 5, 38, 90, 90, 0, 90),
('5 MARLA', 5, 39, 1, 1, 0, 1),
('5 MARLA', 5, 40, 993, 993, 121, 1023),
('5 MARLA', 5, 41, 151, 141, 100, 67),
('5 MARLA', 5, 42, 1, 0, 0, 0);
 
 -- 5_6
 
 INSERT INTO FILTER_FINISHING_MATERIALS (AREA_QTY, LAYOUT_5_ID, MATERIAL_ID, GROUND_QTY, FIRST_FLOOR_QTY, ROOFTOP_QTY, BASEMENT_QTY) 
VALUES 
('5 MARLA', 6, 1, 60, 0, 0, 0),
('5 MARLA', 6, 2, 131, 0, 0, 0),
('5 MARLA', 6, 3, 1, 1, 0, 0),
('5 MARLA', 6, 4, 3.5, 0, 0, 0),
('5 MARLA', 6, 5, 5, 4, 1, 3),
('5 MARLA', 6, 6, 3, 2, 0, 0),
('5 MARLA', 6, 7, 7, 4, 1, 3),
('5 MARLA', 6, 8, 1, 1, 0, 0),
('5 MARLA', 6, 9, 7, 4, 1, 3),
('5 MARLA', 6, 10, 7, 4, 1, 3),
('5 MARLA', 6, 11, 8.75, 8.75, 2.1875, 2.1875),
('5 MARLA', 6, 12, 108, 144, 42, 30),
('5 MARLA', 6, 13, 2, 2, 0, 1),
('5 MARLA', 6, 14, 5, 4, 1, 3),
('5 MARLA', 6, 15, 86, 80, 14, 35),
('5 MARLA', 6, 16, 6, 5, 2, 5),
('5 MARLA', 6, 17, 5.25, 5.25, 0, 1.75),
('5 MARLA', 6, 18, 3, 3, 0, 1),
('5 MARLA', 6, 19, 12, 12, 0, 4),
('5 MARLA', 6, 20, 117, 117, 0, 144),
('5 MARLA', 6, 21, 418, 418, 0, 273),
('5 MARLA', 6, 22, 3, 3, 0, 1),
('5 MARLA', 6, 23, 3, 3, 0, 1),
('5 MARLA', 6, 24, 3, 3, 0, 1),
('5 MARLA', 6, 25, 3, 3, 0, 1),
('5 MARLA', 6, 26, 3, 3, 0, 1),
('5 MARLA', 6, 27, 3, 3, 0, 1),
('5 MARLA', 6, 28, 58, 0, 0, 0),
('5 MARLA', 6, 29, 1, 0, 0, 0),
('5 MARLA', 6, 30, 1, 0, 0, 0),
('5 MARLA', 6, 31, 44, 0, 0, 0),
('5 MARLA', 6, 32, 1, 0, 0, 0),
('5 MARLA', 6, 33, 193, 0, 0, 0),
('5 MARLA', 6, 34, 1, 0, 0, 0),
('5 MARLA', 6, 35, 24, 0, 0, 0),
('5 MARLA', 6, 36, 480, 746, 109, 927),
('5 MARLA', 6, 37, 15, 15, 0, 15),
('5 MARLA', 6, 38, 90, 90, 0, 90),
('5 MARLA', 6, 39, 1, 1, 0, 1),
('5 MARLA', 6, 40, 966, 905, 109, 951),
('5 MARLA', 6, 41, 100, 133, 81, 71),
('5 MARLA', 6, 42, 1, 0, 0, 0);


-- 5_7

INSERT INTO FILTER_FINISHING_MATERIALS (AREA_QTY, LAYOUT_5_ID, MATERIAL_ID, GROUND_QTY, FIRST_FLOOR_QTY, ROOFTOP_QTY, BASEMENT_QTY) 
VALUES 
('5 MARLA', 7, 1, 60, 0, 0, NULL),
('5 MARLA', 7, 2, 286, 0, 0, NULL),
('5 MARLA', 7, 3, 1, 1, 0, NULL),
('5 MARLA', 7, 4, 3.5, 0, 0, NULL),
('5 MARLA', 7, 5, 6, 4, 1, NULL),
('5 MARLA', 7, 6, 3, 2, 0, NULL),
('5 MARLA', 7, 7, 6, 4, 1, NULL),
('5 MARLA', 7, 8, 1, 1, 0, NULL),
('5 MARLA', 7, 9, 6, 4, 1, NULL),
('5 MARLA', 7, 10, 6, 4, 1, NULL),
('5 MARLA', 7, 11, 8.75, 8.75, 2.1875, NULL),
('5 MARLA', 7, 12, 84, 120, 36, NULL),
('5 MARLA', 7, 13, 2, 2, 0, NULL),
('5 MARLA', 7, 14, 6, 4, 1, NULL),
('5 MARLA', 7, 15, 106, 97, 17, NULL),
('5 MARLA', 7, 16, 6, 5, 2, NULL),
('5 MARLA', 7, 17, 3.5, 3.5, 0, NULL),
('5 MARLA', 7, 18, 2, 2, 0, NULL),
('5 MARLA', 7, 19, 8, 8, 0, NULL),
('5 MARLA', 7, 20, 104, 117, 0, NULL),
('5 MARLA', 7, 21, 312, 312, 0, NULL),
('5 MARLA', 7, 22, 2, 2, 0, NULL),
('5 MARLA', 7, 23, 2, 2, 0, NULL),
('5 MARLA', 7, 24, 2, 2, 0, NULL),
('5 MARLA', 7, 25, 2, 2, 0, NULL),
('5 MARLA', 7, 26, 2, 2, 0, NULL),
('5 MARLA', 7, 27, 2, 2, 0, NULL),
('5 MARLA', 7, 28, 60, 0, 0, NULL),
('5 MARLA', 7, 29, 1, 0, 0, NULL),
('5 MARLA', 7, 30, 1, 0, 0, NULL),
('5 MARLA', 7, 31, 45, 0, 0, NULL),
('5 MARLA', 7, 32, 1, 0, 0, NULL),
('5 MARLA', 7, 33, 198, 0, 0, NULL),
('5 MARLA', 7, 34, 1, 0, 0, NULL),
('5 MARLA', 7, 35, 36, 0, 0, NULL),
('5 MARLA', 7, 36, 571, 715, 132, NULL),
('5 MARLA', 7, 37, 15, 15, 0, NULL),
('5 MARLA', 7, 38, 90, 90, 90, NULL),
('5 MARLA', 7, 39, 1, 1, 0, NULL),
('5 MARLA', 7, 40, 929, 857, 132, NULL),
('5 MARLA', 7, 41, 160, 118, 86, NULL),
('5 MARLA', 7, 42, 1, 0, 0, NULL);

 
 -- 5_8
 
 INSERT INTO FILTER_FINISHING_MATERIALS (AREA_QTY, LAYOUT_5_ID, MATERIAL_ID, GROUND_QTY, FIRST_FLOOR_QTY, ROOFTOP_QTY, BASEMENT_QTY) 
VALUES 
('5 MARLA', 8, 1, 60, 0, 0, NULL),
('5 MARLA', 8, 2, 265, 0, 0, NULL),
('5 MARLA', 8, 3, 1, 1, 0, NULL),
('5 MARLA', 8, 4, 3.5, 0, 0, NULL),
('5 MARLA', 8, 5, 6, 5, 1, NULL),
('5 MARLA', 8, 6, 2, 2, 0, NULL),
('5 MARLA', 8, 7, 6, 5, 1, NULL),
('5 MARLA', 8, 8, 1, 1, 0, NULL),
('5 MARLA', 8, 9, 6, 5, 1, NULL),
('5 MARLA', 8, 10, 6, 5, 1, NULL),
('5 MARLA', 8, 11, 10.9375, 8.75, 2.1875, NULL),
('5 MARLA', 8, 12, 54, 48, 42, NULL),
('5 MARLA', 8, 13, 1, 2, 0, NULL),
('5 MARLA', 8, 14, 6, 5, 1, NULL),
('5 MARLA', 8, 15, 99, 91, 16, NULL),
('5 MARLA', 8, 16, 6, 5, 2, NULL),
('5 MARLA', 8, 17, 3.5, 3.5, 0, NULL),
('5 MARLA', 8, 18, 2, 2, 0, NULL),
('5 MARLA', 8, 19, 8, 8, 0, NULL),
('5 MARLA', 8, 20, 84, 84, 0, NULL),
('5 MARLA', 8, 21, 288, 288, 0, NULL),
('5 MARLA', 8, 22, 2, 2, 0, NULL),
('5 MARLA', 8, 23, 2, 2, 0, NULL),
('5 MARLA', 8, 24, 2, 2, 0, NULL),
('5 MARLA', 8, 25, 2, 2, 0, NULL),
('5 MARLA', 8, 26, 2, 2, 0, NULL),
('5 MARLA', 8, 27, 2, 2, 0, NULL),
('5 MARLA', 8, 28, 64, 0, 0, NULL),
('5 MARLA', 8, 29, 1, 0, 0, NULL),
('5 MARLA', 8, 30, 1, 0, 0, NULL),
('5 MARLA', 8, 31, 48, 0, 0, NULL),
('5 MARLA', 8, 32, 1, 0, 0, NULL),
('5 MARLA', 8, 33, 210, 0, 0, NULL),
('5 MARLA', 8, 34, 1, 0, 0, NULL),
('5 MARLA', 8, 35, 36, 0, 0, NULL),
('5 MARLA', 8, 36, 630, 780, 121, NULL),
('5 MARLA', 8, 37, 15, 15, 0, NULL),
('5 MARLA', 8, 38, 90, 90, 0, NULL),
('5 MARLA', 8, 39, 1, 1, 0, NULL),
('5 MARLA', 8, 40, 937, 937, 121, NULL),
('5 MARLA', 8, 41, 131, 822, 93, NULL),
('5 MARLA', 8, 42, 1, 0, 0, NULL);

-- 7_1

INSERT INTO FILTER_FINISHING_MATERIALS (AREA_QTY, LAYOUT_7_ID, MATERIAL_ID, GROUND_QTY, FIRST_FLOOR_QTY, ROOFTOP_QTY, BASEMENT_QTY) 
VALUES 
('7 MARLA', 1, 1, 72, 0, 0, 0),
('7 MARLA', 1, 2, 623, 0, 0, 0),
('7 MARLA', 1, 3, 1, 1, 0, 0),
('7 MARLA', 1, 4, 3.5, 0, 0, 0),
('7 MARLA', 1, 5, 6, 4, 1, 2),
('7 MARLA', 1, 6, 3, 2, 0, 0),
('7 MARLA', 1, 7, 6, 4, 1, 2),
('7 MARLA', 1, 8, 1, 1, 0, 0),
('7 MARLA', 1, 9, 6, 4, 1, 2),
('7 MARLA', 1, 10, 6, 4, 1, 2),
('7 MARLA', 1, 11, 15.3125, 8.75, 2.1875, 0),
('7 MARLA', 1, 12, 132, 96, 36, 0),
('7 MARLA', 1, 13, 2, 2, 0, 0),
('7 MARLA', 1, 14, 6, 4, 1, 2),
('7 MARLA', 1, 15, 138, 120, 18, 46),
('7 MARLA', 1, 16, 6, 5, 2, 5),
('7 MARLA', 1, 17, 3.5, 3.5, 0, 0),
('7 MARLA', 1, 18, 2, 2, 0, 0),
('7 MARLA', 1, 19, 8, 8, 0, 0),
('7 MARLA', 1, 20, 88, 88, 0, 0),
('7 MARLA', 1, 21, 330, 330, 0, 0),
('7 MARLA', 1, 22, 2, 2, 0, 0),
('7 MARLA', 1, 23, 2, 2, 0, 0),
('7 MARLA', 1, 24, 2, 2, 0, 0),
('7 MARLA', 1, 25, 2, 2, 0, 0),
('7 MARLA', 1, 26, 2, 2, 0, 0),
('7 MARLA', 1, 27, 2, 2, 0, 0),
('7 MARLA', 1, 28, 48, 0, 0, 0),
('7 MARLA', 1, 29, 1, 0, 0, 0),
('7 MARLA', 1, 30, 1, 0, 0, 0),
('7 MARLA', 1, 31, 48, 0, 0, 0),
('7 MARLA', 1, 32, 1, 0, 0, 0),
('7 MARLA', 1, 33, 192, 0, 0, 0),
('7 MARLA', 1, 34, 1, 0, 0, 0),
('7 MARLA', 1, 35, 36, 0, 0, 0),
('7 MARLA', 1, 36, 616, 737, 100, 1120),
('7 MARLA', 1, 37, 15, 15, 0, 15),
('7 MARLA', 1, 38, 90, 90, 0, 90),
('7 MARLA', 1, 39, 1, 1, 0, 1),
('7 MARLA', 1, 40, 985, 1041, 100, 1120),
('7 MARLA', 1, 41, 185, 108, 100, 76),
('7 MARLA', 1, 42, 1, 0, 0, 0);

 
 -- 7_2
 
 INSERT INTO FILTER_FINISHING_MATERIALS (AREA_QTY, LAYOUT_7_ID, MATERIAL_ID, GROUND_QTY, FIRST_FLOOR_QTY, ROOFTOP_QTY, BASEMENT_QTY) 
VALUES 
('7 MARLA', 2, 1, 72, 0, 0, 0),
('7 MARLA', 2, 2, 573, 0, 0, 0),
('7 MARLA', 2, 3, 1, 1, 0, 0),
('7 MARLA', 2, 4, 3.5, 0, 0, 0),
('7 MARLA', 2, 5, 7, 6, 1, 3),
('7 MARLA', 2, 6, 3, 2, 0, 0),
('7 MARLA', 2, 7, 9, 6, 1, 3),
('7 MARLA', 2, 8, 1, 1, 0, 0),
('7 MARLA', 2, 9, 9, 6, 1, 1),
('7 MARLA', 2, 10, 10, 6, 1, 1),
('7 MARLA', 2, 11, 15.3125, 10.9375, 2.1875, 2.1875),
('7 MARLA', 2, 12, 120, 156, 36, 36),
('7 MARLA', 2, 13, 1, 1, 0, 1),
('7 MARLA', 2, 14, 7, 6, 1, 3),
('7 MARLA', 2, 15, 140, 127, 25, 103),
('7 MARLA', 2, 16, 6, 5, 2, 5),
('7 MARLA', 2, 17, 3.5, 3.5, 0, 1.75),
('7 MARLA', 2, 18, 2, 2, 0, 1),
('7 MARLA', 2, 19, 8, 8, 0, 4),
('7 MARLA', 2, 20, 98, 98, 0, 80),
('7 MARLA', 2, 21, 324, 324, 0, 198),
('7 MARLA', 2, 22, 2, 2, 0, 1),
('7 MARLA', 2, 23, 2, 2, 0, 1),
('7 MARLA', 2, 24, 2, 2, 0, 1),
('7 MARLA', 2, 25, 2, 2, 0, 1),
('7 MARLA', 2, 26, 2, 2, 0, 1),
('7 MARLA', 2, 27, 2, 2, 0, 1),
('7 MARLA', 2, 28, 48, 0, 0, 0),
('7 MARLA', 2, 29, 1, 0, 0, 0),
('7 MARLA', 2, 30, 1, 0, 0, 0),
('7 MARLA', 2, 31, 48, 0, 0, 0),
('7 MARLA', 2, 32, 1, 0, 0, 0),
('7 MARLA', 2, 33, 204, 0, 0, 0),
('7 MARLA', 2, 34, 1, 0, 0, 0),
('7 MARLA', 2, 35, 48, 0, 0, 0),
('7 MARLA', 2, 36, 681, 754, 100, 554),
('7 MARLA', 2, 37, 15, 15, 0, 15),
('7 MARLA', 2, 38, 90, 90, 0, 90),
('7 MARLA', 2, 39, 1, 1, 0, 1),
('7 MARLA', 2, 40, 970, 1123, 100, 634),
('7 MARLA', 2, 41, 172, 130, 103, 60),
('7 MARLA', 2, 42, 1, 0, 0, 0);

 
 -- 7_3
 
 INSERT INTO FILTER_FINISHING_MATERIALS (AREA_QTY, LAYOUT_7_ID, MATERIAL_ID, GROUND_QTY, FIRST_FLOOR_QTY, ROOFTOP_QTY, BASEMENT_QTY) 
VALUES 
('7 MARLA', 3, 1, 72, 0, 0, NULL),
('7 MARLA', 3, 2, 665, 0, 0, NULL),
('7 MARLA', 3, 3, 1, 1, 0, NULL),
('7 MARLA', 3, 4, 3.5, 0, 0, NULL),
('7 MARLA', 3, 5, 6, 5, 1, NULL),
('7 MARLA', 3, 6, 2, 2, 0, NULL),
('7 MARLA', 3, 7, 6, 5, 1, NULL),
('7 MARLA', 3, 8, 1, 1, 0, NULL),
('7 MARLA', 3, 9, 6, 5, 1, NULL),
('7 MARLA', 3, 10, 6, 5, 1, NULL),
('7 MARLA', 3, 11, 8.75, 8.75, 2.1875, NULL),
('7 MARLA', 3, 12, 144, 144, 36, NULL),
('7 MARLA', 3, 13, 2, 2, 0, NULL),
('7 MARLA', 3, 14, 6, 5, 1, NULL),
('7 MARLA', 3, 15, 149, 131, 22, NULL),
('7 MARLA', 3, 16, 6, 5, 2, NULL),
('7 MARLA', 3, 17, 3.5, 1.75, 0, NULL),
('7 MARLA', 3, 18, 2, 1, 0, NULL),
('7 MARLA', 3, 19, 8, 4, 0, NULL),
('7 MARLA', 3, 20, 91, 55, 0, NULL),
('7 MARLA', 3, 21, 318, 177, 0, NULL),
('7 MARLA', 3, 22, 2, 1, 0, NULL),
('7 MARLA', 3, 23, 2, 1, 0, NULL),
('7 MARLA', 3, 24, 2, 1, 0, NULL),
('7 MARLA', 3, 25, 2, 1, 0, NULL),
('7 MARLA', 3, 26, 2, 1, 0, NULL),
('7 MARLA', 3, 27, 2, 1, 0, NULL),
('7 MARLA', 3, 28, 64, 0, 0, NULL),
('7 MARLA', 3, 29, 1, 0, 0, NULL),
('7 MARLA', 3, 30, 1, 0, 0, NULL),
('7 MARLA', 3, 31, 64, 0, 0, NULL),
('7 MARLA', 3, 32, 1, 0, 0, NULL),
('7 MARLA', 3, 33, 210, 0, 0, NULL),
('7 MARLA', 3, 34, 1, 0, 0, NULL),
('7 MARLA', 3, 35, 48, 0, 0, NULL),
('7 MARLA', 3, 36, 640, 786, 100, NULL),
('7 MARLA', 3, 37, 15, 15, 0, NULL),
('7 MARLA', 3, 38, 90, 90, 0, NULL),
('7 MARLA', 3, 39, 1, 1, 0, NULL),
('7 MARLA', 3, 40, 911, 1007, 100, NULL),
('7 MARLA', 3, 41, 203, 122, 92, NULL),
('7 MARLA', 3, 42, 1, 0, 0, NULL);

 -- 7_4
 
 INSERT INTO FILTER_FINISHING_MATERIALS (AREA_QTY, LAYOUT_7_ID, MATERIAL_ID, GROUND_QTY, FIRST_FLOOR_QTY, ROOFTOP_QTY, BASEMENT_QTY) 
VALUES 
('7 MARLA', 4, 1, 72, 0, 0, NULL),
('7 MARLA', 4, 2, 616, 0, 0, NULL),
('7 MARLA', 4, 3, 1, 1, 0, NULL),
('7 MARLA', 4, 4, 3.5, 0, 0, NULL),
('7 MARLA', 4, 5, 5, 5, 1, NULL),
('7 MARLA', 4, 6, 2, 2, 0, NULL),
('7 MARLA', 4, 7, 5, 5, 1, NULL),
('7 MARLA', 4, 8, 1, 1, 0, NULL),
('7 MARLA', 4, 9, 5, 5, 1, NULL),
('7 MARLA', 4, 10, 5, 5, 1, NULL),
('7 MARLA', 4, 11, 10.9375, 8.75, 2.1875, NULL),
('7 MARLA', 4, 12, 138, 138, 36, NULL),
('7 MARLA', 4, 13, 2, 2, 0, NULL),
('7 MARLA', 4, 14, 5, 5, 1, NULL),
('7 MARLA', 4, 15, 150, 159, 26, NULL),
('7 MARLA', 4, 16, 6, 5, 2, NULL),
('7 MARLA', 4, 17, 3.5, 3.5, 0, NULL),
('7 MARLA', 4, 18, 2, 2, 0, NULL),
('7 MARLA', 4, 19, 8, 16, 0, NULL),
('7 MARLA', 4, 20, 101, 101, 0, NULL),
('7 MARLA', 4, 21, 342, 342, 0, NULL),
('7 MARLA', 4, 22, 2, 2, 0, NULL),
('7 MARLA', 4, 23, 2, 2, 0, NULL),
('7 MARLA', 4, 24, 2, 2, 0, NULL),
('7 MARLA', 4, 25, 2, 2, 0, NULL),
('7 MARLA', 4, 26, 2, 2, 0, NULL),
('7 MARLA', 4, 27, 2, 2, 0, NULL),
('7 MARLA', 4, 28, 44, 0, 0, NULL),
('7 MARLA', 4, 29, 1, 0, 0, NULL),
('7 MARLA', 4, 30, 1, 0, 0, NULL),
('7 MARLA', 4, 31, 42, 0, 0, NULL),
('7 MARLA', 4, 32, 1, 0, 0, NULL),
('7 MARLA', 4, 33, 153, 0, 0, NULL),
('7 MARLA', 4, 34, 1, 0, 0, NULL),
('7 MARLA', 4, 35, 36, 0, 0, NULL),
('7 MARLA', 4, 36, 632, 826, 100, NULL),
('7 MARLA', 4, 37, 15, 15, 0, NULL),
('7 MARLA', 4, 38, 90, 90, 0, NULL),
('7 MARLA', 4, 39, 1, 1, 0, NULL),
('7 MARLA', 4, 40, 960, 1154, 100, NULL),
('7 MARLA', 4, 41, 272, 116, 96, NULL),
('7 MARLA', 4, 42, 1, 0, 0, NULL);

-- 7_5

INSERT INTO FILTER_FINISHING_MATERIALS (AREA_QTY, LAYOUT_7_ID, MATERIAL_ID, GROUND_QTY, FIRST_FLOOR_QTY, ROOFTOP_QTY, BASEMENT_QTY) 
VALUES 
('7 MARLA', 5, 1, 72, 0, 0, 0),
('7 MARLA', 5, 2, 623, 0, 0, 0),
('7 MARLA', 5, 3, 1, 1, 0, 0),
('7 MARLA', 5, 4, 3.5, 0, 0, 0),
('7 MARLA', 5, 5, 6, 4, 1, 2),
('7 MARLA', 5, 6, 3, 2, 0, 0),
('7 MARLA', 5, 7, 6, 4, 1, 2),
('7 MARLA', 5, 8, 1, 1, 0, 0),
('7 MARLA', 5, 9, 6, 4, 1, 2),
('7 MARLA', 5, 10, 6, 4, 1, 2),
('7 MARLA', 5, 11, 15.3125, 8.75, 2.1875, 0),
('7 MARLA', 5, 12, 132, 96, 36, 0),
('7 MARLA', 5, 13, 2, 2, 0, 0),
('7 MARLA', 5, 14, 6, 4, 1, 2),
('7 MARLA', 5, 15, 138, 120, 18, 46),
('7 MARLA', 5, 16, 6, 5, 2, 5),
('7 MARLA', 5, 17, 3.5, 3.5, 0, 0),
('7 MARLA', 5, 18, 2, 2, 0, 0),
('7 MARLA', 5, 19, 8, 8, 0, 0),
('7 MARLA', 5, 20, 88, 88, 0, 0),
('7 MARLA', 5, 21, 330, 330, 0, 0),
('7 MARLA', 5, 22, 2, 2, 0, 0),
('7 MARLA', 5, 23, 2, 2, 0, 0),
('7 MARLA', 5, 24, 2, 2, 0, 0),
('7 MARLA', 5, 25, 2, 2, 0, 0),
('7 MARLA', 5, 26, 2, 2, 0, 0),
('7 MARLA', 5, 27, 2, 2, 0, 0),
('7 MARLA', 5, 28, 48, 0, 0, 0),
('7 MARLA', 5, 29, 1, 0, 0, 0),
('7 MARLA', 5, 30, 1, 0, 0, 0),
('7 MARLA', 5, 31, 48, 0, 0, 0),
('7 MARLA', 5, 32, 1, 0, 0, 0),
('7 MARLA', 5, 33, 192, 0, 0, 0),
('7 MARLA', 5, 34, 1, 0, 0, 0),
('7 MARLA', 5, 35, 36, 0, 0, 0),
('7 MARLA', 5, 36, 616, 737, 100, 1120),
('7 MARLA', 5, 37, 15, 15, 0, 15),
('7 MARLA', 5, 38, 90, 90, 0, 90),
('7 MARLA', 5, 39, 1, 1, 0, 1),
('7 MARLA', 5, 40, 985, 1041, 100, 1120),
('7 MARLA', 5, 41, 185, 108, 100, 76),
('7 MARLA', 5, 42, 1, 0, 0, 0);



-- 7_6

INSERT INTO FILTER_FINISHING_MATERIALS (AREA_QTY, LAYOUT_7_ID, MATERIAL_ID, GROUND_QTY, FIRST_FLOOR_QTY, ROOFTOP_QTY, BASEMENT_QTY) 
VALUES 
('7 MARLA', 6, 1, 72, 0, 0, 0),
('7 MARLA', 6, 2, 573, 0, 0, 0),
('7 MARLA', 6, 3, 1, 1, 0, 0),
('7 MARLA', 6, 4, 3.5, 0, 0, 0),
('7 MARLA', 6, 5, 7, 6, 1, 3),
('7 MARLA', 6, 6, 3, 2, 0, 0),
('7 MARLA', 6, 7, 9, 6, 1, 3),
('7 MARLA', 6, 8, 1, 1, 0, 0),
('7 MARLA', 6, 9, 9, 6, 1, 1),
('7 MARLA', 6, 10, 10, 6, 1, 1),
('7 MARLA', 6, 11, 15.3125, 10.9375, 2.1875, 2.1875),
('7 MARLA', 6, 12, 120, 156, 36, 36),
('7 MARLA', 6, 13, 1, 1, 0, 1),
('7 MARLA', 6, 14, 7, 6, 1, 3),
('7 MARLA', 6, 15, 140, 127, 25, 103),
('7 MARLA', 6, 16, 6, 5, 2, 5),
('7 MARLA', 6, 17, 3.5, 3.5, 0, 1.75),
('7 MARLA', 6, 18, 2, 2, 0, 1),
('7 MARLA', 6, 19, 8, 8, 0, 4),
('7 MARLA', 6, 20, 98, 98, 0, 80),
('7 MARLA', 6, 21, 324, 324, 0, 198),
('7 MARLA', 6, 22, 2, 2, 0, 1),
('7 MARLA', 6, 23, 2, 2, 0, 1),
('7 MARLA', 6, 24, 2, 2, 0, 1),
('7 MARLA', 6, 25, 2, 2, 0, 1),
('7 MARLA', 6, 26, 2, 2, 0, 1),
('7 MARLA', 6, 27, 2, 2, 0, 1),
('7 MARLA', 6, 28, 48, 0, 0, 0),
('7 MARLA', 6, 29, 1, 0, 0, 0),
('7 MARLA', 6, 30, 1, 0, 0, 0),
('7 MARLA', 6, 31, 48, 0, 0, 0),
('7 MARLA', 6, 32, 1, 0, 0, 0),
('7 MARLA', 6, 33, 204, 0, 0, 0),
('7 MARLA', 6, 34, 1, 0, 0, 0),
('7 MARLA', 6, 35, 48, 0, 0, 0),
('7 MARLA', 6, 36, 681, 754, 100, 554),
('7 MARLA', 6, 37, 15, 15, 0, 15),
('7 MARLA', 6, 38, 90, 90, 0, 90),
('7 MARLA', 6, 39, 1, 1, 0, 1),
('7 MARLA', 6, 40, 970, 1123, 100, 634),
('7 MARLA', 6, 41, 172, 130, 103, 60),
('7 MARLA', 6, 42, 1, 0, 0, 0);



-- 7_7


INSERT INTO FILTER_FINISHING_MATERIALS (AREA_QTY, LAYOUT_7_ID, MATERIAL_ID, GROUND_QTY, FIRST_FLOOR_QTY, ROOFTOP_QTY, BASEMENT_QTY) 
VALUES 
('7 MARLA', 7, 1, 72, 0, 0, NULL),
('7 MARLA', 7, 2, 665, 0, 0, NULL),
('7 MARLA', 7, 3, 1, 1, 0, NULL),
('7 MARLA', 7, 4, 3.5, 0, 0, NULL),
('7 MARLA', 7, 5, 6, 5, 1, NULL),
('7 MARLA', 7, 6, 2, 2, 0, NULL),
('7 MARLA', 7, 7, 6, 5, 1, NULL),
('7 MARLA', 7, 8, 1, 1, 0, NULL),
('7 MARLA', 7, 9, 6, 5, 1, NULL),
('7 MARLA', 7, 10, 6, 5, 1, NULL),
('7 MARLA', 7, 11, 8.75, 8.75, 2.1875, NULL),
('7 MARLA', 7, 12, 144, 144, 36, NULL),
('7 MARLA', 7, 13, 2, 2, 0, NULL),
('7 MARLA', 7, 14, 6, 5, 1, NULL),
('7 MARLA', 7, 15, 149, 131, 22, NULL),
('7 MARLA', 7, 16, 6, 5, 2, NULL),
('7 MARLA', 7, 17, 3.5, 1.75, 0, NULL),
('7 MARLA', 7, 18, 2, 1, 0, NULL),
('7 MARLA', 7, 19, 8, 4, 0, NULL),
('7 MARLA', 7, 20, 91, 55, 0, NULL),
('7 MARLA', 7, 21, 318, 177, 0, NULL),
('7 MARLA', 7, 22, 2, 1, 0, NULL),
('7 MARLA', 7, 23, 2, 1, 0, NULL),
('7 MARLA', 7, 24, 2, 1, 0, NULL),
('7 MARLA', 7, 25, 2, 1, 0, NULL),
('7 MARLA', 7, 26, 2, 1, 0, NULL),
('7 MARLA', 7, 27, 2, 1, 0, NULL),
('7 MARLA', 7, 28, 64, 0, 0, NULL),
('7 MARLA', 7, 29, 1, 0, 0, NULL),
('7 MARLA', 7, 30, 1, 0, 0, NULL),
('7 MARLA', 7, 31, 64, 0, 0, NULL),
('7 MARLA', 7, 32, 1, 0, 0, NULL),
('7 MARLA', 7, 33, 210, 0, 0, NULL),
('7 MARLA', 7, 34, 1, 0, 0, NULL),
('7 MARLA', 7, 35, 48, 0, 0, NULL),
('7 MARLA', 7, 36, 640, 786, 100, NULL),
('7 MARLA', 7, 37, 15, 15, 0, NULL),
('7 MARLA', 7, 38, 90, 90, 0, NULL),
('7 MARLA', 7, 39, 1, 1, 0, NULL),
('7 MARLA', 7, 40, 911, 1007, 100, NULL),
('7 MARLA', 7, 41, 203, 122, 92, NULL),
('7 MARLA', 7, 42, 1, 0, 0, NULL);


-- 7_8

INSERT INTO FILTER_FINISHING_MATERIALS (AREA_QTY, LAYOUT_7_ID, MATERIAL_ID, GROUND_QTY, FIRST_FLOOR_QTY, ROOFTOP_QTY, BASEMENT_QTY) 
VALUES 
('7 MARLA', 8, 1, 72, 0, 0, NULL),
('7 MARLA', 8, 2, 616, 0, 0, NULL),
('7 MARLA', 8, 3, 1, 1, 0, NULL),
('7 MARLA', 8, 4, 3.5, 0, 0, NULL),
('7 MARLA', 8, 5, 5, 5, 1, NULL),
('7 MARLA', 8, 6, 2, 2, 0, NULL),
('7 MARLA', 8, 7, 5, 5, 1, NULL),
('7 MARLA', 8, 8, 1, 1, 0, NULL),
('7 MARLA', 8, 9, 5, 5, 1, NULL),
('7 MARLA', 8, 10, 5, 5, 1, NULL),
('7 MARLA', 8, 11, 10.9375, 8.75, 2.1875, NULL),
('7 MARLA', 8, 12, 138, 138, 36, NULL),
('7 MARLA', 8, 13, 2, 2, 0, NULL),
('7 MARLA', 8, 14, 5, 5, 1, NULL),
('7 MARLA', 8, 15, 150, 159, 26, NULL),
('7 MARLA', 8, 16, 6, 5, 2, NULL),
('7 MARLA', 8, 17, 3.5, 3.5, 0, NULL),
('7 MARLA', 8, 18, 2, 2, 0, NULL),
('7 MARLA', 8, 19, 8, 16, 0, NULL),
('7 MARLA', 8, 20, 101, 101, 0, NULL),
('7 MARLA', 8, 21, 342, 342, 0, NULL),
('7 MARLA', 8, 22, 2, 2, 0, NULL),
('7 MARLA', 8, 23, 2, 2, 0, NULL),
('7 MARLA', 8, 24, 2, 2, 0, NULL),
('7 MARLA', 8, 25, 2, 2, 0, NULL),
('7 MARLA', 8, 26, 2, 2, 0, NULL),
('7 MARLA', 8, 27, 2, 2, 0, NULL),
('7 MARLA', 8, 28, 44, 0, 0, NULL),
('7 MARLA', 8, 29, 1, 0, 0, NULL),
('7 MARLA', 8, 30, 1, 0, 0, NULL),
('7 MARLA', 8, 31, 42, 0, 0, NULL),
('7 MARLA', 8, 32, 1, 0, 0, NULL),
('7 MARLA', 8, 33, 153, 0, 0, NULL),
('7 MARLA', 8, 34, 1, 0, 0, NULL),
('7 MARLA', 8, 35, 36, 0, 0, NULL),
('7 MARLA', 8, 36, 632, 826, 100, NULL),
('7 MARLA', 8, 37, 15, 15, 0, NULL),
('7 MARLA', 8, 38, 90, 90, 0, NULL),
('7 MARLA', 8, 39, 1, 1, 0, NULL),
('7 MARLA', 8, 40, 960, 1154, 100, NULL),
('7 MARLA', 8, 41, 272, 116, 96, NULL),
('7 MARLA', 8, 42, 1, 0, 0, NULL);

 
 -- 10_1
 
INSERT INTO FILTER_FINISHING_MATERIALS (AREA_QTY, LAYOUT_10_ID, MATERIAL_ID, GROUND_QTY, FIRST_FLOOR_QTY, ROOFTOP_QTY, BASEMENT_QTY) 
VALUES 
('10 MARLA', 1, 1, 90, 0, 0, 0),
('10 MARLA', 1, 2, 896, 0, 0, 0),
('10 MARLA', 1, 3, 1, 1, 0, 0),
('10 MARLA', 1, 4, 4.375, 0, 0, 0),
('10 MARLA', 1, 5, 6, 6, 1, 2),
('10 MARLA', 1, 6, 3, 3, 0, 0),
('10 MARLA', 1, 7, 9, 8, 1, 2),
('10 MARLA', 1, 8, 1, 1, 0, 0),
('10 MARLA', 1, 9, 6, 8, 1, 3),
('10 MARLA', 1, 10, 12, 10, 1, 3),
('10 MARLA', 1, 11, 13.125, 13.125, 2.1875, 0),
('10 MARLA', 1, 12, 144, 144, 33, 0),
('10 MARLA', 1, 13, 2, 2, 0, 0),
('10 MARLA', 1, 14, 6, 6, 1, 2),
('10 MARLA', 1, 15, 167, 160, 19, 45),
('10 MARLA', 1, 16, 6, 5, 2, 5),
('10 MARLA', 1, 17, 3.5, 3.5, 0, 0),
('10 MARLA', 1, 18, 2, 2, 0, 0),
('10 MARLA', 1, 19, 12, 16, 0, 0),
('10 MARLA', 1, 20, 115, 115, 0, 0),
('10 MARLA', 1, 21, 351, 351, 0, 0),
('10 MARLA', 1, 22, 2, 2, 0, 0),
('10 MARLA', 1, 23, 2, 2, 0, 0),
('10 MARLA', 1, 24, 2, 2, 0, 0),
('10 MARLA', 1, 25, 2, 2, 0, 0),
('10 MARLA', 1, 26, 2, 2, 0, 0),
('10 MARLA', 1, 27, 2, 2, 0, 0),
('10 MARLA', 1, 28, 60, 60, 0, 0),
('10 MARLA', 1, 29, 1, 1, 0, 0),
('10 MARLA', 1, 30, 1, 1, 0, 0),
('10 MARLA', 1, 31, 60, 60, 0, 0),
('10 MARLA', 1, 32, 1, 1, 0, 0),
('10 MARLA', 1, 33, 198, 198, 0, 0),
('10 MARLA', 1, 34, 1, 1, 0, 0),
('10 MARLA', 1, 35, 48, 48, 0, 0),
('10 MARLA', 1, 36, 959, 1384, 132, 1568),
('10 MARLA', 1, 37, 14, 14, 0, 14),
('10 MARLA', 1, 38, 119, 119, 0, 119),
('10 MARLA', 1, 39, 1, 1, 0, 1),
('10 MARLA', 1, 40, 1414, 1764, 132, 1568),
('10 MARLA', 1, 41, 281, 192, 110, 81),
('10 MARLA', 1, 42, 1, 0, 0, 0);


-- 10_2

INSERT INTO FILTER_FINISHING_MATERIALS (AREA_QTY, LAYOUT_10_ID, MATERIAL_ID, GROUND_QTY, FIRST_FLOOR_QTY, ROOFTOP_QTY, BASEMENT_QTY) 
VALUES 
('10 MARLA', 2, 1, 90, 0, 0, 0),
('10 MARLA', 2, 2, 818, 0, 0, 0),
('10 MARLA', 2, 3, 1, 1, 0, 0),
('10 MARLA', 2, 4, 13.125, 13.125, 0, 0),
('10 MARLA', 2, 5, 7, 7, 1, 3),
('10 MARLA', 2, 6, 4, 3, 0, 0),
('10 MARLA', 2, 7, 9, 7, 1, 3),
('10 MARLA', 2, 8, 1, 1, 0, 0),
('10 MARLA', 2, 9, 14, 12, 1, 4),
('10 MARLA', 2, 10, 10, 9, 1, 4),
('10 MARLA', 2, 11, 8.75, 8.75, 2.1875, 2.1875),
('10 MARLA', 2, 12, 108, 108, 36, 36),
('10 MARLA', 2, 13, 2, 2, 0, 1),
('10 MARLA', 2, 14, 7, 7, 1, 3),
('10 MARLA', 2, 15, 162, 158, 17, 47),
('10 MARLA', 2, 16, 6, 5, 2, 5),
('10 MARLA', 2, 17, 3.5, 3.5, 0, 1.75),
('10 MARLA', 2, 18, 2, 2, 0, 1),
('10 MARLA', 2, 19, 12, 12, 0, 6),
('10 MARLA', 2, 20, 78, 78, 0, 154),
('10 MARLA', 2, 21, 264, 264, 0, 282),
('10 MARLA', 2, 22, 2, 2, 0, 1),
('10 MARLA', 2, 23, 2, 2, 0, 1),
('10 MARLA', 2, 24, 2, 2, 0, 1),
('10 MARLA', 2, 25, 2, 2, 0, 1),
('10 MARLA', 2, 26, 2, 2, 0, 1),
('10 MARLA', 2, 27, 2, 2, 0, 1),
('10 MARLA', 2, 28, 60, 60, 0, 0),
('10 MARLA', 2, 29, 1, 1, 0, 0),
('10 MARLA', 2, 30, 1, 1, 0, 0),
('10 MARLA', 2, 31, 60, 60, 0, 0),
('10 MARLA', 2, 32, 1, 1, 0, 0),
('10 MARLA', 2, 33, 240, 240, 0, 0),
('10 MARLA', 2, 34, 1, 1, 0, 0),
('10 MARLA', 2, 35, 48, 48, 0, 0),
('10 MARLA', 2, 36, 1139, 1444, 95, 1230),
('10 MARLA', 2, 37, 14, 14, 0, 14),
('10 MARLA', 2, 38, 107, 107, 0, 107),
('10 MARLA', 2, 39, 1, 1, 0, 1),
('10 MARLA', 2, 40, 1457, 1682, 95, 1384),
('10 MARLA', 2, 41, 280, 194, 104, 114),
('10 MARLA', 2, 42, 1, 0, 0, 0);



 -- 10_3
 
INSERT INTO FILTER_FINISHING_MATERIALS (AREA_QTY, LAYOUT_10_ID, MATERIAL_ID, GROUND_QTY, FIRST_FLOOR_QTY, ROOFTOP_QTY, BASEMENT_QTY) 
VALUES 
('10 MARLA', 3, 1, 90, 0, 0, NULL),
('10 MARLA', 3, 2, 890, 0, 0, NULL),
('10 MARLA', 3, 3, 1, 1, 0, NULL),
('10 MARLA', 3, 4, 4.375, 0, 0, NULL),
('10 MARLA', 3, 5, 7, 7, 1, NULL),
('10 MARLA', 3, 6, 3, 3, 0, NULL),
('10 MARLA', 3, 7, 17, 10, 1, NULL),
('10 MARLA', 3, 8, 1, 1, 0, NULL),
('10 MARLA', 3, 9, 17, 10, 1, NULL),
('10 MARLA', 3, 10, 17, 10, 1, NULL),
('10 MARLA', 3, 11, 19.6875, 15.3125, 2.1875, NULL),
('10 MARLA', 3, 12, 162, 162, 42, NULL),
('10 MARLA', 3, 13, 2, 2, 0, NULL),
('10 MARLA', 3, 14, 7, 7, 1, NULL),
('10 MARLA', 3, 15, 170, 159, 16, NULL),
('10 MARLA', 3, 16, 6, 5, 2, NULL),
('10 MARLA', 3, 17, 3.5, 3.5, 0, NULL),
('10 MARLA', 3, 18, 2, 2, 0, NULL),
('10 MARLA', 3, 19, 12, 12, 0, NULL),
('10 MARLA', 3, 20, 98, 98, 0, NULL),
('10 MARLA', 3, 21, 360, 360, 0, NULL),
('10 MARLA', 3, 22, 2, 2, 0, NULL),
('10 MARLA', 3, 23, 2, 2, 0, NULL),
('10 MARLA', 3, 24, 2, 2, 0, NULL),
('10 MARLA', 3, 25, 2, 2, 0, NULL),
('10 MARLA', 3, 26, 2, 2, 0, NULL),
('10 MARLA', 3, 27, 2, 2, 0, NULL),
('10 MARLA', 3, 28, 51, 57, 0, NULL),
('10 MARLA', 3, 29, 1, 1, 0, NULL),
('10 MARLA', 3, 30, 1, 1, 0, NULL),
('10 MARLA', 3, 31, 51, 57, 0, NULL),
('10 MARLA', 3, 32, 1, 1, 0, NULL),
('10 MARLA', 3, 33, 204, 222, 0, NULL),
('10 MARLA', 3, 34, 1, 1, 0, NULL),
('10 MARLA', 3, 35, 36, 36, 0, NULL),
('10 MARLA', 3, 36, 1045, 1263, 126, NULL),
('10 MARLA', 3, 37, 15, 15, 0, NULL),
('10 MARLA', 3, 38, 107, 107, 0, NULL),
('10 MARLA', 3, 39, 1, 1, 0, NULL),
('10 MARLA', 3, 40, 1461, 1650, 126, NULL),
('10 MARLA', 3, 41, 281, 181, 117, NULL),
('10 MARLA', 3, 42, 1, 0, 0, NULL);

-- 10_4

INSERT INTO FILTER_FINISHING_MATERIALS (AREA_QTY, LAYOUT_10_ID, MATERIAL_ID, GROUND_QTY, FIRST_FLOOR_QTY, ROOFTOP_QTY, BASEMENT_QTY) 
VALUES 
('10 MARLA', 4, 1, 90, 0, 0, NULL),
('10 MARLA', 4, 2, 960, 0, 0, NULL),
('10 MARLA', 4, 3, 1, 1, 0, NULL),
('10 MARLA', 4, 4, 4.375, 4.375, 0, NULL),
('10 MARLA', 4, 5, 6, 7, 1, NULL),
('10 MARLA', 4, 6, 4, 3, 0, NULL),
('10 MARLA', 4, 7, 15, 14, 1, NULL),
('10 MARLA', 4, 8, 1, 1, 0, NULL),
('10 MARLA', 4, 9, 15, 14, 1, NULL),
('10 MARLA', 4, 10, 15, 14, 1, NULL),
('10 MARLA', 4, 11, 17.5, 10.9375, 2.1875, NULL),
('10 MARLA', 4, 12, 165, 201, 36, NULL),
('10 MARLA', 4, 13, 2, 2, 0, NULL),
('10 MARLA', 4, 14, 6, 7, 1, NULL),
('10 MARLA', 4, 15, 168, 174, 15, NULL),
('10 MARLA', 4, 16, 6, 5, 2, NULL),
('10 MARLA', 4, 17, 5.25, 5.25, 0, NULL),
('10 MARLA', 4, 18, 3, 3, 0, NULL),
('10 MARLA', 4, 19, 18, 18, 0, NULL),
('10 MARLA', 4, 20, 185, 185, 0, NULL),
('10 MARLA', 4, 21, 483, 483, 0, NULL),
('10 MARLA', 4, 22, 3, 3, 0, NULL),
('10 MARLA', 4, 23, 3, 3, 0, NULL),
('10 MARLA', 4, 24, 3, 3, 0, NULL),
('10 MARLA', 4, 25, 3, 3, 0, NULL),
('10 MARLA', 4, 26, 3, 3, 0, NULL),
('10 MARLA', 4, 27, 3, 3, 0, NULL),
('10 MARLA', 4, 28, 51, 51, 0, NULL),
('10 MARLA', 4, 29, 1, 1, 0, NULL),
('10 MARLA', 4, 30, 1, 1, 0, NULL),
('10 MARLA', 4, 31, 51, 51, 0, NULL),
('10 MARLA', 4, 32, 1, 1, 0, NULL),
('10 MARLA', 4, 33, 177, 177, 0, NULL),
('10 MARLA', 4, 34, 1, 1, 0, NULL),
('10 MARLA', 4, 35, 48, 48, 0, NULL),
('10 MARLA', 4, 36, 1025, 1413, 121, NULL),
('10 MARLA', 4, 37, 15, 15, 0, NULL),
('10 MARLA', 4, 38, 107, 107, 0, NULL),
('10 MARLA', 4, 39, 1, 1, 0, NULL),
('10 MARLA', 4, 40, 1418, 1613, 121, NULL),
('10 MARLA', 4, 41, 252, 184, 121, NULL),
('10 MARLA', 4, 42, 1, 0, 0, NULL);


-- 10_5

INSERT INTO FILTER_FINISHING_MATERIALS (AREA_QTY, LAYOUT_10_ID, MATERIAL_ID, GROUND_QTY, FIRST_FLOOR_QTY, ROOFTOP_QTY, BASEMENT_QTY) 
VALUES 
('10 MARLA', 5, 1, 90, 0, 0, 0),
('10 MARLA', 5, 2, 896, 0, 0, 0),
('10 MARLA', 5, 3, 1, 1, 0, 0),
('10 MARLA', 5, 4, 4.375, 0, 0, 0),
('10 MARLA', 5, 5, 6, 6, 1, 2),
('10 MARLA', 5, 6, 3, 3, 0, 0),
('10 MARLA', 5, 7, 9, 8, 1, 2),
('10 MARLA', 5, 8, 1, 1, 0, 0),
('10 MARLA', 5, 9, 6, 8, 1, 3),
('10 MARLA', 5, 10, 12, 10, 1, 3),
('10 MARLA', 5, 11, 13.125, 13.125, 2.1875, 0),
('10 MARLA', 5, 12, 144, 144, 33, 0),
('10 MARLA', 5, 13, 2, 2, 0, 0),
('10 MARLA', 5, 14, 6, 6, 1, 2),
('10 MARLA', 5, 15, 167, 160, 19, 45),
('10 MARLA', 5, 16, 6, 5, 2, 5),
('10 MARLA', 5, 17, 3.5, 3.5, 0, 0),
('10 MARLA', 5, 18, 2, 2, 0, 0),
('10 MARLA', 5, 19, 12, 16, 0, 0),
('10 MARLA', 5, 20, 115, 115, 0, 0),
('10 MARLA', 5, 21, 351, 351, 0, 0),
('10 MARLA', 5, 22, 2, 2, 0, 0),
('10 MARLA', 5, 23, 2, 2, 0, 0),
('10 MARLA', 5, 24, 2, 2, 0, 0),
('10 MARLA', 5, 25, 2, 2, 0, 0),
('10 MARLA', 5, 26, 2, 2, 0, 0),
('10 MARLA', 5, 27, 2, 2, 0, 0),
('10 MARLA', 5, 28, 60, 60, 0, 0),
('10 MARLA', 5, 29, 1, 1, 0, 0),
('10 MARLA', 5, 30, 1, 1, 0, 0),
('10 MARLA', 5, 31, 60, 60, 0, 0),
('10 MARLA', 5, 32, 1, 1, 0, 0),
('10 MARLA', 5, 33, 198, 198, 0, 0),
('10 MARLA', 5, 34, 1, 1, 0, 0),
('10 MARLA', 5, 35, 48, 48, 0, 0),
('10 MARLA', 5, 36, 959, 1384, 132, 1568),
('10 MARLA', 5, 37, 14, 14, 0, 14),
('10 MARLA', 5, 38, 119, 119, 0, 119),
('10 MARLA', 5, 39, 1, 1, 0, 1),
('10 MARLA', 5, 40, 1414, 1764, 132, 1568),
('10 MARLA', 5, 41, 281, 192, 110, 81),
('10 MARLA', 5, 42, 1, 0, 0, 0);


-- 10_6

INSERT INTO FILTER_FINISHING_MATERIALS (AREA_QTY, LAYOUT_10_ID, MATERIAL_ID, GROUND_QTY, FIRST_FLOOR_QTY, ROOFTOP_QTY, BASEMENT_QTY) 
VALUES 
('10 MARLA', 6, 1, 90, 0, 0, 0),
('10 MARLA', 6, 2, 818, 0, 0, 0),
('10 MARLA', 6, 3, 1, 1, 0, 0),
('10 MARLA', 6, 4, 13.125, 13.125, 0, 0),
('10 MARLA', 6, 5, 7, 7, 1, 3),
('10 MARLA', 6, 6, 4, 3, 0, 0),
('10 MARLA', 6, 7, 15, 14, 1, 3),
('10 MARLA', 6, 8, 1, 1, 0, 0),
('10 MARLA', 6, 9, 15, 14, 1, 3),
('10 MARLA', 6, 10, 15, 14, 1, 3),
('10 MARLA', 6, 11, 17.5, 10.9375, 2.1875, 2.1875),
('10 MARLA', 6, 12, 165, 201, 36, 36),
('10 MARLA', 6, 13, 2, 2, 0, 1),
('10 MARLA', 6, 14, 6, 7, 1, 3),
('10 MARLA', 6, 15, 168, 174, 15, 47),
('10 MARLA', 6, 16, 6, 5, 2, 5),
('10 MARLA', 6, 17, 3.5, 3.5, 0, 0),
('10 MARLA', 6, 18, 2, 2, 0, 0),
('10 MARLA', 6, 19, 18, 18, 0, 0),
('10 MARLA', 6, 20, 185, 185, 0, 0),
('10 MARLA', 6, 21, 483, 483, 0, 0),
('10 MARLA', 6, 22, 3, 3, 0, 0),
('10 MARLA', 6, 23, 3, 3, 0, 0),
('10 MARLA', 6, 24, 3, 3, 0, 0),
('10 MARLA', 6, 25, 3, 3, 0, 0),
('10 MARLA', 6, 26, 3, 3, 0, 0),
('10 MARLA', 6, 27, 3, 3, 0, 0),
('10 MARLA', 6, 28, 51, 51, 0, 0),
('10 MARLA', 6, 29, 1, 1, 0, 0),
('10 MARLA', 6, 30, 1, 1, 0, 0),
('10 MARLA', 6, 31, 51, 51, 0, 0),
('10 MARLA', 6, 32, 1, 1, 0, 0),
('10 MARLA', 6, 33, 177, 177, 0, 0),
('10 MARLA', 6, 34, 1, 1, 0, 0),
('10 MARLA', 6, 35, 48, 48, 0, 0),
('10 MARLA', 6, 36, 1025, 1413, 121, 1230),
('10 MARLA', 6, 37, 15, 15, 0, 15),
('10 MARLA', 6, 38, 107, 107, 0, 107),
('10 MARLA', 6, 39, 1, 1, 0, 1),
('10 MARLA', 6, 40, 1418, 1613, 121, 1384),
('10 MARLA', 6, 41, 252, 184, 121, 114),
('10 MARLA', 6, 42, 1, 0, 0, 0);


-- 10_7

INSERT INTO FILTER_FINISHING_MATERIALS (AREA_QTY, LAYOUT_10_ID, MATERIAL_ID, GROUND_QTY, FIRST_FLOOR_QTY, ROOFTOP_QTY, BASEMENT_QTY) 
VALUES 
('10 MARLA', 7, 1, 90, 0, 0, NULL),
('10 MARLA', 7, 2, 890, 0, 0, NULL),
('10 MARLA', 7, 3, 1, 1, 0, NULL),
('10 MARLA', 7, 4, 4.375, 0, 0, NULL),
('10 MARLA', 7, 5, 7, 7, 1, NULL),
('10 MARLA', 7, 6, 3, 3, 0, NULL),
('10 MARLA', 7, 7, 17, 10, 1, NULL),
('10 MARLA', 7, 8, 1, 1, 0, NULL),
('10 MARLA', 7, 9, 17, 10, 1, NULL),
('10 MARLA', 7, 10, 17, 10, 1, NULL),
('10 MARLA', 7, 11, 19.6875, 15.3125, 2.1875, NULL),
('10 MARLA', 7, 12, 162, 162, 42, NULL),
('10 MARLA', 7, 13, 2, 2, 0, NULL),
('10 MARLA', 7, 14, 7, 7, 1, NULL),
('10 MARLA', 7, 15, 170, 159, 16, NULL),
('10 MARLA', 7, 16, 6, 5, 2, NULL),
('10 MARLA', 7, 17, 3.5, 3.5, 0, NULL),
('10 MARLA', 7, 18, 2, 2, 0, NULL),
('10 MARLA', 7, 19, 12, 12, 0, NULL),
('10 MARLA', 7, 20, 98, 98, 0, NULL),
('10 MARLA', 7, 21, 360, 360, 0, NULL),
('10 MARLA', 7, 22, 2, 2, 0, NULL),
('10 MARLA', 7, 23, 2, 2, 0, NULL),
('10 MARLA', 7, 24, 2, 2, 0, NULL),
('10 MARLA', 7, 25, 2, 2, 0, NULL),
('10 MARLA', 7, 26, 2, 2, 0, NULL),
('10 MARLA', 7, 27, 2, 2, 0, NULL),
('10 MARLA', 7, 28, 51, 57, 0, NULL),
('10 MARLA', 7, 29, 1, 1, 0, NULL),
('10 MARLA', 7, 30, 1, 1, 0, NULL),
('10 MARLA', 7, 31, 51, 57, 0, NULL),
('10 MARLA', 7, 32, 1, 1, 0, NULL),
('10 MARLA', 7, 33, 204, 222, 0, NULL),
('10 MARLA', 7, 34, 1, 1, 0, NULL),
('10 MARLA', 7, 35, 36, 36, 0, NULL),
('10 MARLA', 7, 36, 1045, 1263, 126, NULL),
('10 MARLA', 7, 37, 15, 15, 0, NULL),
('10 MARLA', 7, 38, 107, 107, 0, NULL),
('10 MARLA', 7, 39, 1, 1, 0, NULL),
('10 MARLA', 7, 40, 1461, 1650, 126, NULL),
('10 MARLA', 7, 41, 281, 181, 117, NULL),
('10 MARLA', 7, 42, 1, 0, 0, NULL);


-- 10_8

INSERT INTO FILTER_FINISHING_MATERIALS (AREA_QTY, LAYOUT_10_ID, MATERIAL_ID, GROUND_QTY, FIRST_FLOOR_QTY, ROOFTOP_QTY, BASEMENT_QTY) 
VALUES 
('10 MARLA', 8, 1, 90, 0, 0, NULL),
('10 MARLA', 8, 2, 960, 0, 0, NULL),
('10 MARLA', 8, 3, 1, 1, 0, NULL),
('10 MARLA', 8, 4, 4.375, 4.375, 0, NULL),
('10 MARLA', 8, 5, 6, 7, 1, NULL),
('10 MARLA', 8, 6, 4, 3, 0, NULL),
('10 MARLA', 8, 7, 15, 14, 1, NULL),
('10 MARLA', 8, 8, 1, 1, 0, NULL),
('10 MARLA', 8, 9, 15, 14, 1, NULL),
('10 MARLA', 8, 10, 15, 14, 1, NULL),
('10 MARLA', 8, 11, 17.5, 10.9375, 2.1875, NULL),
('10 MARLA', 8, 12, 165, 201, 36, NULL),
('10 MARLA', 8, 13, 2, 2, 0, NULL),
('10 MARLA', 8, 14, 6, 7, 1, NULL),
('10 MARLA', 8, 15, 168, 174, 15, NULL),
('10 MARLA', 8, 16, 6, 5, 2, NULL),
('10 MARLA', 8, 17, 5.25, 5.25, 0, NULL),
('10 MARLA', 8, 18, 3, 3, 0, NULL),
('10 MARLA', 8, 19, 18, 18, 0, NULL),
('10 MARLA', 8, 20, 185, 185, 0, NULL),
('10 MARLA', 8, 21, 483, 483, 0, NULL),
('10 MARLA', 8, 22, 3, 3, 0, NULL),
('10 MARLA', 8, 23, 3, 3, 0, NULL),
('10 MARLA', 8, 24, 3, 3, 0, NULL),
('10 MARLA', 8, 25, 3, 3, 0, NULL),
('10 MARLA', 8, 26, 3, 3, 0, NULL),
('10 MARLA', 8, 27, 3, 3, 0, NULL),
('10 MARLA', 8, 28, 51, 51, 0, NULL),
('10 MARLA', 8, 29, 1, 1, 0, NULL),
('10 MARLA', 8, 30, 1, 1, 0, NULL),
('10 MARLA', 8, 31, 51, 51, 0, NULL),
('10 MARLA', 8, 32, 1, 1, 0, NULL),
('10 MARLA', 8, 33, 177, 177, 0, NULL),
('10 MARLA', 8, 34, 1, 1, 0, NULL),
('10 MARLA', 8, 35, 48, 48, 0, NULL),
('10 MARLA', 8, 36, 1025, 1413, 121, NULL),
('10 MARLA', 8, 37, 15, 15, 0, NULL),
('10 MARLA', 8, 38, 107, 107, 0, NULL),
('10 MARLA', 8, 39, 1, 1, 0, NULL),
('10 MARLA', 8, 40, 1418, 1613, 121, NULL),
('10 MARLA', 8, 41, 252, 184, 121, NULL),
('10 MARLA', 8, 42, 1, 0, 0, NULL);


-- 20_1

INSERT INTO FILTER_FINISHING_MATERIALS (AREA_QTY, LAYOUT_20_ID, MATERIAL_ID, GROUND_QTY, FIRST_FLOOR_QTY, ROOFTOP_QTY, BASEMENT_QTY) 
VALUES 
('20 MARLA', 1, 1, 120, 0, 0, 0),
('20 MARLA', 1, 2, 1845, 0, 0, 0),
('20 MARLA', 1, 3, 1, 1, 0, 0),
('20 MARLA', 1, 4, 10.5, 10.5, 0, 0),
('20 MARLA', 1, 5, 8, 9, 1, 4),
('20 MARLA', 1, 6, 5, 5, 0, 0),
('20 MARLA', 1, 7, 20, 22, 1, 4),
('20 MARLA', 1, 8, 1, 1, 0, 0),
('20 MARLA', 1, 9, 20, 22, 1, 4),
('20 MARLA', 1, 10, 20, 22, 1, 4),
('20 MARLA', 1, 11, 18.375, 13.125, 2.625, 0),
('20 MARLA', 1, 12, 210, 210, 72, 0),
('20 MARLA', 1, 13, 3, 4, 0, 0),
('20 MARLA', 1, 14, 8, 9, 1, 4),
('20 MARLA', 1, 15, 198, 200, 24, 58),
('20 MARLA', 1, 16, 6, 5, 2, 5),
('20 MARLA', 1, 17, 8.75, 4.375, 0, 0),
('20 MARLA', 1, 18, 4, 2, 0, 0),
('20 MARLA', 1, 19, 32, 16, 0, 0),
('20 MARLA', 1, 20, 250, 222, 0, 0),
('20 MARLA', 1, 21, 736, 468, 0, 0),
('20 MARLA', 1, 22, 4, 2, 0, 0),
('20 MARLA', 1, 23, 4, 2, 0, 0),
('20 MARLA', 1, 24, 4, 2, 0, 0),
('20 MARLA', 1, 25, 4, 2, 0, 0),
('20 MARLA', 1, 26, 4, 2, 0, 0),
('20 MARLA', 1, 27, 4, 2, 0, 0),
('20 MARLA', 1, 28, 52, 58, 0, 0),
('20 MARLA', 1, 29, 58, 1, 0, 0),
('20 MARLA', 1, 30, 1, 1, 0, 0),
('20 MARLA', 1, 31, 58, 58, 0, 0),
('20 MARLA', 1, 32, 1, 1, 0, 0),
('20 MARLA', 1, 33, 240, 240, 0, 0),
('20 MARLA', 1, 34, 1, 1, 0, 0),
('20 MARLA', 1, 35, 36, 36, 0, 0),
('20 MARLA', 1, 36, 1976, 1915, 342, 2660),
('20 MARLA', 1, 37, 14, 14, 0, 14),
('20 MARLA', 1, 38, 140, 140, 0, 140),
('20 MARLA', 1, 39, 1, 1, 0, 1),
('20 MARLA', 1, 40, 2680, 3000, 342, 2660),
('20 MARLA', 1, 41, 380, 273, 141, 108),
('20 MARLA', 1, 42, 1, 0, 0, 0);


-- 20_2

INSERT INTO FILTER_FINISHING_MATERIALS (AREA_QTY, LAYOUT_20_ID, MATERIAL_ID, GROUND_QTY, FIRST_FLOOR_QTY, ROOFTOP_QTY, BASEMENT_QTY) 
VALUES 
('20 MARLA', 2, 1, 120, 0, 0, 0),
('20 MARLA', 2, 2, 1346, 0, 0, 0),
('20 MARLA', 2, 3, 1, 1, 0, 0),
('20 MARLA', 2, 4, 15.75, 15.75, 0, 0),
('20 MARLA', 2, 5, 8, 8, 1, 4),
('20 MARLA', 2, 6, 6, 3, 0, 0),
('20 MARLA', 2, 7, 19, 8, 1, 4),
('20 MARLA', 2, 8, 1, 1, 0, 0),
('20 MARLA', 2, 9, 19, 8, 1, 6),
('20 MARLA', 2, 10, 19, 8, 1, 6),
('20 MARLA', 2, 11, 15.75, 13.125, 2.625, 2.625),
('20 MARLA', 2, 12, 228, 228, 48, 36),
('20 MARLA', 2, 13, 3, 3, 0, 1),
('20 MARLA', 2, 14, 8, 8, 1, 4),
('20 MARLA', 2, 15, 205, 202, 18, 68),
('20 MARLA', 2, 16, 6, 5, 2, 5),
('20 MARLA', 2, 17, 8.75, 8.75, 0, 2.1875),
('20 MARLA', 2, 18, 4, 4, 0, 1),
('20 MARLA', 2, 19, 32, 32, 0, 8),
('20 MARLA', 2, 20, 350, 350, 0, 228),
('20 MARLA', 2, 21, 875, 875, 0, 357),
('20 MARLA', 2, 22, 4, 4, 0, 1),
('20 MARLA', 2, 23, 4, 4, 0, 1),
('20 MARLA', 2, 24, 4, 4, 0, 1),
('20 MARLA', 2, 25, 4, 4, 0, 1),
('20 MARLA', 2, 26, 4, 4, 0, 1),
('20 MARLA', 2, 27, 4, 4, 0, 1),
('20 MARLA', 2, 28, 78, 84, 0, 0),
('20 MARLA', 2, 29, 1, 1, 0, 0),
('20 MARLA', 2, 30, 1, 1, 0, 0),
('20 MARLA', 2, 31, 78, 84, 0, 0),
('20 MARLA', 2, 32, 1, 1, 0, 0),
('20 MARLA', 2, 33, 324, 342, 0, 0),
('20 MARLA', 2, 34, 1, 1, 0, 0),
('20 MARLA', 2, 35, 60, 60, 0, 0),
('20 MARLA', 2, 36, 2262, 2574, 169, 2436),
('20 MARLA', 2, 37, 14, 14, 0, 14),
('20 MARLA', 2, 38, 140, 140, 0, 140),
('20 MARLA', 2, 39, 1, 1, 0, 1),
('20 MARLA', 2, 40, 3159, 2574, 169, 2436),
('20 MARLA', 2, 41, 445, 323, 160, 133),
('20 MARLA', 2, 42, 1, 0, 0, 0);


-- 20_3

INSERT INTO FILTER_FINISHING_MATERIALS (AREA_QTY, LAYOUT_20_ID, MATERIAL_ID, GROUND_QTY, FIRST_FLOOR_QTY, ROOFTOP_QTY, BASEMENT_QTY) 
VALUES 
('20 MARLA', 3, 1, 120, 0, 0, NULL),
('20 MARLA', 3, 2, 2136, 0, 0, NULL),
('20 MARLA', 3, 3, 1, 1, 0, NULL),
('20 MARLA', 3, 4, 15.75, 10.5, 0, NULL),
('20 MARLA', 3, 5, 10, 8, 1, NULL),
('20 MARLA', 3, 6, 5, 4, 0, NULL),
('20 MARLA', 3, 7, 20, 18, 1, NULL),
('20 MARLA', 3, 8, 1, 1, 0, NULL),
('20 MARLA', 3, 9, 20, 18, 1, NULL),
('20 MARLA', 3, 10, 20, 18, 1, NULL),
('20 MARLA', 3, 11, 15.75, 10.5, 2.625, NULL),
('20 MARLA', 3, 12, 252, 288, 48, NULL),
('20 MARLA', 3, 13, 2, 3, 0, NULL),
('20 MARLA', 3, 14, 10, 8, 1, NULL),
('20 MARLA', 3, 15, 187, 154, 16, NULL),
('20 MARLA', 3, 16, 6, 5, 2, NULL),
('20 MARLA', 3, 17, 6.5625, 8.75, 0, NULL),
('20 MARLA', 3, 18, 3, 4, 0, NULL),
('20 MARLA', 3, 19, 24, 32, 0, NULL),
('20 MARLA', 3, 20, 171, 336, 0, NULL),
('20 MARLA', 3, 21, 501, 679, 0, NULL),
('20 MARLA', 3, 22, 3, 4, 0, NULL),
('20 MARLA', 3, 23, 3, 4, 0, NULL),
('20 MARLA', 3, 24, 3, 4, 0, NULL),
('20 MARLA', 3, 25, 3, 4, 0, NULL),
('20 MARLA', 3, 26, 3, 4, 0, NULL),
('20 MARLA', 3, 27, 3, 4, 0, NULL),
('20 MARLA', 3, 28, 56, 62, 0, NULL),
('20 MARLA', 3, 29, 1, 1, 0, NULL),
('20 MARLA', 3, 30, 1, 1, 0, NULL),
('20 MARLA', 3, 31, 56, 62, 0, NULL),
('20 MARLA', 3, 32, 1, 1, 0, NULL),
('20 MARLA', 3, 33, 228, 186, 0, NULL),
('20 MARLA', 3, 34, 1, 1, 0, NULL),
('20 MARLA', 3, 35, 48, 48, 0, NULL),
('20 MARLA', 3, 36, 1777, 2094, 169, NULL),
('20 MARLA', 3, 37, 15, 15, 0, NULL),
('20 MARLA', 3, 38, 124, 124, 0, NULL),
('20 MARLA', 3, 39, 1, 1, 0, NULL),
('20 MARLA', 3, 40, 2417, 2094, 169, NULL),
('20 MARLA', 3, 41, 449, 228, 142, NULL),
('20 MARLA', 3, 42, 1, 0, 0, NULL);



-- 20_4

INSERT INTO FILTER_FINISHING_MATERIALS (AREA_QTY, LAYOUT_20_ID, MATERIAL_ID, GROUND_QTY, FIRST_FLOOR_QTY, ROOFTOP_QTY, BASEMENT_QTY) 
VALUES 
('20 MARLA', 4, 1, 120, 0, 0, NULL),
('20 MARLA', 4, 2, 1929, 0, 0, NULL),
('20 MARLA', 4, 3, 1, 1, 0, NULL),
('20 MARLA', 4, 4, 15.75, 5.25, 0, NULL),
('20 MARLA', 4, 5, 7, 7, 1, NULL),
('20 MARLA', 4, 6, 4, 3, 0, NULL),
('20 MARLA', 4, 7, 17, 16, 1, NULL),
('20 MARLA', 4, 8, 1, 1, 0, NULL),
('20 MARLA', 4, 9, 17, 16, 1, NULL),
('20 MARLA', 4, 10, 17, 16, 1, NULL),
('20 MARLA', 4, 11, 18.375, 21, 2.625, NULL),
('20 MARLA', 4, 12, 198, 234, 48, NULL),
('20 MARLA', 4, 13, 2, 2, 0, NULL),
('20 MARLA', 4, 14, 7, 7, 1, NULL),
('20 MARLA', 4, 15, 179, 168, 18, NULL),
('20 MARLA', 4, 16, 6, 5, 2, NULL),
('20 MARLA', 4, 17, 6.5625, 6.5625, 0, NULL),
('20 MARLA', 4, 18, 3, 3, 0, NULL),
('20 MARLA', 4, 19, 24, 24, 0, NULL),
('20 MARLA', 4, 20, 254, 254, 0, NULL),
('20 MARLA', 4, 21, 642, 642, 0, NULL),
('20 MARLA', 4, 22, 3, 3, 0, NULL),
('20 MARLA', 4, 23, 3, 3, 0, NULL),
('20 MARLA', 4, 24, 3, 3, 0, NULL),
('20 MARLA', 4, 25, 3, 3, 0, NULL),
('20 MARLA', 4, 26, 3, 3, 0, NULL),
('20 MARLA', 4, 27, 3, 3, 0, NULL),
('20 MARLA', 4, 28, 52, 52, 0, NULL),
('20 MARLA', 4, 29, 1, 1, 0, NULL),
('20 MARLA', 4, 30, 1, 1, 0, NULL),
('20 MARLA', 4, 31, 52, 52, 0, NULL),
('20 MARLA', 4, 32, 1, 1, 0, NULL),
('20 MARLA', 4, 33, 330, 330, 0, NULL),
('20 MARLA', 4, 34, 1, 1, 0, NULL),
('20 MARLA', 4, 35, 48, 48, 0, NULL),
('20 MARLA', 4, 36, 1835, 2110, 169, NULL),
('20 MARLA', 4, 37, 14, 14, 0, NULL),
('20 MARLA', 4, 38, 140, 140, 0, NULL),
('20 MARLA', 4, 39, 1, 1, 0, NULL),
('20 MARLA', 4, 40, 1835, 2110, 169, NULL),
('20 MARLA', 4, 41, 378, 275, 139, NULL),
('20 MARLA', 4, 42, 1, 0, 0, NULL);


-- 20_5

INSERT INTO FILTER_FINISHING_MATERIALS (AREA_QTY, LAYOUT_20_ID, MATERIAL_ID, GROUND_QTY, FIRST_FLOOR_QTY, ROOFTOP_QTY, BASEMENT_QTY) 
VALUES 
('20 MARLA', 5, 1, 120, 0, 0, 0),
('20 MARLA', 5, 2, 1346, 0, 0, 0),
('20 MARLA', 5, 3, 1, 1, 0, 0),
('20 MARLA', 5, 4, 15.75, 15.75, 0, 0),
('20 MARLA', 5, 5, 8, 8, 1, 4),
('20 MARLA', 5, 6, 6, 3, 0, 0),
('20 MARLA', 5, 7, 19, 8, 1, 4),
('20 MARLA', 5, 8, 1, 1, 0, 0),
('20 MARLA', 5, 9, 19, 8, 1, 6),
('20 MARLA', 5, 10, 19, 8, 1, 6),
('20 MARLA', 5, 11, 15.75, 13.125, 2.625, 2.625),
('20 MARLA', 5, 12, 228, 228, 48, 36),
('20 MARLA', 5, 13, 3, 3, 0, 1),
('20 MARLA', 5, 14, 8, 8, 1, 4),
('20 MARLA', 5, 15, 205, 202, 18, 68),
('20 MARLA', 5, 16, 6, 5, 2, 5),
('20 MARLA', 5, 17, 8.75, 8.75, 0, 2.1875),
('20 MARLA', 5, 18, 4, 4, 0, 1),
('20 MARLA', 5, 19, 32, 32, 0, 8),
('20 MARLA', 5, 20, 350, 350, 0, 228),
('20 MARLA', 5, 21, 875, 875, 0, 357),
('20 MARLA', 5, 22, 4, 4, 0, 1),
('20 MARLA', 5, 23, 4, 4, 0, 1),
('20 MARLA', 5, 24, 4, 4, 0, 1),
('20 MARLA', 5, 25, 4, 4, 0, 1),
('20 MARLA', 5, 26, 4, 4, 0, 1),
('20 MARLA', 5, 27, 4, 4, 0, 1),
('20 MARLA', 5, 28, 78, 84, 0, 0),
('20 MARLA', 5, 29, 1, 1, 0, 0),
('20 MARLA', 5, 30, 1, 1, 0, 0),
('20 MARLA', 5, 31, 78, 84, 0, 0),
('20 MARLA', 5, 32, 1, 1, 0, 0),
('20 MARLA', 5, 33, 324, 342, 0, 0),
('20 MARLA', 5, 34, 1, 1, 0, 0),
('20 MARLA', 5, 35, 60, 60, 0, 0),
('20 MARLA', 5, 36, 2262, 2574, 169, 2436),
('20 MARLA', 5, 37, 14, 14, 0, 14),
('20 MARLA', 5, 38, 140, 140, 0, 140),
('20 MARLA', 5, 39, 1, 1, 0, 1),
('20 MARLA', 5, 40, 3159, 2574, 169, 2436),
('20 MARLA', 5, 41, 445, 323, 160, 133),
('20 MARLA', 5, 42, 1, 0, 0, 0);


-- 20_6

INSERT INTO FILTER_FINISHING_MATERIALS (AREA_QTY, LAYOUT_20_ID, MATERIAL_ID, GROUND_QTY, FIRST_FLOOR_QTY, ROOFTOP_QTY, BASEMENT_QTY) 
VALUES 
('20 MARLA', 6, 1, 120, 0, 0, 0),
('20 MARLA', 6, 2, 1346, 0, 0, 0),
('20 MARLA', 6, 3, 1, 1, 0, 0),
('20 MARLA', 6, 4, 15.75, 15.75, 0, 0),
('20 MARLA', 6, 5, 8, 8, 1, 4),
('20 MARLA', 6, 6, 6, 3, 0, 0),
('20 MARLA', 6, 7, 19, 8, 1, 4),
('20 MARLA', 6, 8, 1, 1, 0, 0),
('20 MARLA', 6, 9, 19, 8, 1, 6),
('20 MARLA', 6, 10, 19, 8, 1, 6),
('20 MARLA', 6, 11, 15.75, 13.125, 2.625, 2.625),
('20 MARLA', 6, 12, 228, 228, 48, 36),
('20 MARLA', 6, 13, 3, 3, 0, 1),
('20 MARLA', 6, 14, 8, 8, 1, 4),
('20 MARLA', 6, 15, 205, 202, 18, 68),
('20 MARLA', 6, 16, 6, 5, 2, 5),
('20 MARLA', 6, 17, 8.75, 8.75, 0, 2.1875),
('20 MARLA', 6, 18, 4, 4, 0, 1),
('20 MARLA', 6, 19, 32, 32, 0, 8),
('20 MARLA', 6, 20, 350, 350, 0, 228),
('20 MARLA', 6, 21, 875, 875, 0, 357),
('20 MARLA', 6, 22, 4, 4, 0, 1),
('20 MARLA', 6, 23, 4, 4, 0, 1),
('20 MARLA', 6, 24, 4, 4, 0, 1),
('20 MARLA', 6, 25, 4, 4, 0, 1),
('20 MARLA', 6, 26, 4, 4, 0, 1),
('20 MARLA', 6, 27, 4, 4, 0, 1),
('20 MARLA', 6, 28, 78, 84, 0, 0),
('20 MARLA', 6, 29, 1, 1, 0, 0),
('20 MARLA', 6, 30, 1, 1, 0, 0),
('20 MARLA', 6, 31, 78, 84, 0, 0),
('20 MARLA', 6, 32, 1, 1, 0, 0),
('20 MARLA', 6, 33, 324, 342, 0, 0),
('20 MARLA', 6, 34, 1, 1, 0, 0),
('20 MARLA', 6, 35, 60, 60, 0, 0),
('20 MARLA', 6, 36, 2262, 2574, 169, 2436),
('20 MARLA', 6, 37, 14, 14, 0, 14),
('20 MARLA', 6, 38, 140, 140, 0, 140),
('20 MARLA', 6, 39, 1, 1, 0, 1),
('20 MARLA', 6, 40, 3159, 2574, 169, 2436),
('20 MARLA', 6, 41, 445, 323, 160, 133),
('20 MARLA', 6, 42, 1, 0, 0, 0);

-- 20_7

INSERT INTO FILTER_FINISHING_MATERIALS (AREA_QTY, LAYOUT_20_ID, MATERIAL_ID, GROUND_QTY, FIRST_FLOOR_QTY, ROOFTOP_QTY, BASEMENT_QTY) 
VALUES 
('20 MARLA', 7, 1, 120, 0, 0, NULL),
('20 MARLA', 7, 2, 2136, 0, 0, NULL),
('20 MARLA', 7, 3, 1, 1, 0, NULL),
('20 MARLA', 7, 4, 15.75, 10.5, 0, NULL),
('20 MARLA', 7, 5, 10, 8, 1, NULL),
('20 MARLA', 7, 6, 5, 4, 0, NULL),
('20 MARLA', 7, 7, 20, 18, 1, NULL),
('20 MARLA', 7, 8, 1, 1, 0, NULL),
('20 MARLA', 7, 9, 20, 18, 1, NULL),
('20 MARLA', 7, 10, 20, 18, 1, NULL),
('20 MARLA', 7, 11, 15.75, 10.5, 2.625, NULL),
('20 MARLA', 7, 12, 252, 288, 48, NULL),
('20 MARLA', 7, 13, 2, 3, 0, NULL),
('20 MARLA', 7, 14, 10, 8, 1, NULL),
('20 MARLA', 7, 15, 187, 154, 16, NULL),
('20 MARLA', 7, 16, 6, 5, 2, NULL),
('20 MARLA', 7, 17, 6.5625, 8.75, 0, NULL),
('20 MARLA', 7, 18, 3, 4, 0, NULL),
('20 MARLA', 7, 19, 24, 32, 0, NULL),
('20 MARLA', 7, 20, 171, 336, 0, NULL),
('20 MARLA', 7, 21, 501, 679, 0, NULL),
('20 MARLA', 7, 22, 3, 4, 0, NULL),
('20 MARLA', 7, 23, 3, 4, 0, NULL),
('20 MARLA', 7, 24, 3, 4, 0, NULL),
('20 MARLA', 7, 25, 3, 4, 0, NULL),
('20 MARLA', 7, 26, 3, 4, 0, NULL),
('20 MARLA', 7, 27, 3, 4, 0, NULL),
('20 MARLA', 7, 28, 56, 62, 0, NULL),
('20 MARLA', 7, 29, 1, 1, 0, NULL),
('20 MARLA', 7, 30, 1, 1, 0, NULL),
('20 MARLA', 7, 31, 56, 62, 0, NULL),
('20 MARLA', 7, 32, 1, 1, 0, NULL),
('20 MARLA', 7, 33, 228, 186, 0, NULL),
('20 MARLA', 7, 34, 1, 1, 0, NULL),
('20 MARLA', 7, 35, 48, 48, 0, NULL),
('20 MARLA', 7, 36, 1777, 2094, 169, NULL),
('20 MARLA', 7, 37, 15, 15, 0, NULL),
('20 MARLA', 7, 38, 124, 124, 0, NULL),
('20 MARLA', 7, 39, 1, 1, 0, NULL),
('20 MARLA', 7, 40, 2417, 2094, 169, NULL),
('20 MARLA', 7, 41, 449, 228, 142, NULL),
('20 MARLA', 7, 42, 1, 0, 0, NULL);


 -- 20_8
 
 INSERT INTO FILTER_FINISHING_MATERIALS (AREA_QTY, LAYOUT_20_ID, MATERIAL_ID, GROUND_QTY, FIRST_FLOOR_QTY, ROOFTOP_QTY, BASEMENT_QTY) 
VALUES 
('20 MARLA', 8, 1, 120, 0, 0, NULL),
('20 MARLA', 8, 2, 1929, 0, 0, NULL),
('20 MARLA', 8, 3, 1, 1, 0, NULL),
('20 MARLA', 8, 4, 15.75, 5.25, 0, NULL),
('20 MARLA', 8, 5, 7, 7, 1, NULL),
('20 MARLA', 8, 6, 4, 3, 0, NULL),
('20 MARLA', 8, 7, 17, 16, 1, NULL),
('20 MARLA', 8, 8, 1, 1, 0, NULL),
('20 MARLA', 8, 9, 17, 16, 1, NULL),
('20 MARLA', 8, 10, 17, 16, 1, NULL),
('20 MARLA', 8, 11, 18.375, 21, 2.625, NULL),
('20 MARLA', 8, 12, 198, 234, 48, NULL),
('20 MARLA', 8, 13, 2, 2, 0, NULL),
('20 MARLA', 8, 14, 7, 7, 1, NULL),
('20 MARLA', 8, 15, 179, 168, 18, NULL),
('20 MARLA', 8, 16, 6, 5, 2, NULL),
('20 MARLA', 8, 17, 6.5625, 6.5625, 0, NULL),
('20 MARLA', 8, 18, 3, 3, 0, NULL),
('20 MARLA', 8, 19, 24, 24, 0, NULL),
('20 MARLA', 8, 20, 254, 254, 0, NULL),
('20 MARLA', 8, 21, 642, 642, 0, NULL),
('20 MARLA', 8, 22, 3, 3, 0, NULL),
('20 MARLA', 8, 23, 3, 3, 0, NULL),
('20 MARLA', 8, 24, 3, 3, 0, NULL),
('20 MARLA', 8, 25, 3, 3, 0, NULL),
('20 MARLA', 8, 26, 3, 3, 0, NULL),
('20 MARLA', 8, 27, 3, 3, 0, NULL),
('20 MARLA', 8, 28, 52, 52, 0, NULL),
('20 MARLA', 8, 29, 1, 1, 0, NULL),
('20 MARLA', 8, 30, 1, 1, 0, NULL),
('20 MARLA', 8, 31, 52, 52, 0, NULL),
('20 MARLA', 8, 32, 1, 1, 0, NULL),
('20 MARLA', 8, 33, 330, 330, 0, NULL),
('20 MARLA', 8, 34, 1, 1, 0, NULL),
('20 MARLA', 8, 35, 48, 48, 0, NULL),
('20 MARLA', 8, 36, 1835, 2110, 169, NULL),
('20 MARLA', 8, 37, 14, 14, 0, NULL),
('20 MARLA', 8, 38, 140, 140, 0, NULL),
('20 MARLA', 8, 39, 1, 1, 0, NULL),
('20 MARLA', 8, 40, 1835, 2110, 169, NULL),
('20 MARLA', 8, 41, 378, 275, 139, NULL),
('20 MARLA', 8, 42, 1, 0, 0, NULL);

 
 
 
SELECT * FROM FILTER_FINISHING_MATERIALS WHERE AREA_QTY="20 MARLA" AND LAYOUT_20_ID IS NOT NULL;
SELECT * FROM FINISHING_MATERIALS;
SELECT * FROM filter_finishing_materials;
SELECT * FROM filter_finishing_materials WHERE FILTER_FINISHING_MATERIAL_ID>1000;



-- FETCH FINISHING MATERIALS QUERY

SELECT 
                        A.MATERIAL_NAME,
                        A.CLASS_D,
                        A.FACTOR,
                        ROUND((A.RATE_D),0),
                        (B.GROUND_QTY + B.ROOFTOP_QTY) AS total_quantity,
                        ROUND((A.RATE_D * (B.GROUND_QTY + B.ROOFTOP_QTY)),0) AS total_cost
                    FROM 
                        finishing_materials AS A
                    JOIN 
                        filter_finishing_materials AS B ON A.MATERIAL_ID = B.MATERIAL_ID
                    WHERE 
                        B.AREA_QTY = "3 MARLA" 
                        AND B.LAYOUT_3_ID = 1;
                        
                        
                        
-- FINISH COST                        
SELECT 
                            SUM(GROUND_material_cost) AS 1_total_cost,
                            SUM(ROOFTOP_material_cost) AS 3_total_cost


                        FROM (
                            SELECT 
                                (B.GROUND_QTY * A.RATE_D) AS GROUND_material_cost,
                                (B.ROOFTOP_QTY * A.RATE_D) AS ROOFTOP_material_cost
                                        
                            FROM 
                                finishing_materials AS A
                            JOIN 
                                filter_finishing_materials AS B ON A.MATERIAL_ID = B.MATERIAL_ID
                            WHERE 
                                B.AREA_QTY = "3 MARLA"
                                AND B.LAYOUT_3_ID = 1
                        ) AS subquery;
                        
                        
                        
                        