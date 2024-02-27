USE db_bsc;
DROP TABLE IF EXISTS USER_DATA;
DROP TABLE IF EXISTS USERS;

-- set foreign_key_checks=0;

CREATE TABLE USERS
(
USER_ID int PRIMARY KEY auto_increment NOT NULL,	
USERNAME VARCHAR(100) NOT NULL,
EMAIL_ADDRESS VARCHAR(250) NOT NULL,
PASSWORD VARCHAR(100) NOT NULL, 
SECRET_ANSWER VARCHAR(250) NOT NULL,  
IS_PREMIUM_USER CHAR(1) DEFAULT 'N'NOT NULL,--
ROLE VARCHAR(40) DEFAULT "USER" NOT NULL,--
IS_ACTIVE CHAR(1)  DEFAULT 'Y'NOT NULL
);


-- INSERT INTO USERS (username,email_address,password,secret_answer,role)values
-- (
-- "admin1","admin1@gmail.com","admin123","Pakistan","Admin"
-- );

-- update users set role="Admin" where username="admin2"; 
SELECT * FROM USERS;
select username, email_address, IS_PREMIUM_USER from users where role="USER";
delete from users where email_address="adeenashraf@gmail.com";
delete from users where email_address="aforashraf@gmail.com";
DROP TABLE IF EXISTS FEEDBACKS;



CREATE TABLE FEEDBACKS
(
FEEDBACK_ID INT PRIMARY KEY auto_increment,
DETAIL VARCHAR(200),
DATE_TIME TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
ACTION VARCHAR(40) DEFAULT NULL,
USER_ID_FK INT,
FOREIGN KEY (USER_ID_FK) REFERENCES USERS(USER_ID)
);
-- ---------
INSERT INTO FEEDBACKS (DETAIL,ACTION,USER_ID_FK) VALUES 
("Inserted Feedback","Pending",1);
UPDATE feedbacks
SET action = 'Pending'
WHERE action IS NULL;
-- ---------------- 
select * from feedbacks;  
SELECT users.USERNAME, users.EMAIL_ADDRESS, feedbacks.FEEDBACK_ID,feedbacks.detail, feedbacks.date_time, feedbacks.Action
FROM users
INNER JOIN feedbacks ON users.USER_ID = feedbacks.USER_ID_FK order by feedbacks.DATE_TIME desc;




---------------------------------

create table user_data
(
USERNAME VARCHAR(40) PRIMARY KEY,
USER_PASS VARCHAR(60),
EMAIL_ID VARCHAR(40),
SECRET VARCHAR(25)
);

ALTER TABLE USER_DATA 
ADD COLUMN FEEDBACK VARCHAR (200) DEFAULT NULL,
ADD COLUMN PRODUCT INT DEFAULT 0;

-- drop table user_data;

insert into user_data values
(1,"dummy","user123","dummy@133.com","Lahore");

delete from user_data where user_id=3;

insert into user_data (username,user_pass,email_id,secret) values
("ad","123","admin@gmail.com","mall");

SELECT * FROM USER_DATA;


-- update user_data set user_pass = "87654321" where username = "Adeen12";

SELECT * from user_data; 


SELECT * FROM USER_DATA WHERE USERNAME='AD' AND USER_PASS = '12345678';
-- ALTER TABLE user_data MODIFY USER_PASS VARCHAR(60);
update user_data set user_pass = "abcd98765"; 

-- 08350107107936-59


-- Creating Layout Tables
DROP TABLE IF EXISTS LAYOUT_3;
DROP TABLE IF EXISTS LAYOUT_5;
CREATE TABLE layout_3
(
    ID INT AUTO_INCREMENT PRIMARY KEY,
    ground_floor LONGBLOB,
    first_floor LONGBLOB,
    rooftop LONGBLOB,
    basement LONGBLOB
);

INSERT INTO layout_3(ground_floor, first_floor, rooftop, basement)VALUES
(
LOAD_FILE('E:/SQL uploads/3_1A.png'),
LOAD_FILE('E:/SQL uploads/3_1B.png'),
LOAD_FILE('E:/SQL uploads/3_1C.png'),
LOAD_FILE('E:/SQL uploads/3_1D_ROOM.png')
);

