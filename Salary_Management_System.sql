use salarymanagementdb

create table departmentdetails
(
    departmentid varchar(20) primary key,
    departmentname varchar(100) not null,
    location varchar(100),
    departmenthead varchar(100)
)
select * from departmentdetails
--------------
insert into departmentdetails values
('dept_101', 'human resources', 'noida', 'pooja sharma'),
('dept_102', 'finance', 'noida', 'amit verma'),
('dept_103', 'information technology', 'noida', 'rahul mehta'),
('dept_104', 'sales', 'delhi', 'vikas yadav'),
('dept_105', 'marketing', 'gurugram', 'neha kapoor')
------------
create table employeedetails
(
    employeeid varchar(20) primary key,
    employeename varchar(100) not null,
    gender varchar(10),
    departmentid varchar(20),
    jobtitle varchar(100),
    joiningdate date,
    email varchar(100) unique,
    phone varchar(15),
    employmentstatus varchar(20),
    foreign key (departmentid) references departmentdetails(departmentid)
)
select * from employeedetails
------------
insert into employeedetails values
('emp_101', 'rahul sharma', 'male', 'dept_103', 'software developer', '2024-01-15', 'rahul.sharma@example.com', '9000000101', 'active'),
('emp_102', 'priya singh', 'female', 'dept_101', 'hr executive', '2023-06-10', 'priya.singh@example.com', '9000000102', 'active'),
('emp_103', 'amit verma', 'male', 'dept_102', 'accountant', '2022-09-20', 'amit.verma@example.com', '9000000103', 'active'),
('emp_104', 'neha verma', 'female', 'dept_104', 'sales executive', '2024-03-05', 'neha.verma@example.com', '9000000104', 'active'),
('emp_105', 'rohit mehta', 'male', 'dept_105', 'marketing executive', '2023-11-12', 'rohit.mehta@example.com', '9000000105', 'active'),
('emp_106', 'anjali gupta', 'female', 'dept_103', 'data analyst', '2024-02-18', 'anjali.gupta@example.com', '9000000106', 'active'),
('emp_107', 'vikas yadav', 'male', 'dept_104', 'sales manager', '2021-08-25', 'vikas.yadav@example.com', '9000000107', 'active'),
('emp_108', 'simran kaur', 'female', 'dept_102', 'finance executive', '2023-04-14', 'simran.kaur@example.com', '9000000108', 'active'),
('emp_109', 'karan malhotra', 'male', 'dept_103', 'database administrator', '2022-12-01', 'karan.malhotra@example.com', '9000000109', 'active'),
('emp_110', 'pooja joshi', 'female', 'dept_101', 'hr manager', '2021-05-30', 'pooja.joshi@example.com', '9000000110', 'active')
----------------
create table salarydetails
(
    salaryid varchar(20) primary key,
    employeeid varchar(20),
    basicsalary decimal(10,2),
    allowances decimal(10,2),
    deductions decimal(10,2),
    netsalary decimal(10,2),
    salarymonth varchar(20),
    foreign key (employeeid) references employeedetails(employeeid)
)
select * from salarydetails
----------------
insert into salarydetails values
('sal_101', 'emp_101', 45000, 5000, 3000, 47000, 'january 2026'),
('sal_102', 'emp_102', 35000, 4000, 2000, 37000, 'january 2026'),
('sal_103', 'emp_103', 40000, 4500, 2500, 42000, 'january 2026'),
('sal_104', 'emp_104', 30000, 3500, 1500, 32000, 'january 2026'),
('sal_105', 'emp_105', 32000, 4000, 1800, 34200, 'january 2026'),
('sal_106', 'emp_106', 48000, 5500, 3000, 50500, 'january 2026'),
('sal_107', 'emp_107', 55000, 6000, 3500, 57500, 'january 2026'),
('sal_108', 'emp_108', 42000, 4500, 2500, 44000, 'january 2026'),
('sal_109', 'emp_109', 60000, 7000, 4000, 63000, 'january 2026'),
('sal_110', 'emp_110', 52000, 5500, 3000, 54500, 'january 2026')
-----------------------

select
    e.employeeid,
    e.employeename,
    d.departmentname,
    e.jobtitle,
    s.basicsalary,
    s.allowances,
    s.deductions,
    s.netsalary
