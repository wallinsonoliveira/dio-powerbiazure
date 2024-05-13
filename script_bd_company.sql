create schema if not exists azure_company;
use azure_company;

select * from information_schema.table_constraints
	where constraint_schema = 'azure_company';

-- restrição atribuida a um domínio
-- create domain D_num as int check(D_num> 0 and D_num< 21);

CREATE TABLE employee(
	Fname varchar(15) not null,
    Minit char,
    Lname varchar(15) not null,
    Ssn char(9) not null, 
    Bdate date,
    Address varchar(30),
    Sex char,
    Salary decimal(10,2),
    Super_ssn char(9),
    Dno int not null,
);

alter table employee 
	add constraint fk_employee 
	foreign key(Super_ssn) references employee(Ssn)
    on delete set null
    on update cascade;

alter table employee modify Dno int not null default 1;

desc employee;

create table departament(
	Dname varchar(15) not null,
    Dnumber int not null,
    Mgr_ssn char(9) not null,
    Mgr_start_date date, 
    Dept_create_date date,
);

-- 'def', 'company_constraints', 'departament_ibfk_1', 'company_constraints', 'departament', 'FOREIGN KEY', 'YES'
-- modificar uma constraint: drop e add
alter table departament drop  departament_ibfk_1;
alter table departament 
		add constraint fk_dept foreign key(Mgr_ssn) references employee(Ssn)
        on update cascade;

desc departament;

create table dept_locations(
	Dnumber int not null,
	Dlocation varchar(15) not null,
);

alter table dept_locations drop fk_dept_locations;

alter table dept_locations 
	add constraint fk_dept_locations foreign key (Dnumber) references departament(Dnumber)
	on delete cascade
    on update cascade;

create table project(
	Pname varchar(15) not null,
	Pnumber int not null,
    Plocation varchar(15),
    Dnum int not null,
);


create table works_on(
	Essn char(9) not null,
    Pno int not null,
    Hours decimal(3,1) not null,
);

drop table dependent;
create table dependent(
	Essn char(9) not null,
    Dependent_name varchar(15) not null,
    Sex char,
    Bdate date,
    Relationship varchar(8),
);

show tables;
desc dependent;