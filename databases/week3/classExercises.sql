-- Active: 1744549481786@@127.0.0.1@3306@meal_sharing
--Part 2: School database
--Create a new database containing the following tables:
--Class: with the columns: id, name, begins (date), ends (date)
--Student: with the columns: id, name, email, phone, class_id (foreign key)
CREATE DATABASE SCHOOLDB;
USE SCHOOLDB;
CREATE TABLE CLASS (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    NAME VARCHAR(100) NOT NULL,
    BEGINS DATE NOT NULL,
    ENDS DATE NOT NULL);
SELECT * FROM class;

CREATE TABLE STUDENT (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    NAME VARCHAR(100) NOT NULL,
    EMAIL VARCHAR(100),
    PHONE VARCHAR(20),
    CLASS_ID INT,
    FOREIGN KEY (CLASS_ID) REFERENCES CLASS(ID)
);
SELECT * FROM student;
--Create an index on the name column of the student table.
CREATE INDEX IDX_STUDENT_NAME ON STUDENT(NAME);
SHOW INDEX FROM student;
--Add a new column to the class table named status which can only have the following values: not-started, ongoing, finished (hint: enumerations).
ALTER TABLE CLASS 
ADD STATUS ENUM('NOT-STARTED','ONGOING','FINISHED') DEFAULT 'NOT-STARTED';
SHOW DATABASES;
--Part 3: More queries
CREATE DATABASE hyf_lesson2;
USE HYF_LESSON2;
SHOW TABLES;
SELECT * FROM USER;
SELECT TABLE_NAME, TABLE_SCHEMA
FROM information_schema.tables
WHERE TABLE_NAME IN ('Class', 'Student');
USE hyf_lesson1;
DROP TABLE IF EXISTS Student;
DROP TABLE IF EXISTS Class;
USE schooldb;
USE hyf_lesson1;
show tables;
select * from user;
drop table user;
SHOW DATABASES;
USE hyf_lesson2;
SET NAMES utf8mb4;