from employeedetails e
join departmentdetails d
on e.departmentid = d.departmentid
join salarydetails s
on e.employeeid = s.employeeid
------------------------------------
create table salaryhistory
(
    historyid varchar(20) primary key,
    employeeid varchar(20),
    oldsalary decimal(10,2),
    newsalary decimal(10,2),
    changedate date,
    reason varchar(200),
    foreign key (employeeid) references employeedetails(employeeid)
)
select * from salaryhistory
--------------
insert into salaryhistory values
('hist_101', 'emp_101', 47000, 52000, '2026-04-01', 'annual increment'),
('hist_102', 'emp_102', 37000, 40000, '2026-04-01', 'performance increment'),
('hist_103', 'emp_103', 42000, 45000, '2026-04-01', 'annual increment'),
('hist_104', 'emp_106', 50500, 57000, '2026-04-01', 'performance increment'),
('hist_105', 'emp_107', 57500, 63000, '2026-04-01', 'promotion'),
('hist_106', 'emp_109', 63000, 70000, '2026-04-01', 'promotion'),
('hist_107', 'emp_110', 54500, 59000, '2026-04-01', 'annual increment')

-----------------------------
-----connecting all tables
select
    e.employeeid,
    e.employeename,
    d.departmentname,
    e.jobtitle,
    s.basicsalary,
    s.netsalary,
    h.oldsalary,
    h.newsalary,
    h.reason
from employeedetails e
join departmentdetails d
on e.departmentid = d.departmentid
join salarydetails s
on e.employeeid = s.employeeid
left join salaryhistory h
on e.employeeid = h.employeeid
------------------------------------------------
select * from departmentdetails
select * from employeedetails
select * from salarydetails
select * from salaryhistory
------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------questions & queries--------------------------------------------

 Question - Retrieve the Employee ID, Employee Name, Job Title, and Net Salary of active employees, and display the results with salaries in descending order.
 
 select
    e.employeeid,
    e.employeename,
    e.jobtitle,
    s.netsalary
from employeedetails e
join salarydetails s
on e.employeeid = s.employeeid
where e.employmentstatus = 'active'
order by s.netsalary desc
-------------------------------------------------------------------------------------------
Question - Retrieve the employees working in Noida whose net salary is more than ₹40,000.

select
    e.employeeid,
    e.employeename,
    d.departmentname,
    d.location,
    s.netsalary
from employeedetails e
join departmentdetails d
on e.departmentid = d.departmentid
join salarydetails s
on e.employeeid = s.employeeid
where d.location = 'noida'
and s.netsalary > 40000
--------------------------------------------------------------------------------------------
Question - Extract the names and job titles of employees working in the Finance or IT departments.

select
    e.employeename,
    e.jobtitle,
    d.departmentname
from employeedetails e
join departmentdetails d
on e.departmentid = d.departmentid
where d.departmentname in ('human resources', 'finance', 'information technology')
--------------------------------------------------------------------------------------------
Question - Extract employees whose job title contains the word "Executive" and whose salary is between ₹30,000 and ₹50,000.

select
    e.employeename,
    e.jobtitle,
    s.netsalary
from employeedetails e
join salarydetails s
on e.employeeid = s.employeeid
where e.jobtitle like '%executive%'
and s.netsalary between 30000 and 50000
---------------------------------------------------------------------------------------------
Question - Calculate the employee count and total net salary for each department, and list the department with the highest total salary at the top.

select
    d.departmentname,
    count(e.employeeid) as employeecount,
    sum(s.netsalary) as totalsalary
from departmentdetails d
join employeedetails e
on d.departmentid = e.departmentid
join salarydetails s
on e.employeeid = s.employeeid
group by d.departmentname
order by totalsalary desc
---------------------------------------------------------------------------------------------
Question - Calculate the average, highest, and lowest net salary for each department.

select
    d.departmentname,
    avg(s.netsalary) as averagesalary,
    max(s.netsalary) as highestsalary,
    min(s.netsalary) as lowestsalary
from departmentdetails d
join employeedetails e
on d.departmentid = e.departmentid
join salarydetails s
on e.employeeid = s.employeeid
group by d.departmentname
---------------------------------------------------------------------------------------------
question - Show only those departments that have more than 2 employees and an average salary of more than ₹40,000.

select
    d.departmentname,
    count(e.employeeid) as employeecount,
    avg(s.netsalary) as averagesalary
from departmentdetails d
join employeedetails e
on d.departmentid = e.departmentid
join salarydetails s
on e.employeeid = s.employeeid
group by d.departmentname
having count(e.employeeid) > 2
and avg(s.netsalary) > 40000
---------------------------------------------------------------------------------------------
Question - Retrieve the names, departments, and salaries of employees who earn more than the company average salary.

