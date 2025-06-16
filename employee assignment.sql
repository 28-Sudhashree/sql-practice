create database banking_data;
create table employees(
employee_id serial primary key,
first_name varchar(10)not null,
last_name varchar(10) not null,
department varchar(10),
salary decimal(10,2)check(salary>0),
joining_date date not null,
age int check(age>18)
);
 insert into employees(first_name,last_name,department, salary, joining_date, age)
 values
 ('amir','sharma','IT',60000.00,'2022-01-05',29),
 ('Neha','Patel','HR',55000.00,'2021-08-15',32),
 ('Ravi','Kumar','Fianace',70000.00,'2020-03-10',35),
 ('Anjali','verma','IT',65000.00,'2019-11-22',28),
 ('suresh','reddy','Operation',50000.00,'2023-10-26',39);
 select * from employees;

--Q1 retrieve employee's first name and thier department
 select first_name, department from employees;
 --Q2 update the salary of all the employees frem IT department by 10%
 update employees
 set salary=salary+salary*0.1
 where department='IT';
 --Q3 delete employees whose age is more that 34
 delete from employees
 where age >34;

 --inserting 3 coloumn data 
 insert into employees(first_name,last_name,department,salary,joining_date,age)
 values('suchi','Ravi','mining',55000.00,'2022-09-28',34),
 ('ravi','Mohan','HR',43000.00,'2023-08-30',45),
 ('anu','paman','analyst',47000,'2020-09-20',35);

 --add column email to the 'employees' table
 Alter table employees
 add column email varchar(30) not null;
 delete from employees
 

 insert into employees(email)
 values('neha@123'),
 ('Amirzsz@1234'),
 ('Anjali@gamil.com'),
 ('suchiRavi@5667'),
 ('Ravi8889@gmail.com'),
 ('anu@yahoo.com');

--rename department as dept_name
alter table employees
rename column department to dept_name;

--retrieve the name of employees who joined after jan 2021
select first_name ,joining_date from employees 
where joining_date> '2021-01-01';

 --changing salary column data type to integer
 alter table employees
 alter column salary type integer using salary::integer;
 
 --list all employes with thier age and salary in decending order of salary
select first_name, age, salary from employees
 order by salary desc;