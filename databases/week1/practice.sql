-- Active: 1744549481786@@127.0.0.1@3306@hyf_lesson1
CREATE DATABASE mydb;
USE mydb;
DROP DATABASE mydb;--if you want to delete database
ALTER DATABASE mydb READ ONLY = 1;--means can only get data from database but cannot modify or drop it
ALTER DATABASE mydb READ ONLY = 0;--this makes it writable again
create table employees(
    employee_id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    hourly_pay DECIMAL(5,2),
    hire_date DATE
);
select * from employees;
RENAME TABLE employees TO employees_1;
select * from employees_1;
RENAME TABLE employees_1 to employees;
DROP TABLE employees;--if you want to delete the table employees, you can use this command
-- but be careful, this will delete the table and all its data
ALTER TABLE employees
ADD COLUMN phone_number VARCHAR(20);
ALTER Table employees
RENAME COLUMN phone_number to email;
ALTER TABLE employees
MODIFY COLUMN email VARCHAR(100);
ALTER TABLE employees
MODIFY email VARCHAR(100)
AFTER last_name;
SELECT * FROM employees;
ALTER TABLE employees
MODIFY email VARCHAR(100)
first;
SELECT * FROM employees;
ALTER TABLE employees
DROP COLUMN email;
SELECT * FROM employees; 
INSERT INTO employees 
VALUES  (1,'suman', 'jujjuru', 20.00, '2023-10-01'),
        (2,'manjusha','jujjuru', 25.00, '2023-10-02'),
        (3,'veda','jujjuru', 30.00, '2023-10-03'),
        (4,'shaurya','jujjuru', 35.00, '2023-10-04');

INSERT INTO employees(employee_id, first_name, last_name)
VALUES (5,'sandeep','jujjuru');

SELECT first_name, last_name FROM employees;
SELECT * from employees
WHERE employee_id = 1;
SELECT * from employees
WHERE employee_id = 2;
SELECT * from employees
WHERE first_name = "veda";
SELECT * from employees
WHERE hourly_pay >= 25.00;
SELECT * from employees
WHERE hire_date <= "2023-10-03";
SELECT * from employees
WHERE employee_id != 1;
SELECT * from employees
WHERE hire_date IS NULL;
SELECT * from employees
WHERE hire_date IS NOT NULL;
  UPDATE employees
  SET last_name = 'Jujjuru' 
  where employee_id = 1;

  UPDATE employees
  SET hourly_pay = 35.00
  WHERE employee_id = 2;
  SELECT * from employees;
  UPDATE employees
  SET hire_date = '2023-10-05'
  WHERE employee_id = 5;
  UPDATE employees
  SET hire_date = NULL
  WHERE employee_id = 5;
    SELECT * from employees;
    UPDATE employees
    SET hourly_pay = 40.00,hire_date = '2023-10-06'
    WHERE employee_id = 5;
    UPDATE employees
    SET last_name = "Jujjuru";-- no where clause it updates all the rows in the table
    SELECT * from employees;
    DELETE FROM employees
    WHERE employee_id = 1;-- deletes the row with employee_id = 1
    DELETE from employees;-- deletes all the rows in the table, but not the table itself but if auto commit is off, it will not delete the rows until you commit the transaction
    
    
    SET Autocommit = 0;-- Autocommit = 0 or Autocommit = OFF ;this will turn off auto commit and our transactions will not save automatically, so you have to commit the transaction manually to save the changes 
    COMMIT;--creating a save point in the transaction, so if you want to undo the changes you can rollback to this point
    DELETE from employees;-- deletes all the rows in the table, but not the table itself but if auto commit is off, it will not delete the rows until you commit the transaction
    ROLLBACK;-- this will undo the delete operation and restore the rows in the table
    SELECT * from employees;-- this will show the rows in the table after rollback
--by default, the autocommit is on, so if you want to turn it off, you can use the command SET Autocommit = 0; or SET Autocommit = OFF;
set autocommit = ON;-- this will turn on the autocommit and all the transactions will be saved automatically
CREATE TABLE test(
my_date DATE,
my_time TIME,
my_datetime DATETIME
);
SELECT * FROM test;
INSERT INTO test
VALUES (CURRENT_DATE(), CURRENT_TIME(), NOW());-- this will insert the current date, time and datetime into the table
SELECT * FROM test;
INSERT INTO test
VALUES (CURRENT_DATE() + INTERVAL 1 DAY, CURRENT_TIME() + INTERVAL 1 HOUR, NOW() + INTERVAL 30 MINUTE);--this will insert the current date + 1 day, current time + 1 hour, and current datetime + 30 seconds into the table or NOW() + 30 SECOND for seconds, NOW() + 30 MINUTE for minutes, NOW() + 30 HOUR for hours, NOW() + 30 DAY for days, NOW() + 30 MONTH for months, NOW() + 30 YEAR for years
SELECT * FROM test;
DROP TABLE test;-- this will delete the table test and all its data

