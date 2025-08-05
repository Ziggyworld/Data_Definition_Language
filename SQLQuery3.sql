Create database gomycode_checkpoint;

use gomycode_checkpoint;

-- Department Table
create table Department(
Num_S int primary key,
Label Varchar(255),
Manager_Name Varchar(255)
);

Insert into Department(Num_S, Label, Manager_Name) VALUES
(1, 'IT', 'Alice Johnson'),
(2, 'HR', 'Bob Smith'),
(3, 'Marketing', 'Clara Bennett');


--Employee Table
create table Employee(
Num_E int primary key,
Num_S int,
Name Varchar(255),
Position Varchar(255),
Salary Decimal(10, 2),
foreign key (Num_S) references Department(Num_S)
);

insert into Employee(Num_E, Name, Position, Salary, Num_S) VALUES
(101, 'John Doe', 'Developer', 60000.00, 1),
(102, 'Jane Smith', 'Analyst', 55000.00, 2),
(103, 'Mike Brown', 'Designer', 50000.00, 3),
(104, 'Sarah Johnson', 'Data scientist', 70000.00, 1),
(105, 'Emma Wilson', 'HR Specialist', 52000.00, 2);


--Project Table
create table Project(
Num_p int Primary key,
Title Varchar(255),
Start_Date Date,
End_Date Date,
Num_S int,
foreign key (Num_S) references Department(Num_S)
);

insert into Project(Num_P, Title, Start_Date, End_Date, Num_S) VALUES
(201, 'Website Redesign', '2024-01-15', '2024-06-30', 1),
(202, 'Employee Onboarding', '2024-03-01', '2024-09-01', 2),
(203, 'Market Research', '2024-02-01', '2024-07-31', 3),
(204, 'IT Infrastructure Setup', '2024-04-01', '2024-12-31', 1);


--Employee_Project (For tracking employee roles in projects)
create table Employee_Project(
Num_E int,
Num_p int,
Role Varchar(255),
foreign key (Num_p) references Project(Num_p),
foreign key (Num_E) references Employee(Num_E)
);

insert into Employee_Project(Num_E, Num_p, Role) VALUES
(101, 201, 'Frontend Developer'),
(104, 201, 'Backend Developer'),
(102, 202, 'Trainer'),
(105, 202, 'Coordinator'),
(103, 203, 'Research Lead'),
(101, 204, 'Network Specialist');



UPDATE Employee_Project
SET Role = 'Full Stack Developer'
WHERE Num_E = 101;

DELETE FROM Employee_Project
WHERE Num_E = 103;

DELETE FROM Employee
WHERE Num_E = 103;