INSERT INTO layout_3(ground_floor, first_floor, rooftop, basement)VALUES
(
LOAD_FILE('E:/SQL uploads/3_2A.png'),
LOAD_FILE('E:/SQL uploads/3_2B.png'),
LOAD_FILE('E:/SQL uploads/3_2C.png'),
LOAD_FILE('E:/SQL uploads/3_2D_PLAIN.png')
);

INSERT INTO layout_3(ground_floor, first_floor, rooftop, basement)VALUES
(
LOAD_FILE('E:/SQL uploads/3_3A.png'),
LOAD_FILE('E:/SQL uploads/3_3B.png'),
LOAD_FILE('E:/SQL uploads/3_3C.png'),
NULL
);

INSERT INTO layout_3(ground_floor, first_floor, rooftop, basement)VALUES
(
LOAD_FILE('E:/SQL uploads/3_4A.png'),
LOAD_FILE('E:/SQL uploads/3_4B.png'),
LOAD_FILE('E:/SQL uploads/3_4C.png'),
NULL
);

INSERT INTO layout_3(ground_floor, first_floor, rooftop, basement)VALUES
(
LOAD_FILE('E:/SQL uploads/3_5A.png'),
LOAD_FILE('E:/SQL uploads/3_5B.png'),
LOAD_FILE('E:/SQL uploads/3_5C.png'),
LOAD_FILE('E:/SQL uploads/3_5D_ROOM.png')

);

INSERT INTO layout_3(ground_floor, first_floor, rooftop, basement)VALUES
(
LOAD_FILE('E:/SQL uploads/3_6A.png'),
LOAD_FILE('E:/SQL uploads/3_6B.png'),
LOAD_FILE('E:/SQL uploads/3_6C.png'),
LOAD_FILE('E:/SQL uploads/3_6D_PLAIN.png')

);

INSERT INTO layout_3(ground_floor, first_floor, rooftop, basement)VALUES
(
LOAD_FILE('E:/SQL uploads/3_7A.png'),
LOAD_FILE('E:/SQL uploads/3_7B.png'),
LOAD_FILE('E:/SQL uploads/3_7C.png'),
NULL
);

INSERT INTO layout_3(ground_floor, first_floor, rooftop, basement)VALUES
(
LOAD_FILE('E:/SQL uploads/3_8A.png'),
LOAD_FILE('E:/SQL uploads/3_8B.png'),
LOAD_FILE('E:/SQL uploads/3_8C.png'),
NULL
);

SELECT * FROM LAYOUT_3;

-- --------------------------------------------
-- Layout 5 Marla

CREATE TABLE layout_5
(
    ID INT AUTO_INCREMENT PRIMARY KEY,
    ground_floor LONGBLOB,
    first_floor LONGBLOB,
    rooftop LONGBLOB,
    basement LONGBLOB
);

INSERT INTO layout_5(ground_floor, first_floor, rooftop, basement)VALUES
(
LOAD_FILE('E:/SQL uploads/5_1A.png'),
LOAD_FILE('E:/SQL uploads/5_1B.png'),
LOAD_FILE('E:/SQL uploads/5_1C.png'),
LOAD_FILE('E:/SQL uploads/5_1D_PLAIN.png')
);


INSERT INTO layout_5(ground_floor, first_floor, rooftop, basement)VALUES
(
LOAD_FILE('E:/SQL uploads/5_2A.png'),
LOAD_FILE('E:/SQL uploads/5_2B.png'),
LOAD_FILE('E:/SQL uploads/5_2C.png'),
LOAD_FILE('E:/SQL uploads/5_2D_ROOM.png')
);

INSERT INTO layout_5(ground_floor, first_floor, rooftop, basement)VALUES
(
LOAD_FILE('E:/SQL uploads/5_3A.png'),
LOAD_FILE('E:/SQL uploads/5_3B.png'),
LOAD_FILE('E:/SQL uploads/5_3C.png'),
NULL
);

