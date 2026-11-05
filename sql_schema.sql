-- LIBRARY MANAGEMENT SYSTEM
use library_project_2;

-- CREATING TABLES
drop table if exists branch;
create table branch(
	branch_id varchar(10) primary key,
    manager_id varchar(10),
    branch_address varchar(50),
    contact_no varchar(10)
);
create table employee(
	emp_id varchar(10) primary key,
    emp_name varchar(30),
    position varchar(15),
    salary float,
    branch_id varchar(10)
);
create table members(
	member_id varchar(10) primary key,
    member_name varchar(30),
    member_address varchar(15),
    reg_date date
);
issued_status
create table books(
	isbn varchar(20),
	book_title varchar(100),
	category varchar(50),
	rental_price float,
    status varchar(5),
	author varchar(50),
	publisher varchar(10)
);
create table return_status(
	return_id	varchar(10),
    issued_id varchar(10),
	return_book_name varchar(50),
    return_date	date,
    return_book_isbn varchar(10)
);
create table issued_status(
	issued_id varchar(10),
	issued_member_id varchar(10),
    issued_book_name varchar(100),
	issued_date date,
	issued_book_isbn varchar(50),
	issued_emp_id varchar(20)

);

--  ADDDING FOREIGN KEY
alter table issued_status
add constraint fk_issued_status_members
foreign key (issued_member_id)
references members(member_id);

alter table issued_status
add constraint fk_issued_status_books2
foreign key (issued_book_isbn)
references books(isbn);

alter table issued_status
add constraint fk_issued_status_employee
foreign key (issued_emp_id)
references employee(emp_id);

alter table return_status
add constraint fk_issued_status_return_status
foreign key (issued_id)
references issued_status(issued_id);


alter table employee
add constraint fk_employee_branch
foreign key (branch_id)
references branch(branch_id);



-- DATA VISULATIONS

select count(*)
from books;

select count(*)
from branch;

select count(*)
from employee;

select count(*)
from members;

select count(*)
from return_status;

select count(*)
from issued_status;

select *from issued_status;
select* from books;
select* from employee;
select* from members;
select* from return_status;
select* from branch;






