CREATE SCHEMA`DB_BSC`;

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
(20,"1.5 mm Sq. PVC insulated Cu. Conductor wire","Coil",4944,"Power Tech Cables"),
(21,'2.5 mm Sq. PVC insulated Cu. Conductor wire', "Coil", 7931,"Power Tech Cables"),
(22,'4 mm Sq. PVC insulated Cu. Conductor wire', "Coil", 12360,"Power Tech Cables"),
(23,'GL Welded Pipeline 3/4" i/d', "Rft", 416,"International Industries Ltd."),
(24,'Gas Cock 3/4" i/d', "Unit", 1335,"Electrobes"),
(25,"Booster Pump 0.75 HP", "Unit", 150800,"TOTAL"),
(26,"Water Transfer Pump 1HP", "Unit", "140400","ESPA"),
(27,"Floor Drains", "Unit", 1695,"LapTab"),
(28,'1" Dia class "E"',"Unit (4 fts)",110,"Local"),
(29,'Four core 16 mm Sq. PVC insulated conductor cable', "rft", 42,"Fiaz Electricals"),
(30,'Cat 5 for Telephone Cable', "Rft", 376,"AdJungle"),
(31,'TV Coaxial Cable for TV cable',"Rft",357,"Fuody");


SELECT * FROM GREY_MATERIALS;

-- --------------------------------------

CREATE TABLE FOUNDATION_1
(
FOUNDATION_ID INT PRIMARY KEY auto_increment,
GREY_ID INT,
3_QTY INT,
5_QTY INT,
7_QTY INT,
10_QTY INT,
20_QTY INT,
40_QTY INT,
FOREIGN KEY (GREY_ID) REFERENCES grey_materials(material_id)
);


 SELECT * FROM FOUNDATION_1;
 
 INSERT INTO FOUNDATION_1 VALUES
(1,1,20254, 33757, 44643, 58535,118273,236545),
(2,2,217, 363,480,629,1272,2543);
 
 INSERT INTO FOUNDATION_1 VALUES
(3, 3,1089,1815,2400,3147,6358,12717),
(4,4,619,1032,1365,1721,3213,6426),
(5, 5,52,87,115,145,272,544),
(6, 6, 2, 3,4,5,9,18),
(7, 7,52,87,115,145,272,544),
(8, 8, 1330,2217,2932,3695,6898,13797),
(9, 9, 1.5,2,2.5,3,6,12);



-- -------------------------
CREATE TABLE FOUNDATION_2
(
FOUNDATION_ID INT PRIMARY KEY auto_increment,
GREY_ID INT,
3_QTY INT,
5_QTY INT,
7_QTY INT,
10_QTY INT,
20_QTY INT,
40_QTY INT,
FOREIGN KEY (GREY_ID) REFERENCES grey_materials(material_id)

);



 SELECT * FROM FOUNDATION_2;
 
 INSERT INTO FOUNDATION_2 VALUES
(1,1,20269, 33761, 44682, 58555,118291,236587),
(2,2,219, 361,482,630,1274,2545);
 
 INSERT INTO FOUNDATION_2 VALUES
(3, 3,1094,1815,2400,3150,6358,12717),
(4,4,620,1032,1375,1721,3299,6430),
(5, 5,52,87,115,145,272,544),
(6, 6, 2, 3,4,5,9,18),
(7, 7,52,87,115,145,272,544),
(8, 8, 1330,2217,2932,3695,6898,13797),
(9, 9, 1.7,2,2.5,3,6,12);

-- -------------------------

CREATE TABLE FOUNDATION_3
(
FOUNDATION_ID INT PRIMARY KEY auto_increment,
GREY_ID INT,
3_QTY INT,
5_QTY INT,
7_QTY INT,
10_QTY INT,
20_QTY INT,
40_QTY INT,
FOREIGN KEY (GREY_ID) REFERENCES grey_materials(material_id)

);



 SELECT * FROM FOUNDATION_3;
 
 INSERT INTO FOUNDATION_3 VALUES