INSERT INTO layout_5(ground_floor, first_floor, rooftop, basement)VALUES
(
LOAD_FILE('E:/SQL uploads/5_4A.png'),
LOAD_FILE('E:/SQL uploads/5_4B.png'),
LOAD_FILE('E:/SQL uploads/5_4C.png'),
NULL
);

INSERT INTO layout_5(ground_floor, first_floor, rooftop, basement)VALUES
(
LOAD_FILE('E:/SQL uploads/5_5A.png'),
LOAD_FILE('E:/SQL uploads/5_5B.png'),
LOAD_FILE('E:/SQL uploads/5_5C.png'),
LOAD_FILE('E:/SQL uploads/5_5D_PLAIN.png')

);


INSERT INTO layout_5(ground_floor, first_floor, rooftop, basement)VALUES
(
LOAD_FILE('E:/SQL uploads/5_6A.png'),
LOAD_FILE('E:/SQL uploads/5_6B.png'),
LOAD_FILE('E:/SQL uploads/5_6C.png'),
LOAD_FILE('E:/SQL uploads/5_6D_ROOM.png')

);

INSERT INTO layout_5(ground_floor, first_floor, rooftop, basement)VALUES
(
LOAD_FILE('E:/SQL uploads/5_7A.png'),
LOAD_FILE('E:/SQL uploads/5_7B.png'),
LOAD_FILE('E:/SQL uploads/5_7C.png'),
NULL
);

INSERT INTO layout_5(ground_floor, first_floor, rooftop, basement)VALUES
(
LOAD_FILE('E:/SQL uploads/5_8A.png'),
LOAD_FILE('E:/SQL uploads/5_8B.png'),
LOAD_FILE('E:/SQL uploads/5_8C.png'),
NULL
);

SELECT * FROM LAYOUT_5;

-- ---------------------------------
-- LAYOUT 7



CREATE TABLE layout_7
(
    ID INT AUTO_INCREMENT PRIMARY KEY,
    ground_floor LONGBLOB,
    first_floor LONGBLOB,
    rooftop LONGBLOB,
    basement LONGBLOB
);

INSERT INTO layout_7(ground_floor, first_floor, rooftop, basement)VALUES
(
LOAD_FILE('E:/SQL uploads/7_1A.png'),
LOAD_FILE('E:/SQL uploads/7_1B.png'),
LOAD_FILE('E:/SQL uploads/7_1C.png'),
LOAD_FILE('E:/SQL uploads/7_1D_PLAIN.png')
);


INSERT INTO layout_7(ground_floor, first_floor, rooftop, basement)VALUES
(
LOAD_FILE('E:/SQL uploads/7_2A.png'),
LOAD_FILE('E:/SQL uploads/7_2B.png'),
LOAD_FILE('E:/SQL uploads/7_2C.png'),
LOAD_FILE('E:/SQL uploads/7_2D_ROOM.png')
);

INSERT INTO layout_7(ground_floor, first_floor, rooftop, basement)VALUES
(
LOAD_FILE('E:/SQL uploads/7_3A.png'),
LOAD_FILE('E:/SQL uploads/7_3B.png'),
LOAD_FILE('E:/SQL uploads/7_3C.png'),
NULL
);

INSERT INTO layout_7(ground_floor, first_floor, rooftop, basement)VALUES
(
LOAD_FILE('E:/SQL uploads/7_4A.png'),
LOAD_FILE('E:/SQL uploads/7_4B.png'),
LOAD_FILE('E:/SQL uploads/7_4C.png'),
NULL
);

INSERT INTO layout_7(ground_floor, first_floor, rooftop, basement)VALUES
(
LOAD_FILE('E:/SQL uploads/7_5A.png'),
LOAD_FILE('E:/SQL uploads/7_5B.png'),
LOAD_FILE('E:/SQL uploads/7_5C.png'),
LOAD_FILE('E:/SQL uploads/7_5D_PLAIN.png')

);