CREATE TABLE `user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `status` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `task` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `title` varchar(255) NOT NULL,
  `description` text NULL DEFAULT NULL,
  `created` DATETIME NOT NULL,
  `updated` DATETIME NOT NULL,
  `due_date` DATETIME NULL DEFAULT NULL,
  `status_id` int(10) unsigned NOT NULL,
  CONSTRAINT `fk_status` FOREIGN KEY (`status_id`) REFERENCES `status` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE `user_task` (
  `user_id` int(10) unsigned NOT NULL,
  `task_id` int(10) unsigned NOT NULL,
  PRIMARY KEY(`user_id`, `task_id`),
  CONSTRAINT `fk_user_task_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_user_task_task` FOREIGN KEY (`task_id`) REFERENCES `task` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



-- Users
insert into user (id, name, email, phone) values (1, 'Aarika Ellingworth', 'aellingworth0@harvard.edu', '483-396-8795');
insert into user (id, name, email, phone) values (2, 'Pren Goldsworthy', 'pgoldsworthy1@spotify.com', '635-572-8467');
insert into user (id, name, email, phone) values (3, 'Pablo Kisbee', 'pkisbee2@lulu.com', '790-962-8683');
insert into user (id, name, email, phone) values (4, 'Rodie Duncan', 'rduncan3@quantcast.com', '646-743-6191');
insert into user (id, name, email, phone) values (5, 'Aubry Polak', 'apolak4@indiatimes.com', '302-678-7931');
insert into user (id, name, email, phone) values (6, 'Maryrose Meadows', 'mmeadows5@comcast.net', '251-524-6594');
insert into user (id, name, email, phone) values (7, 'Pavel Brushneen', 'pbrushneen6@techcrunch.com', '316-170-3640');
insert into user (id, name, email, phone) values (8, 'Hedy Gerault', 'hgerault7@nymag.com', '176-177-5579');
insert into user (id, name, email, phone) values (9, '王秀英', 'wang.xiuying@weebly.com', '891-952-6749');
insert into user (id, name, email, phone) values (10, 'إلياس', 'elias@github.com', '202-517-6983');
insert into user (id, name, email, phone) values (11, 'Donald Duck', 'donald@duck.com', NULL);

-- Statuses
insert into status (id, name) values (1, 'Not started');
insert into status (id, name) values (2, 'In progress');
insert into status (id, name) values (3, 'Done');


-- Tasks
insert into task (id, title, description, created, updated, due_date, status_id) values (1, 'Wash clothes', 'Title says it all.', '2017-10-25 06:54:16', '2017-10-15 13:05:09', null, 2);
insert into task (id, title, description, created, updated, due_date, status_id) values (2, 'Become a billionaire', 'This should not take long, just invent a time machine, travel back to 2010 and buy bitcoin', '2017-09-26 03:06:46', '2017-10-08 06:14:31', '2017-12-22 20:58:03', 3);
insert into task (id, title, description, created, updated, due_date, status_id) values (3, 'Plan meeting with London office', 'We will probably use skype', '2017-10-04 18:07:37', '2017-10-14 16:01:31', '2017-12-05 19:42:15', 2);
insert into task (id, title, description, created, updated, due_date, status_id) values (4, 'Order groceries online', 'The fridge is almost empty, we need eggs and milk', '2017-09-20 19:34:43', '2017-10-15 23:35:45', '2017-12-24 16:00:46', 1);
insert into task (id, title, description, created, updated, due_date, status_id) values (5, 'Empty the mailbox', NULL, '2017-09-27 15:17:08', '2017-10-08 17:31:16', null, 2);
insert into task (id, title, description, created, updated, due_date, status_id) values (6, 'Fix the flat tire on the bike', 'Tools are in the garage', '2017-09-13 23:16:30', '2017-10-06 04:03:52', '2017-12-07 11:51:11', 2);
insert into task (id, title, description, created, updated, due_date, status_id) values (7, 'Wash the car', NULL, '2017-10-06 19:39:16', '2017-10-03 04:49:05', '2017-12-04 17:43:16', 2);
insert into task (id, title, description, created, updated, due_date, status_id) values (8, 'Walk the dog', NULL, '2017-09-03 02:47:17', '2017-10-12 18:40:08', null, 3);
insert into task (id, title, description, created, updated, due_date, status_id) values (9, 'Write a book', 'Maybe something about dragons?', '2017-10-11 06:14:01', '2017-10-17 12:19:08', '2017-12-21 20:18:05', 2);
insert into task (id, title, description, created, updated, due_date, status_id) values (10, 'Do HackYourFuture homework', NULL, '2017-10-04 13:55:16', '2017-10-10 00:18:05', '2017-12-19 17:01:10', 1);
insert into task (id, title, description, created, updated, due_date, status_id) values (11, 'Iron shirts', NULL, '2017-09-23 03:59:58', '2017-10-19 08:30:48', '2017-12-08 11:00:35', 3);
insert into task (id, title, description, created, updated, due_date, status_id) values (12, 'Water the potted plants', 'Maybe they need fertilizer as well', '2017-09-29 23:38:42', '2017-10-08 04:24:53', null, 2);
insert into task (id, title, description, created, updated, due_date, status_id) values (13, 'Buy wine for the birthday party', 'Both red and white wine', '2017-10-10 14:57:22', '2017-10-14 14:03:30', '2017-12-10 23:43:56', 2);
insert into task (id, title, description, created, updated, due_date, status_id) values (14, 'Buy gift for Paul', 'He could use a shirt or a tie and some socks', '2017-09-09 05:22:08', '2017-10-17 15:58:05', '2017-12-04 20:45:18', 3);
insert into task (id, title, description, created, updated, due_date, status_id) values (15, 'Change lightbulb in hallway', 'Should be an LED bulb', '2017-10-01 19:07:35', '2017-10-03 10:02:27', '2017-12-08 17:09:03', 3);
insert into task (id, title, description, created, updated, due_date, status_id) values (16, 'Wash windows', NULL, '2017-10-02 22:15:17', '2017-10-07 22:31:35', '2017-12-06 03:36:09', 2);
insert into task (id, title, description, created, updated, due_date, status_id) values (17, 'Setup salary databases for accounting', 'Use MySQL', '2017-10-25 05:35:33', '2017-10-10 23:22:33', '2017-12-05 00:19:08', 1);
insert into task (id, title, description, created, updated, due_date, status_id) values (18, 'Learn how databases work', NULL, '2017-09-06 03:16:47', '2017-10-10 16:56:58', '2017-12-18 05:08:05', 3);
insert into task (id, title, description, created, updated, due_date, status_id) values (19, 'Make the databases perform better', 'It should be possible to optimize the indexes', '2017-10-03 09:27:20', '2017-10-01 16:27:46', '2017-12-01 13:28:35', 2);
insert into task (id, title, description, created, updated, due_date, status_id) values (20, 'Buy beer for the company party', '2 or 3 cases should be enough', '2017-10-08 01:39:02', '2017-10-13 23:07:41', null, 3);
insert into task (id, title, description, created, updated, due_date, status_id) values (21, 'Knit sweater', NULL, '2017-09-22 17:14:55', '2017-10-08 09:01:35', '2017-12-15 20:33:57', 2);
insert into task (id, title, description, created, updated, due_date, status_id) values (22, 'Charge electric bicycle', 'It sucks to ride it without a battery!', '2017-10-10 12:25:07', '2017-10-07 21:45:01', '2017-12-10 19:02:17', 1);
insert into task (id, title, description, created, updated, due_date, status_id) values (23, 'Buy new phone', 'The battery in the current one only lasts 5 hours 😞', '2017-09-17 00:25:34', '2017-10-09 11:48:12', null, 3);
insert into task (id, title, description, created, updated, due_date, status_id) values (24, 'Ride bike aroud Sjælland', 'Remember rainclothes and tire repair kit!', '2017-10-20 19:21:13', '2017-10-07 01:38:06', '2017-12-19 15:08:18', 2);
insert into task (id, title, description, created, updated, due_date, status_id) values (25, 'Look at apartments in Ørestad', '2 or 3 rooms', '2017-10-30 09:47:00', '2017-10-19 06:11:26', null, 1);
insert into task (id, title, description, created, updated, due_date, status_id) values (26, 'Empty Mr Fluffy\'s litterbox', NULL, '2017-09-28 03:09:06', '2017-10-13 10:38:34', '2017-12-20 23:37:18', 2);
insert into task (id, title, description, created, updated, due_date, status_id) values (27, 'Buy new dining room table and chairs', 'Ikea has some on sale', '2017-09-21 12:02:34', '2017-10-02 02:05:11', '2017-12-06 00:14:30', 1);
insert into task (id, title, description, created, updated, due_date, status_id) values (28, 'Renew buscard', '3 zones', '2017-10-07 22:47:51', '2017-10-09 15:50:03', '2017-12-01 14:25:40', 2);
insert into task (id, title, description, created, updated, due_date, status_id) values (29, 'Sign up for linkedin', 'Make the CV awesome! 😄', '2017-09-04 00:57:47', '2017-10-18 18:07:48', '2017-12-07 23:04:38', 3);
insert into task (id, title, description, created, updated, due_date, status_id) values (30, 'Remove facebook from phone', 'To avoid interruptions when working', '2017-10-26 17:15:07', '2017-10-13 03:36:47', '2017-12-19 11:10:02', 3);
insert into task (id, title, description, created, updated, due_date, status_id) values (31, 'Backup databases to external disk', 'Remember to store the disk in another physical location', '2017-09-09 17:32:33', '2017-10-01 21:18:59', '2017-12-23 14:21:01', 1);
insert into task (id, title, description, created, updated, due_date, status_id) values (32, 'Put up the new lamp in the hallway', NULL, '2017-10-15 05:45:54', '2017-10-16 14:05:35', '2017-12-29 02:29:26', 3);
insert into task (id, title, description, created, updated, due_date, status_id) values (33, 'Hang up paintings in living room', NULL, '2017-09-10 05:36:11', '2017-10-09 17:40:42', null, 3);
insert into task (id, title, description, created, updated, due_date, status_id) values (34, 'Buy plane ticket to Auckland', 'Check prices online first!', '2017-09-05 09:07:22', '2017-10-15 09:36:06', '2017-12-07 11:10:05', 1);
insert into task (id, title, description, created, updated, due_date, status_id) values (35, 'Learn about NoSQL databases', 'MongoDB, CouchDB, etc.', '2017-10-20 01:41:53', '2017-10-04 07:19:56', '2017-12-23 10:13:42', 2);




-- Users-tasks
insert into user_task (user_id, task_id) values(1, 5);
insert into user_task (user_id, task_id) values(1, 35);
insert into user_task (user_id, task_id) values(1, 11);
insert into user_task (user_id, task_id) values(2, 4);
insert into user_task (user_id, task_id) values(2, 26);
insert into user_task (user_id, task_id) values(2, 29);
insert into user_task (user_id, task_id) values(3, 22);
insert into user_task (user_id, task_id) values(3, 13);
insert into user_task (user_id, task_id) values(3, 19);
insert into user_task (user_id, task_id) values(4, 24);
insert into user_task (user_id, task_id) values(4, 20);
insert into user_task (user_id, task_id) values(5, 20);
insert into user_task (user_id, task_id) values(5, 18);
insert into user_task (user_id, task_id) values(5, 15);
insert into user_task (user_id, task_id) values(6, 10);
insert into user_task (user_id, task_id) values(6, 7);
insert into user_task (user_id, task_id) values(6, 27);
insert into user_task (user_id, task_id) values(7, 33);
insert into user_task (user_id, task_id) values(7, 18);
insert into user_task (user_id, task_id) values(7, 23);
insert into user_task (user_id, task_id) values(8, 26);
insert into user_task (user_id, task_id) values(8, 30);
insert into user_task (user_id, task_id) values(8, 11);
insert into user_task (user_id, task_id) values(9, 34);
insert into user_task (user_id, task_id) values(9, 15);
insert into user_task (user_id, task_id) values(9, 1);
insert into user_task (user_id, task_id) values(10, 29);
insert into user_task (user_id, task_id) values(10, 16);
insert into user_task (user_id, task_id) values(10, 1);
insert into user_task (user_id, task_id) values(11, 26);
insert into user_task (user_id, task_id) values(11, 27);
insert into user_task (user_id, task_id) values(11, 17);
insert into user_task (user_id, task_id) values(11, 2);
insert into user_task (user_id, task_id) values(1, 3);
insert into user_task (user_id, task_id) values(2, 6);
insert into user_task (user_id, task_id) values(3, 8);
insert into user_task (user_id, task_id) values(4, 9);
insert into user_task (user_id, task_id) values(5, 12);
insert into user_task (user_id, task_id) values(6, 14);
insert into user_task (user_id, task_id) values(7, 21);
insert into user_task (user_id, task_id) values(8, 25);
insert into user_task (user_id, task_id) values(9, 28);
insert into user_task (user_id, task_id) values(10, 31);
insert into user_task (user_id, task_id) values(11, 32);
SHOW TABLES;
--Get all the tasks assigned to users whose email ends in @spotify.com
SELECT task.*
FROM task
JOIN user ON task.id = user.id
WHERE user.email LIKE '%@spotify.com';
--Get all the tasks for 'Donald Duck' with status 'Not started'
SELECT task*
FROM task 
JOIN user ON task.id = user.id
WHERE user.name = 'Donald Duck' AND task.status_id = 1;
--Get all the tasks for 'Maryrose Meadows' that were created in september (hint: month(created)=month_number)
SELECT task.*
FROM task
JOIN user ON task.id = user.id
WHERE user.name = 'Maryrose Meadows' AND MONTH(task.created) = 9;
--Find how many tasks where created in each month, e.g. how many tasks were created in october, how many tasks were created in november, etc. (hint: use group by)
SELECT MONTH(created) AS month, COUNT(*) AS task_count
FROM task
GROUP BY MONTH(created)
ORDER BY month;

--Week 3 Homework
--Create a new database called meal_sharing and create the following tables:
CREATE DATABASE meal_sharing;
USE meal_sharing;

CREATE TABLE Meal (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    location VARCHAR(255),
    when_date DATETIME,
    max_reservations INT,
    price DECIMAL(10, 2),
    created_date DATE
);

CREATE TABLE Reservation (
    id INT AUTO_INCREMENT PRIMARY KEY,
    number_of_guests INT,
    meal_id INT,
    created_date DATE,
    contact_phonenumber VARCHAR(20),
    contact_name VARCHAR(100),
    contact_email VARCHAR(100),
    FOREIGN KEY (meal_id) REFERENCES Meal(id)
);

CREATE TABLE Review (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255),
    description TEXT,
    meal_id INT,
    stars INT CHECK (stars >= 1 AND stars <= 5),
    created_date DATE,
    FOREIGN KEY (meal_id) REFERENCES Meal(id)
);


-- Insert meals
INSERT INTO Meal (title, description, location, when_date, max_reservations, price, created_date) VALUES
('Pasta Night', 'Delicious homemade pasta', 'Copenhagen', '2025-05-10 19:00:00', 5, 75.00, '2025-05-01'),
('Sushi Sunday', 'Fresh sushi and sake', 'Aarhus', '2025-05-12 18:00:00', 10, 120.00, '2025-05-02'),
('Chicken Biryani', 'Spicy chicken biryani with Raita', 'Skovlunde', '2025-05-14 17:00:00', 8, 85.00, '2025-05-03'),
('Danish Delight', 'Traditional Danish meal', 'Odense', '2025-05-15 20:00:00', 4, 90.00, '2025-05-03');

-- Insert reservations

INSERT INTO Reservation (number_of_guests, meal_id, created_date, contact_phonenumber, contact_name, contact_email) VALUES
(2, 1, '2025-05-03', '12345678', 'Anna', 'anna@example.com'),
(1, 2, '2025-05-04', '23456789', 'Lars', 'lars@example.com'),
(4, 1, '2025-05-04', '34567890', 'Suman', 'suman@xyz.com'),
(3, 1, '2025-05-05', '34567890', 'Maja', 'maja@example.com');

-- Insert reviews

INSERT INTO Review (title, description, meal_id, stars, created_date) VALUES
('Amazing pasta', 'Best pasta I ever had!', 1, 5, '2025-05-06'),
('Too salty', 'Was a bit too salty for my taste', 2, 3, '2025-05-06'),
('Spicy','Loved the spices!',1,5, '2025-05-06'), 
('Lovely atmosphere', 'Great company and food!', 1, 4, '2025-05-06');

--Queries:Meal
--Get all meals
SELECT * FROM Meal;
--Add a new meal
INSERT INTO Meal (title, description, location, when_date, max_reservations, price, created_date) VALUES
('Tacos Night', 'Delicious homemade tacos', 'Copenhagen', '2025-05-20 19:00:00', 5, 75.00, '2025-05-01');
--Get a meal with any id, fx 1
SELECT * FROM Meal WHERE id = 1;
--Update a meal with any id, fx 1. Update any attribute fx the title or multiple attributes
UPDATE Meal SET title = 'Updated Pasta Night', description = 'Updated delicious homemade pasta' WHERE id = 1;
--Delete a meal with any id, fx 1
DELETE FROM Meal WHERE id = 1;

--Queries:Reservation
--Get all reservations
SELECT * FROM Reservation;

--Add a new reservation
INSERT INTO Reservation (number_of_guests, meal_id, created_date, contact_phonenumber, contact_name, contact_email) VALUES
(2, 1, '2025-05-03', '12345678', 'Anna', 'anna@hyf.com');

--Get a reservation with any id, fx 1
SELECT * FROM Reservation WHERE id = 1;

--Update a reservation with any id, fx 1. Update any attribute fx the title or multiple attributes
UPDATE Reservation SET number_of_guests = 3, contact_name = 'Updated Anna' WHERE id = 1;

--Delete a reservation with any id, fx 1
DELETE FROM Reservation WHERE id = 1;

--Queries:Review
--Get all reviews
SELECT * FROM Review;
--Add a new review
INSERT INTO Review (title, description, meal_id, stars, created_date) VALUES
('Great meal', 'I loved it!', 1, 5, '2025-05-06');
--Get a review with any id, fx 1
SELECT * FROM Review WHERE id = 1;
--Update a review with any id, fx 1. Update any attribute fx the title or multiple attributes
UPDATE Review SET title = 'Updated Amazing pasta', description = 'Updated best pasta I ever had!' WHERE id = 1;
--Delete a review with any id, fx 1
DELETE FROM Review WHERE id = 1;

--Additional queries
--Get meals that has a price smaller than a specific price fx 90
SELECT * FROM Meal WHERE price < 90;
--Get meals that still has available reservations
SELECT m.*, 
       m.max_reservations - IFNULL(SUM(r.number_of_guests), 0) AS available_spots
FROM Meal m
LEFT JOIN Reservation r ON m.id = r.meal_id
GROUP BY m.id
HAVING available_spots > 0;
--Get meals that partially match a title. Rød grød med will match the meal with the title Rød grød med fløde
SELECT * FROM Meal WHERE title LIKE '%grød%';
--Get meals that has been created between two dates
SELECT * FROM Meal WHERE created_date BETWEEN '2025-05-01' AND '2025-05-10';
--Get only specific number of meals fx return only 5 meals
SELECT * FROM Meal LIMIT 5;
--Get the meals that have good reviews
SELECT DISTINCT m.*
FROM Meal m
JOIN Review r ON m.id = r.meal_id
WHERE r.stars >= 4;

-- Get reservations for a specific meal (e.g. meal_id = 1) sorted by created_date
SELECT * FROM Reservation WHERE meal_id = 1 ORDER BY created_date;
--Sort all meals by average number of stars in the reviews

SELECT m.*, AVG(r.stars) AS avg_rating
FROM Meal m
LEFT JOIN Review r ON m.id = r.meal_id
GROUP BY m.id
ORDER BY avg_rating DESC;










