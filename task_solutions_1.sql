use library_project_2;

-- PROJECT TASK

-- Task 1. Create a New Book Record
-- "978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', 6.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.')"
select* from books;
insert into books
 values('978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', 6.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.');
 
-- Task 2: Update an Existing Member's Address
select* from members;
update members
set member_address = 'virar w'
where member_id = 'C101';

-- Task 3: Delete a Record from the Issued Status Table
-- Objective: Delete the record with issued_id = 'IS104' from the issued_status table.
select* from issued_status
delete from issued_status
where issued_id = 'IS130';

select* from return_status;

SELECT i.issued_id
FROM issued_status i
LEFT JOIN return_status r
  ON i.issued_id = r.issued_id
WHERE r.issued_id IS NULL;



-- Task 4: Retrieve All Books Issued by a Specific Employee
-- Objective: Select all books issued by the employee with emp_id = 'E101'.
select* from issued_status;
select* from employee;

select* 
from issued_status
where issued_emp_id = 'E101';


-- Task 5: List Members Who Have Issued More Than One Book
-- Objective: Use GROUP BY to find members who have issued more than one book.
select* from issued_status;

select
 issued_member_id,
 count(issued_id) as total_book_issued
from issued_status
group by issued_member_id
having count(issued_member_id) > 2;

-- ### 3. CTAS (Create Table As Select)

-- Task 6: Create Summary Tables**: Used CTAS to generate new tables based on query results - each book and total book_issued_cnt
create table book_count
as
select
	b.isbn,
    b.book_title,
    count(ist.issued_book_isbn) as no_issued
from books as b
join
issued_status as ist
on ist.issued_book_isbn = b.isbn
group by b.isbn;

select* from book_count;


-- ### 4. Data Analysis & Findings

-- Task 7. **Retrieve All Books in a Specific Category:
select* from books;
select
	category as specific_category,
	book_title
from books
group by category,book_title
having category = 'Children'
order by specific_category asc;


select *
from books
where category = 'Children';


-- Task 8: Find Total Rental Income by Category:
select 
	category,
    sum(rental_price) as total_rental_price_by_category
from books
group by category
order by category asc;


-- Task 9. **List Members Who Registered in the Last 180 Days**:
select* from members;

SELECT * FROM members
WHERE reg_date >= CURRENT_DATE - interval reg_date.days(180)    

select 
	reg_date(year) as year,
    reg_date(month) as month,
    reg_date(day) as day,
    date.now
from members

-- Task 10: List Employees with Their Branch Manager's Name and their branch details**:


-- Task 11. Create a Table of Books with Rental Price Above a Certain Threshold

-- Task 12: Retrieve the List of Books Not Yet Returned