INSERT INTO layout_7(ground_floor, first_floor, rooftop, basement)VALUES
(
LOAD_FILE('E:/SQL uploads/7_6A.png'),
LOAD_FILE('E:/SQL uploads/7_6B.png'),
LOAD_FILE('E:/SQL uploads/7_6C.png'),
LOAD_FILE('E:/SQL uploads/7_6D_ROOM.png')

);

INSERT INTO layout_7(ground_floor, first_floor, rooftop, basement)VALUES
(
LOAD_FILE('E:/SQL uploads/7_7A.png'),
LOAD_FILE('E:/SQL uploads/7_7B.png'),
LOAD_FILE('E:/SQL uploads/7_7C.png'),
NULL
);

INSERT INTO layout_7(ground_floor, first_floor, rooftop, basement)VALUES
(
LOAD_FILE('E:/SQL uploads/7_8A.png'),
LOAD_FILE('E:/SQL uploads/7_8B.png'),
LOAD_FILE('E:/SQL uploads/7_8C.png'),
NULL
);

SELECT * FROM LAYOUT_7;

	select * from user_data;

-- ----------------------------------

-- LAYOUTS 10

CREATE TABLE layout_10
(
    ID INT AUTO_INCREMENT PRIMARY KEY,
    ground_floor LONGBLOB,
    first_floor LONGBLOB,
    rooftop LONGBLOB,
    basement LONGBLOB
);

INSERT INTO layout_10(ground_floor, first_floor, rooftop, basement)VALUES
(
LOAD_FILE('E:/SQL uploads/10_1A.png'),
LOAD_FILE('E:/SQL uploads/10_1B.png'),
LOAD_FILE('E:/SQL uploads/10_1C.png'),
LOAD_FILE('E:/SQL uploads/10_1D_PLAIN.png')
);


INSERT INTO layout_10(ground_floor, first_floor, rooftop, basement)VALUES
(
LOAD_FILE('E:/SQL uploads/10_2A.png'),
LOAD_FILE('E:/SQL uploads/10_2B.png'),
LOAD_FILE('E:/SQL uploads/10_2C.png'),
LOAD_FILE('E:/SQL uploads/10_2D_ROOM.png')
);

INSERT INTO layout_10(ground_floor, first_floor, rooftop, basement)VALUES
(
LOAD_FILE('E:/SQL uploads/10_3A.png'),
LOAD_FILE('E:/SQL uploads/10_3B.png'),
LOAD_FILE('E:/SQL uploads/10_3C.png'),
NULL
);

INSERT INTO layout_10(ground_floor, first_floor, rooftop, basement)VALUES
(
LOAD_FILE('E:/SQL uploads/10_4A.png'),
LOAD_FILE('E:/SQL uploads/10_4B.png'),
LOAD_FILE('E:/SQL uploads/10_4C.png'),
NULL
);

INSERT INTO layout_10(ground_floor, first_floor, rooftop, basement)VALUES
(
LOAD_FILE('E:/SQL uploads/10_5A.png'),
LOAD_FILE('E:/SQL uploads/10_5B.png'),
LOAD_FILE('E:/SQL uploads/10_5C.png'),
LOAD_FILE('E:/SQL uploads/10_5D_PLAIN.png')

);


INSERT INTO layout_10(ground_floor, first_floor, rooftop, basement)VALUES
(
LOAD_FILE('E:/SQL uploads/10_6A.png'),
LOAD_FILE('E:/SQL uploads/10_6B.png'),
LOAD_FILE('E:/SQL uploads/10_6C.png'),
LOAD_FILE('E:/SQL uploads/10_6D_ROOM.png')

);

INSERT INTO layout_10(ground_floor, first_floor, rooftop, basement)VALUES
(
LOAD_FILE('E:/SQL uploads/10_7A.png'),
LOAD_FILE('E:/SQL uploads/10_7B.png'),
LOAD_FILE('E:/SQL uploads/10_7C.png'),
NULL
);

INSERT INTO layout_10(ground_floor, first_floor, rooftop, basement)VALUES
(
LOAD_FILE('E:/SQL uploads/10_8A.png'),
LOAD_FILE('E:/SQL uploads/10_8B.png'),
LOAD_FILE('E:/SQL uploads/10_8C.png'),
NULL
);

