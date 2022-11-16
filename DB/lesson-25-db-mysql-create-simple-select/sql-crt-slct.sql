-- docker-compose up -d
-- docker exec -it mysql_db bash
-- mysql -uroot -p

CREATE USER 'admin'@'localhost' IDENTIFIED BY '111111';

SELECT
    User,
    Host
FROM
    mysql.user;
    
CREATE DATABASE myDB1;

GRANT ALL ON myDB1.* TO 'admin'@'localhost';

SELECT
    *
FROM
    information_schema.user_privileges;

USE myDB1;

-- mysql -uadmin -p

CREATE TABLE table1 (
        id INT UNSIGNED AUTO_INCREMENT,
        Username VARCHAR(32) NOT NULL,
        Pass VARCHAR(32) NOT NULL,
        email VARCHAR(64) NOT NULL,
        PRIMARY KEY (id),
        CONSTRAINT UC_Person UNIQUE (email)
    );

INSERT INTO
    table1 (Username, Pass, email)
VALUES
    ('Barmaley', '123456', 'Barmaley@ya.ru'),
    ('Doc', 'sgfdf7#@3', 'Livsi@gmail.com'),
    ('Bengan', 'HL&^54(3~', 'Bengan39@mail.ru'),
    ('Lensky', 'dflPOQ73$', 'teepot@gmail.com'),
    ('Glavryba', 'coolpwd', 'morefish@mail.ru'),
    ('Branch', 'hf!&fMdkk2', 'pupy@porta.ru');
    
CREATE TABLE table2 (
        id INT UNSIGNED AUTO_INCREMENT,
        Name VARCHAR(32) NOT NULL,
        Surname VARCHAR(32) NOT NULL,
        email VARCHAR(64) NOT NULL,
        Age INT(64) NOT NULL,
        PRIMARY KEY (id),
        CONSTRAINT UC_Person UNIQUE (email)
    );

INSERT INTO
    table2 (Name, Surname, email, Age)
VALUES
    ('Ivan', 'Ivanov', 'Barmaley@ya.ru', '32'),
    ('Robert', 'Stevenson', 'Livsi@gmail.com', '25'),
    ('Vlad', 'Petrov', 'Bengan39@mail.ru', '25'),
    ('Sergey', 'Vinokur', 'teepot@gmail.com', '42'),
    ('Aleksandr', 'Sidorov', 'morefish@mail.ru', '54'),
    ('Veniamin', 'Krasnov', 'pupy@porta.ru', '32');
    
SHOW TABLES;

SELECT *
FROM table1;
 
SELECT *
FROM table2;
    
SELECT *
FROM table1 t1
ORDER BY Username;

SELECT t1.Username,
       t2.Age
FROM 
   table2 t2 INNER JOIN table1 t1 
                ON t2.email = t1.email
ORDER BY t2.Age;

SELECT
    t2.Name, t2.Surname, t2.Age,
    t1.*
FROM
    table2 t2 INNER JOIN table1 t1 
                ON t1.email = t2.email
ORDER BY t2.Age desc, t2.Surname desc, t2.Name asc;