--UNIQUE CONSTRAINTS
CREATE TABLE products(
  product_id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  product_name VARCHAR(50) NOT NULL,
  price DECIMAL(5,2) NOT NULL
);
ALTER TABLE products
ADD UNIQUE (product_name);
delete FROM products;-- this will add a unique constraint to the product_name column, so it will not allow duplicate values in the product_name column
INSERT INTO products (product_name, price)
VALUES
("samosa", 10.00),
("vada pav", 20.00),
("biryani", 50.00),
("pav bhaji", 30.00);
-- this will insert the values into the table, but it will not allow duplicate values in the product_name column because of the unique constraint
SELECT * FROM products;-- this will show the rows in the table
ALTER TABLE products
AUTO_INCREMENT = 1000;-- this will set the auto increment value to 1000, so the next value of product_id will be 1000
INSERT INTO products (product_name, price)
VALUES ("laddu", 15.00);-- this will insert the value into the table, but it will not allow duplicate values in the product_name column because of the unique constraint
select * from products;
--CHECK constraint
CREATE Table employees(
  employee_id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  hourly_pay DECIMAL(5,2),
  hire_date DATE
); --this table is already created and adding CHECK constraint later
ALTER TABLE employees
ADD constraint chk_hourly_pay CHECK(hourly_pay > 0);-- this will add a check constraint to the hourly_pay column, so it will not allow negative values in the hourly_pay column
select * from employees;
insert into employees(first_name, last_name, hourly_pay)--you cannot just insert hourly_pay column because first_name and last_name columns are having not null constraints like this --"insert into employees(hourly_pay)"
VALUES('John', 'Doe', 2.00);
ALTER TABLE employees
DROP CONSTRAINT chk_hourly_pay; -- to modify hourly_pay constraint first, drop the existing constraint

ALTER TABLE employees
ADD CONSTRAINT chk_hourly_pay CHECK(hourly_pay >= 5); -- then, add a new constraint with the updated value
show tables;
describe table employees; -- this will show the structure of the table employees
SELECT VERSION();
create table employees_new(
  employee_id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  hourly_pay DECIMAL(5,2),
  hire_date DATE
);
ALTER TABLE employees_new
ADD constraint chk_hourly_pay CHECK(hourly_pay > 5);
alter TABLE employees_new
DROP constraint chk_hourly_pay;
ALTER TABLE employees_new
ADD constraint chk_hourly_pay CHECK(hourly_pay > 0);
insert into employees_new
VALUES (1,'suman', 'jujjuru', 20.00, '2023-10-01'),
        (2,'manjusha','jujjuru', 25.00, '2023-10-02'),
        (3,'veda','jujjuru', 30.00, '2023-10-03'),
        (4,'shaurya','jujjuru', 35.00, '2023-10-04');

insert into employees_new(employee_id, first_name, last_name, hourly_pay, hire_date)
VALUES (5,'sandeep','jujjuru', 40.00, '2023-10-05');
alter TABLE employees_new
DROP constraint chk_hourly_pay;
ALTER TABLE employees_new
ADD constraint chk_hourly_pay CHECK(hourly_pay > 5);
insert into employees_new(employee_id, first_name, last_name, hourly_pay, hire_date)
VALUES (6,'sandeep','jujjuru', 6.00, '2023-10-05');
select * from employees_new;
 delete from employees_new where employee_id = 6;
 describe employees_new;
 insert into employees_new(employee_id, first_name, last_name, hourly_pay, hire_date)
VALUES (6,'sandeep','jujjuru', 7.00, '2023-10-05');
RENAME table employees_new to employees1;
select * from employees1;
drop TABLE employees1;
SHOW TABLES;
SELECT * from products;
ALTER Table products
alter price set default 0.00;-- this will set the default value of the price column to 0.00, so if you insert a row without specifying the price, it will take the default value of 0.00