SELECT * FROM LAYOUT_10;

-- -------------------------------------

-- LAYOUT 20

CREATE TABLE layout_20
(
    ID INT AUTO_INCREMENT PRIMARY KEY,
    ground_floor LONGBLOB,
    first_floor LONGBLOB,
    rooftop LONGBLOB,
    basement LONGBLOB
);

INSERT INTO layout_20(ground_floor, first_floor, rooftop, basement)VALUES
(
LOAD_FILE('E:/SQL uploads/20_1A.png'),
LOAD_FILE('E:/SQL uploads/20_1B.png'),
LOAD_FILE('E:/SQL uploads/20_1C.png'),
LOAD_FILE('E:/SQL uploads/20_1D_PLAIN.png')
);


INSERT INTO layout_20(ground_floor, first_floor, rooftop, basement)VALUES
(
LOAD_FILE('E:/SQL uploads/20_2A.png'),
LOAD_FILE('E:/SQL uploads/20_2B.png'),
LOAD_FILE('E:/SQL uploads/20_2C.png'),
LOAD_FILE('E:/SQL uploads/20_2D_ROOM.png')
);

INSERT INTO layout_20(ground_floor, first_floor, rooftop, basement)VALUES
(
LOAD_FILE('E:/SQL uploads/20_3A.png'),
LOAD_FILE('E:/SQL uploads/20_3B.png'),
LOAD_FILE('E:/SQL uploads/20_3C.png'),
NULL
);

INSERT INTO layout_20(ground_floor, first_floor, rooftop, basement)VALUES
(
LOAD_FILE('E:/SQL uploads/20_4A.png'),
LOAD_FILE('E:/SQL uploads/20_4B.png'),
LOAD_FILE('E:/SQL uploads/20_4C.png'),
NULL
);

INSERT INTO layout_20(ground_floor, first_floor, rooftop, basement)VALUES
(
LOAD_FILE('E:/SQL uploads/20_5A.png'),
LOAD_FILE('E:/SQL uploads/20_5B.png'),
LOAD_FILE('E:/SQL uploads/20_5C.png'),
LOAD_FILE('E:/SQL uploads/20_5D_PLAIN.png')

);


INSERT INTO layout_20(ground_floor, first_floor, rooftop, basement)VALUES
(
LOAD_FILE('E:/SQL uploads/20_6A.png'),
LOAD_FILE('E:/SQL uploads/20_6B.png'),
LOAD_FILE('E:/SQL uploads/20_6C.png'),
LOAD_FILE('E:/SQL uploads/20_6D_ROOM.png')

);

INSERT INTO layout_20(ground_floor, first_floor, rooftop, basement)VALUES
(
LOAD_FILE('E:/SQL uploads/20_7A.png'),
LOAD_FILE('E:/SQL uploads/20_7B.png'),
LOAD_FILE('E:/SQL uploads/20_7C.png'),
NULL
);

INSERT INTO layout_20(ground_floor, first_floor, rooftop, basement)VALUES
(
LOAD_FILE('E:/SQL uploads/20_8A.png'),
LOAD_FILE('E:/SQL uploads/20_8B.png'),
LOAD_FILE('E:/SQL uploads/20_8C.png'),
NULL
);

SELECT * FROM LAYOUT_20;


-- SELECT user, host, plugin FROM mysql.user WHERE user = 'root';
-- select Host,User,plugin from mysql.user;






-- ---------------------------------
CREATE TABLE images (
    id INT AUTO_INCREMENT PRIMARY KEY,
    image_data LONGBLOB
);
INSERT INTO images(image_data)
Values
(LOAD_FILE('E:/SQL uploads/3_3A.png')),
(LOAD_FILE('E:/SQL uploads/3_3B.png')),
(LOAD_FILE('E:/SQL uploads/3_3C.png'));

select * from images;



SHOW VARIABLES LIKE 'max_connections';

SELECT UUID();


