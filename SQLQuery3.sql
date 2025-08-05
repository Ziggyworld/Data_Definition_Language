Create database gomycode_checkpoint;

use gomycode_checkpoint;

-- Department Table
create table Department(
Num_S int primary key,
Label Varchar(255),
Manager_Name Varchar(255)
);

--Employee Table
create table Employee(
Num_E int primary key,
Num_S int,
Name Varchar(255),
Position Varchar(255),
Salary Decimal(10, 2),
foreign key (Num_S) references Department(Num_S)
);

--Project Table
create table Project(
Num_p int Primary key,
Title Varchar(255),
Start_Date Date,
End_Date Date,
Num_S int,
foreign key (Num_S) references Department(Num_S)
);

--Employee_Project (For tracking employee roles in projects)
create table Employee_Project(
Num_E int,
Num_p int,
Role Varchar(255),
foreign key (Num_p) references Project(Num_p),
foreign key (Num_E) references Employee(Num_E)
);
