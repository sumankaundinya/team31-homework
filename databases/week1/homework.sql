-- 1.Find out how many tasks are in the task table
SELECT COUNT(*) FROM task; 
-- 2.Find out how many tasks in the task table do not have a valid due date
SELECT COUNT(*) from task where due_date is null; 
-- To see all the tables in the database
SHOW TABLES; 
-- To see all the statuses in the database because we need to know the statuses and their id's
SELECT * from status; 
-- 3.Find all the tasks that are marked as done
Select * from task where status_id = 3; 
-- 4.Find all the tasks that are not marked as done
SELECT * from task where status_id != 3; 
-- 5.Get all the tasks, sorted with the most recently created first
select * from task ORDER BY created DESC; 
-- 6.Get the single most recently created task
select * from task ORDER BY created desc limit 1; 
-- 7.Get the title and due date of all tasks where the title or description contains "database"
SELECT title, due_date from task where title like '%database%' or description like '%database%'; 
-- 8.Get the title and status (as text) of all tasks
SELECT task.title, status.name AS status_text FROM task JOIN status ON task.status_id = status.id;
-- 9.Get the name of each status, along with a count of how many tasks have that status
SELECT status.name, COUNT(task.id) as task_count FROM status JOIN task ON status.id = task.status_id GROUP BY status.name; 
-- 10.Get the names of all statuses, sorted by the status with most tasks first
select status.name, COUNT(task.id) as task_count FROM status JOIN task ON status.id = task.status_id GROUP BY status.name ORDER BY task_count DESC; 