select
    e.employeename,
    d.departmentname,
    s.netsalary
from employeedetails e
join departmentdetails d
on e.departmentid = d.departmentid
join salarydetails s
on e.employeeid = s.employeeid
where s.netsalary >
(
    select avg(netsalary)
    from salarydetails
)
----------------------------------------------------------------------------------------------
Question - Identify the highest-paid employee in each department.

select
    e.employeename,
    d.departmentname,
    s.netsalary
from employeedetails e
join departmentdetails d
on e.departmentid = d.departmentid
join salarydetails s
on e.employeeid = s.employeeid
where s.netsalary =
(
    select max(s2.netsalary)
    from employeedetails e2
    join salarydetails s2
    on e2.employeeid = s2.employeeid
    where e2.departmentid = e.departmentid
)
--------------------------------------------------------------------------------------------
Question - Find out how many employees fall into the low, medium, and high salary categories.

select
    case
        when netsalary < 40000 then 'low salary'
        when netsalary between 40000 and 55000 then 'medium salary'
        else 'high salary'
    end as salarycategory,
    count(*) as employeecount
from salarydetails
group by
    case
        when netsalary < 40000 then 'low salary'
        when netsalary between 40000 and 55000 then 'medium salary'
        else 'high salary'
    end
-------------------------------------------------------------------------------------------
Question - Display employee name, department name, location, job title, and net salary in a report.

select
    e.employeename,
    d.departmentname,
    d.location,
    e.jobtitle,
    s.netsalary
from employeedetails e
inner join departmentdetails d
on e.departmentid = d.departmentid
inner join salarydetails s
on e.employeeid = s.employeeid
--------------------------------------------------------------------------------------------
Question - Show all departments and the count of their employees, even if a department has no employees.

select
    d.departmentname,
    count(e.employeeid) as employeecount
from departmentdetails d
left join employeedetails e
on d.departmentid = e.departmentid
group by d.departmentname
--------------------------------------------------------------------------------------------
Question - Retrieve the names, old salaries, new salaries, and department names of employees who have a salary history.

select
    e.employeename,
    d.departmentname,
    h.oldsalary,
    h.newsalary
from salaryhistory h
join employeedetails e
on h.employeeid = e.employeeid
join departmentdetails d
on e.departmentid = d.departmentid
--------------------------------------------------------------------------------------------
Question - Calculate the salary increment amount by comparing the employees current salaries and salary history.

select
    e.employeename,
    s.netsalary as currentsalary,
    h.oldsalary,
    h.newsalary,
    h.newsalary - h.oldsalary as salaryincrease
from employeedetails e
join salarydetails s
on e.employeeid = s.employeeid
join salaryhistory h
on e.employeeid = h.employeeid
--------------------------------------------------------------------------------------------
Question - Identify the employees whose salary history is not available.

select
    e.employeeid,
    e.employeename,
    e.jobtitle
from employeedetails e
left join salaryhistory h
on e.employeeid = h.employeeid
where h.employeeid is null
--------------------------------------------------------------------------------------------
Question - Assign a low, medium, or high salary category to each employee based on their salary, and display the highest salaries at the top.

select
    e.employeename,
    s.netsalary,
    case
        when s.netsalary < 40000 then 'low salary'
        when s.netsalary between 40000 and 55000 then 'medium salary'
        else 'high salary'
    end as salarycategory
from employeedetails e
join salarydetails s
on e.employeeid = s.employeeid
order by s.netsalary desc
--------------------------------------------------------------------------------------------
Question - An employee's salary is compared against the company's average salary to determine whether their status is above or below average.

select
    e.employeename,
    s.netsalary,
    case
        when s.netsalary >
        (
            select avg(netsalary)
            from salarydetails
        )
        then 'above average'
        else 'below average'
    end as salarystatus
from employeedetails e
join salarydetails s
on e.employeeid = s.employeeid
---------------------------------------------------------------------------------------------
Question - Identify employees whose salary is higher than the average salary of their own department.

select
    e.employeename,
    d.departmentname,
    s.netsalary
from employeedetails e
join departmentdetails d
on e.departmentid = d.departmentid
join salarydetails s
on e.employeeid = s.employeeid
where s.netsalary >
(
    select avg(s2.netsalary)
    from employeedetails e2
    join salarydetails s2
    on e2.employeeid = s2.employeeid
    where e2.departmentid = e.departmentid
)
-------------------------------------------------------------------------------------------
Question - Calculate the salary increase percentage in the salary history and display the employee with the highest increase at the top.