SELECT * from products;-- this will show the rows in the table
INSERT into products(product_name) 
VALUES ("pastry");
CREATE table transactions(
  transaction_id INT,
  amount Decimal(5,2),
  transaction_date DATETIME DEFAULT now()--Default is a constraint that sets a default value for a column when no value is specified during insertion.
);
INSERT into transactions(transaction_id, amount)
values (1, 100.00),
(2, 200.00),
(3, 300.00);
select * from transactions;
--FOREIGN KEY CONSTRAINTS
-- this is used to create a relationship between two tables, so that the values in one table can be referenced in another table
-- this is used to maintain referential integrity between two tables, so that the values in one table can be referenced in another table
CREATE TABLE customers(
  customer_id INT PRIMARY KEY AUTO_INCREMENT,
  first_name VARCHAR(50),
  last_name VARCHAR(50)
);
SELECT * FROM customers;
INSERT INTO customers(first_name, last_name)
VALUES ("Fred","Fish"),
("Larry","Lobster"),
("Bubble","Bass");
SELECT * from transactions;
DROP TABLE transactions;-- this will delete the table transactions and all its data
CREATE TABLE transactions (
  transavtion_id INT PRIMARY KEY AUTO_INCREMENT,
  amount DECIMAL(5,2),
  customer_id INT,
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
ALTER table transactions
RENAME COLUMN transavtion_id to transaction_id;
SELECT * FROM transactions;
SHOW CREATE TABLE transactions; -- This will display the structure of the table, including the name of the foreign key constraint.
--transactions_ibfk_1 is the name of the foreign key constraint that was created when we created the table transactions.
-- To drop the foriegn key constraint
ALTER TABLE transactions
DROP FOREIGN KEY transactions_ibfk_1;-- this will drop the foreign key constraint transactions_ibfk_1 from the table transactions
SHOW CREATE TABLE transactions;
--To add the foreign key constraint again with a unique name
ALTER TABLE transactions
ADD constraint fk_customer_id 
FOREIGN KEY (customer_id) REFERENCES customers(customer_id);-- this will add the foreign key constraint fk_customer_id to the table transactions, so it will reference the customer_id column in the customers table and if the customer_id is deleted in the customers table, it will also delete the corresponding rows in the transactions table and if the customer_id is updated in the customers table, it will also update the corresponding rows in the transactions table
SHOW CREATE TABLE transactions;
SELECT * FROM transactions;
ALTER TABLE transactions
AUTO_INCREMENT = 1000;
INSERT INTO transactions (amount, customer_id)
VALUES (4.99, 3),
(2.89, 2),
(3.38, 3),
(4.99, 1);
delete from customers
where customer_id = 3;;--Error: Cannot delete or update a parent row: a foreign key constraint fails (hyf_lesson1.transactions, CONSTRAINT fk_customer_id FOREIGN KEY (customer_id) REFERENCES customers (customer_id))
--JOINS(INNER JOIN, LEFT JOIN, RIGHT JOIN-using transactions table and customers table)
-- this is used to combine rows from two or more tables based on a related column between them like foreign key and primary key(customer_id in customers table and customer_id in transactions table)
-- this is used to retrieve data from multiple tables in a single query

--lets assume the transactions table on the left and the customer table on the right on a venn diagram where the common part is the customer_id column in both tables
INSERT INTO transactions (amount, customer_id)
VALUES(1.00, NULL);--not all transactions have a customer_id, so this will insert a row with NULL value in the customer_id column for example customer pays cash and not credit card or debit card
SELECT * FROM transactions;
INSERT INTO customers (first_name, last_name)
VALUES("Poppy", "Puff");--not all customers have a transaction, so this will insert a row with NULL value in the transaction_id column for example customer is new and has not made any transactions yet
SELECT * FROM customers;
--1.INNER JOIN
-- this will return only the rows that have matching values in both tables, so it will return only the rows that have a customer_id in the transactions table and a customer_id in the customers table

--To create an INNER JOIN between the transactions and customers tables 
SELECT *
FROM transactions INNER JOIN customers
ON transactions.customer_id = customers.customer_id;
--you dont have to select all(*) the columns from both tables, you can select only the columns you want to see like this
SELECT transaction_id, amount, first_name, last_name
FROM transactions INNER JOIN customers
ON transactions.customer_id = customers.customer_id;
--LEFT JOIN
-- this will return all the rows from the left table (transactions) and the matching rows from the right table (customers), if there is no match, NULL values will be returned for the right table columns
SELECT * 
FROM transactions LEFT JOIN customers
ON transactions.customer_id = customers.customer_id;
--RIGHT JOIN
-- this will return all the rows from the right table (customers) and the matching rows from the left table (transactions-like same customer having multiple transactions i.e customer_id 3 with two transaction_id's), if there is no match, NULL values will be returned for the left table columns
SELECT * 
FROM transactions RIGHT JOIN customers
ON transactions.customer_id = customers.customer_id;