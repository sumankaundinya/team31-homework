-- Active: 1744549481786@@127.0.0.1@3306@hyf_lesson1
Part 1: Working with tasks
SELECT * FROM TASK;
--1.Add a task with these attributes: title, description, created, updated, due_date, status_id, user_id
INSERT INTO TASK (title, description, created, updated, due_date, status_id, user_id) 
VALUES ('Task 1', 'Description 1', '2023-10-01 10:00:00', '2023-10-01 10:00:00', '2023-10-05 10:00:00', 1, 1);
--2.Change the title of a task
UPDATE task SET TITLE = "TITLE CHANGED" WHERE ID = 36;
--3.Change a task due date
UPDATE task SET DUE_DATE = "2025-04-29 10:44:00" WHERE ID = 36;
--4.Change a task status
UPDATE TASK SET STATUS_ID = 2 WHERE ID = 36;
SELECT * FROM status;
--5.Mark a task as complete
UPDATE task SET STATUS_ID = 3 WHERE ID = 36;
--6.delete a task
DELETE FROM TASK WHERE ID = 36;