(1,1,20265, 33751, 44652, 58565,118281,236527),
(2,2,215, 351,480,630,1274,2543);
 
 INSERT INTO FOUNDATION_3 VALUES
(3, 3,1094,1815,2395,3150,6358,12717),
(4,4,620,1032,1373,1721,3299,6430),
(5, 5,50,87,115,140,270,544),
(6, 6, 2, 3,4,5,9,18),
(7, 7,52,87,115,145,272,544),
(8, 8, 1330,2217,2932,3695,6898,13797),
(9, 9, 1.5,2,2.5,3,6,12);

-- -------------------------


CREATE TABLE FOUNDATION_4
(
FOUNDATION_ID INT PRIMARY KEY auto_increment,
GREY_ID INT,
3_QTY INT,
5_QTY INT,
7_QTY INT,
10_QTY INT,
20_QTY INT,
40_QTY INT,
FOREIGN KEY (GREY_ID) REFERENCES grey_materials(material_id)

);



 SELECT * FROM FOUNDATION_4;
 
 INSERT INTO FOUNDATION_4 VALUES
(1,1,20275, 33791, 44692, 58597,118293,236545),
(2,2,225, 341,490,660,1276,2563);
 
 INSERT INTO FOUNDATION_4 VALUES
(3, 3,1104,1885,2295,3190,6388,12747),
(4,4,640,1092,1393,1781,3310,6490),
(5, 5,50,87,115,140,270,544),
(6, 6, 2, 3,4,5,9,18),
(7, 7,52,87,115,145,272,544),
(8, 8, 1330,2217,2932,3695,6898,13797),
(9, 9, 1.7,2,2.5,3,6,12);

-- -------------------------


CREATE TABLE COLD_HOT_WATER
(
COLD_HOT_WATER_ID INT PRIMARY KEY auto_increment,
GREY_ID INT,
3_QTY INT,
5_QTY INT,
7_QTY INT,
10_QTY INT,
20_QTY INT,
40_QTY INT,
foreign key(GREY_ID) references grey_materials(MATERIAL_ID)
);

INSERT INTO COLD_HOT_WATER
VALUES
(1,10,73,121,160,202,378,756),
(2,11,29,48,64,81,151,302),
(3,12,7,12,16,20,37,75),
(4,13, 9,15,19,25,47,94);


SELECT * FROM COLD_HOT_WATER;


 CREATE TABLE INSULATION
(
INSULATION_ID INT PRIMARY KEY auto_increment,
GREY_ID INT,
3_QTY INT,
5_QTY INT,
7_QTY INT,
10_QTY INT,
20_QTY INT,
40_QTY INT,
foreign key(GREY_ID) references grey_materials(MATERIAL_ID)
);

INSERT INTO INSULATION VALUES
(1,14,14,24,32,41,75,151),
(2,15,9,15,20,25,47,94);


SELECT * FROM INSULATION;

CREATE TABLE DRAINAGE
(
DRAINAGE_ID INT PRIMARY KEY auto_increment,
GREY_ID INT,
3_QTY INT,
5_QTY INT,
7_QTY INT,
10_QTY INT,
20_QTY INT,
40_QTY INT,
foreign key(GREY_ID) references grey_materials(MATERIAL_ID)

);


SELECT * FROM DRAINAGE;

INSERT INTO DRAINAGE VALUES
(1,16 ,29,48,64,81,151,302),
(2,17, 29,48,64,81,151,302),
(3,18,43,73,96,121,226,453);


CREATE TABLE GAS_PIPING
(
GAS_PIPING_ID INT PRIMARY KEY auto_increment,
GREY_ID INT,
3_QTY INT,
5_QTY INT,
7_QTY INT,
10_QTY INT,
20_QTY INT,
40_QTY INT,
foreign key(GREY_ID) references grey_materials(MATERIAL_ID)

);