select
    e.employeename,
    h.oldsalary,
    h.newsalary,
    h.newsalary - h.oldsalary as salaryincrease,
    ((h.newsalary - h.oldsalary) * 100.0 / h.oldsalary) as increasepercentage
from salaryhistory h
join employeedetails e
on h.employeeid = e.employeeid
order by increasepercentage desc
-------------------------------------------------------------------------------------------
Question - Extract the names, departments, old salaries, and new salaries of employees who received a salary increase through promotion.

select
    e.employeename,
    d.departmentname,
    h.oldsalary,
    h.newsalary
from salaryhistory h
join employeedetails e
on h.employeeid = e.employeeid
join departmentdetails d
on e.departmentid = d.departmentid
where h.reason = 'promotion'
-------------------------------------------------------------------------------------------
Question - Rank all the companys employees from highest to lowest based on their net salary.

select
    e.employeeid,
    e.employeename,
    s.netsalary,
    rank() over(order by s.netsalary desc) as salaryrank
from employeedetails e
join salarydetails s
on e.employeeid = s.employeeid
-------------------------------------------------------------------------------------------
Question - Rank employees within each department based on their salaries.

select
    e.employeeid,
    e.employeename,
    d.departmentname,
    s.netsalary,
    rank() over
    (
        partition by e.departmentid
        order by s.netsalary desc
    ) as departmentrank
from employeedetails e
join departmentdetails d
on e.departmentid = d.departmentid
join salarydetails s
on e.employeeid = s.employeeid
--------------------------------------------------------------------------------------------
Question - Identify the top-ranked employee in each department.

with employeeranking as
(
    select
        e.employeeid,
        e.employeename,
        d.departmentname,
        s.netsalary,
        rank() over
        (
            partition by e.departmentid
            order by s.netsalary desc
        ) as salaryrank
    from employeedetails e
    join departmentdetails d
    on e.departmentid = d.departmentid
    join salarydetails s
    on e.employeeid = s.employeeid
)
select
    employeeid,
    employeename,
    departmentname,
    netsalary,
    salaryrank
from employeeranking
where salaryrank = 1
------------------------------------------------------------------------------------------
Question - Give row number to employees on the basis of salary,highest salary to be 1.

select
    e.employeeid,
    e.employeename,
    s.netsalary,
    row_number() over(order by s.netsalary desc) as salaryrow
from employeedetails e
join salarydetails s
on e.employeeid = s.employeeid
-------------------------------------------------------------------------------------------
Question - Assign a row number to employees of each department based on their salary.

select
    e.employeeid,
    e.employeename,
    d.departmentname,
    s.netsalary,
    row_number() over
    (
        partition by e.departmentid
        order by s.netsalary desc
    ) as departmentrow
from employeedetails e
join departmentdetails d
on e.departmentid = d.departmentid
join salarydetails s
on e.employeeid = s.employeeid
----------------------------------------------------------------------------------------------
Question - isplay the average salary of the department alongside each employee salary.

select
    e.employeename,
    d.departmentname,
    s.netsalary,
    avg(s.netsalary) over
    (
        partition by e.departmentid
    ) as departmentaveragesalary
from employeedetails e
join departmentdetails d
on e.departmentid = d.departmentid
join salarydetails s
on e.employeeid = s.employeeid
----------------------------------------------------------------------------------------------
Question - Compare each employees salary with that of the employee ranked immediately before them.

select
    e.employeename,
    d.departmentname,
    s.netsalary,
    lag(s.netsalary) over
    (
        partition by e.departmentid
        order by s.netsalary desc
    ) as previoussalary
from employeedetails e
join departmentdetails d
on e.departmentid = d.departmentid
join salarydetails s
on e.employeeid = s.employeeid
---------------------------------------------------------------------------------------------
Question - Calculate the salary difference between the highest and lowest salaries in each department.

select
    e.employeename,
    d.departmentname,
    s.netsalary,
    max(s.netsalary) over
    (
        partition by e.departmentid
    ) -
    min(s.netsalary) over
    (
        partition by e.departmentid
    ) as salarydifference
from employeedetails e
join departmentdetails d
on e.departmentid = d.departmentid
join salarydetails s
on e.employeeid = s.employeeid

------------------------------------------END--------------------------------------------------------------------