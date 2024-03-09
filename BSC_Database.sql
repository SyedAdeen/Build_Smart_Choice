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



 