INSERT INTO GAS_PIPING VALUES
(1,19,54,91,120,151,283,567),
(2,20, 1,1,2,2,4,8);



SELECT * FROM GAS_PIPING;


CREATE TABLE PUMPS_DRAIN
(
GAS_PIPING_ID INT PRIMARY KEY auto_increment,
GREY_ID INT,
3_QTY INT,
5_QTY INT,
7_QTY INT,
10_QTY INT,
20_QTY INT,
40_QTY INT,
foreign key(GREY_ID) references grey_materials(MATERIAL_ID)

);

INSERT INTO PUMPS_DRAIN VALUES
(1,21,1,1,1,1,1,1),
(2,22,1,1,1,1,1,1),
(3,23,4,5,8,12,13,26);

SELECT * FROM PUMPS_DRAIN;

CREATE TABLE AC_DRAINAGE
(
AC_DRAINAGE_ID INT PRIMARY KEY auto_increment,
GREY_ID INT,
3_QTY INT,
5_QTY INT,
7_QTY INT,
10_QTY INT,
20_QTY INT,
40_QTY INT,
foreign key(GREY_ID) references grey_materials(MATERIAL_ID)

);


INSERT INTO AC_DRAINAGE VALUES
(1,24,49,82,108,136,255,510);


select * from ac_drainage;


CREATE TABLE SEWERAGE
(
SEWERAGE_ID INT PRIMARY KEY auto_increment,
GREY_ID INT,
3_QTY INT,
5_QTY INT,
7_QTY INT,
10_QTY INT,
20_QTY INT,
40_QTY INT,
foreign key(GREY_ID) references grey_materials(MATERIAL_ID)

);

INSERT INTO SEWERAGE VALUES
(1,25,18,30,40,50,94,189);

select * from sewerage;


 CREATE TABLE WIRES_CABLES
(
WIRES_CABLES_ID INT PRIMARY KEY auto_increment,
GREY_ID INT,
3_QTY INT,
5_QTY INT,
7_QTY INT,
10_QTY INT,
20_QTY INT,
40_QTY INT,
foreign key(GREY_ID) references grey_materials(MATERIAL_ID)

);


INSERT INTO WIRES_CABLES VALUES
(1,26, 3,6,8,12,24,	48),
(2,27,3,6,8,12,24,48),
(3,28 ,1,3,4,6,12,24),
(4,29,42,42,42,42,42,42 ),
(5,30,18,30,40,50,94,189),
(6,31,54,91,120,151,283,567);

SELECT * FROM WIRES_CABLES;

-- ----------------------------

							-- BASEMENT TABLES
                            
CREATE TABLE BASEMENTS
(
BASEMENTS_ID INT PRIMARY KEY AUTO_INCREMENT,
MATERIAL VARCHAR(40),
FACTOR VARCHAR(10),
RATE INT ,
3_QTY INT,
5_QTY INT,
7_QTY INT,
10_QTY INT,
20_QTY INT

);

SELECT * FROM BASEMENTS;


INSERT INTO BASEMENTS (MATERIAL,FACTOR,RATE,3_QTY,5_QTY,7_QTY,10_QTY,20_QTY)
VALUES
("CONCRETE BRICKS","UNIT",55,3420,4622,4977,5414,8200),
("Rorhi", "Cubic feet", 95,9600, 13000, 14000, 15200, 23000),
("Cement", "Bag", 1100,217, 363,480,629,1272),
( "Sand", "cft",87,1089,1815,2400,3147,6358),
("Crush", "cft",175,619,1032,1365,1721,3213),
( "Roof Insulation", "sqft", 249,52,87,115,145,272),
( "Termite Proofing", "litre", 1700, 2, 3,4,5,9),
( "Water Proofing", "sqft", 114,52,87,115,145,272),
( "Excavation & Backfill + Ghassu", "cft", 25, 1330,2217,2932,3695,6898),
( "Steel Re-Enforcement", "tonne",265000, 1.5,2,2.5,3,6);

select * from basements;







 