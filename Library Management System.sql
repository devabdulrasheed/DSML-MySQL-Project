
/*
  Create a database named library and create following TABLES in the database: 
  1.  Branch 
  2.  Employee 
  3.  Customer 
  4.  IssueStatus 
  5.  ReturnStatus 
  6.  Books
*/ 

CREATE DATABASE Library;
USE Library;


/*1.  
Table : Branch 
 Branch_no - Set as PRIMARY KEY 
 Manager_Id 
 Branch_address 
 Contact_no 
*/

CREATE TABLE tblBranch (
  Branch_no INT PRIMARY KEY,
  Manager_Id INT,
  Branch_address VARCHAR(100),
  Contact_no INT
);

INSERT INTO tblBranch (Branch_no, Manager_Id, Branch_address, Contact_no) VALUES
(1, 101, '123 Main St', '987654321'),
(2, 102, '677 Second St', '132245645'),
(3, 103, '899 First St', '14547454'),
(4, 104, '567 Walnut St', '15466975'),
(5, 105, '789 Cherry St', '16689774'),
(6, 106, '901 Pineapple St', '66669999');


/*2.  
Table : Employee 
 Emp_Id – Set as PRIMARY KEY 
 Emp_name 
 Position 
 Salary 
Please Note: Manager_Id from Branch table can be considered as Emp_Id in 
Employee table. 
*/

CREATE TABLE tblEmployee (
  Emp_Id INT PRIMARY KEY,
  Emp_name VARCHAR(20),
  Position VARCHAR(20),
  Salary INT
);
INSERT INTO tblEmployee (Emp_Id, Emp_name, Position, Salary) VALUES
(101, 'John Smith', 'Manager', 60000),
(151, 'Jane Doe', 'Assistant', 45000),
(158, 'Mark Johnson', 'Assistant', 55000),
(201, 'Emily Brown', 'Clerk', 35000),
(153, 'Jessica Adams', 'Assistant', 50000),
(106, 'Andrew Wilson', 'Manager', 65000),
(155, 'Sophia Thompson', 'Assistant', 48000),
(208, 'Jacob Roberts', 'Clerk', 36000),
(102, 'George Wilson', 'Manager', 75000),
(103, 'Andrew Johnson', 'Manager', 65000),
(104, 'Ben Thompson', 'Manager', 50000),
(105, 'Fabiola Bush', 'Manager', 72000);

 
/*3.  
Table : Customer 
 Customer_Id - Set as PRIMARY KEY 
 Customer_name 
 Customer_address 
 Reg_date 
*/

 
CREATE TABLE tblCustomer (
  Customer_Id INT PRIMARY KEY,
  Customer_name VARCHAR(20),
  Customer_address VARCHAR(50),
  Reg_date DATE
);
INSERT INTO tblCustomer (Customer_Id, Customer_name, Customer_address, Reg_date) VALUES
(1, 'Michael Lee', '111 Pine St', '2021-08-15'),
(2, 'Sarah Miller', '222 Maple Ave', '2021-01-20'),
(3, 'David Wilson', '333 Oak Ln', '2023-03-10'),
(4, 'Emma Davis', '444 Elm St', '2022-05-10'),
(5, 'Liam Johnson', '555 Oak Ln', '2023-01-05'),
(6, 'Olivia Smith', '666 Maple Ave', '2023-04-20');


/*4.  
Table : IssueStatus 
 Issue_Id - Set as PRIMARY KEY 
 Issued_cust – Set as FOREIGN KEY and it refer customer_id in 
CUSTOMER table 
 Issued_book_name 
 Issue_date 
 Isbn_book – Set as FOREIGN KEY and it should refer isbn in 
BOOKS table 
*/

CREATE TABLE tblIssueStatus (
  Issue_Id INT PRIMARY KEY,
  Issued_cust INT,
  Issued_book_name VARCHAR(50),
  Issue_date DATE,
  Isbn_book VARCHAR(25),
  FOREIGN KEY (Issued_cust) REFERENCES tblCustomer(Customer_Id),
  FOREIGN KEY (Isbn_book) REFERENCES tblBooks(ISBN)
);
INSERT INTO tblIssueStatus (Issue_Id, Issued_cust, Issued_book_name, Issue_date, Isbn_book) VALUES
(1, 1, 'Book A', '2023-06-05', 'ISBN001'),
(2, 5, 'Book B', '2023-06-10', 'ISBN002'),
(3, 3, 'Book C', '2023-06-12', 'ISBN003'),
(4, 1, 'Book D', '2023-06-15', 'ISBN004'),
(5, 4, 'Book E', '2023-06-05', 'ISBN005'),
(6, 5, 'Book F', '2023-06-10', 'ISBN006'),
(7, 6, 'Book G', '2023-06-12', 'ISBN007'),
(8, 4, 'Book H', '2023-06-15', 'ISBN008'),
(9, 6, 'Book I', '2023-01-05', 'ISBN009');



/*  5.  
Table : ReturnStatus 
 Return_Id - Set as PRIMARY KEY 
 Return_cust 
 Return_book_name 
 Return_date 
 Isbn_book2 - Set as FOREIGN KEY and it should refer isbn in 
BOOKS table 
*/

CREATE TABLE tblReturnStatus(
  Return_Id INT PRIMARY KEY,
  Return_cust INT,
  Return_book_name VARCHAR(255),
  Return_date DATE,
  Isbn_book2 VARCHAR(25),
  FOREIGN KEY (Isbn_book2) REFERENCES Books(ISBN)
);
INSERT INTO tblReturnStatus (Return_Id, Return_cust, Return_book_name, Return_date, Isbn_book2) VALUES
(1, 1, 'Book A', '2023-06-18', 'ISBN001'),
(2, 2, 'Book B', '2023-06-20', 'ISBN002'),
(3, 3, 'Book C', '2023-06-21', 'ISBN003'),
(4, 4, 'Book E', '2023-06-18', 'ISBN005'),
(5, 5, 'Book F', '2023-06-20', 'ISBN006'),
(6, 6, 'Book G', '2023-06-21', 'ISBN007');

 
/*6.  
Table :Books 
 ISBN  - Set as PRIMARY KEY 
 Book_title 
 Category 
 Rental_Price 
 Status [Give yes if book available and no if book not available] 
 Author 
 Publisher 
*/

CREATE TABLE tblBooks (
  ISBN VARCHAR(25) PRIMARY KEY,
  Book_title VARCHAR(255),
  Category VARCHAR(255),
  Rental_Price DECIMAL(10, 2),
  Status ENUM('yes', 'no'),
  Author VARCHAR(255),
  Publisher VARCHAR(255)
);

INSERT INTO tblBooks (ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher) VALUES
('ISBN001', 'Book A', 'Fiction', 10.00, 'yes', 'John Smith', 'ABC Publishing'),
('ISBN002', 'Book B', 'Mystery', 8.50, 'yes', 'Sarah Johnson', 'XYZ Books'),
('ISBN003', 'Book C', 'History', 12.00, 'no', 'Michael Brown', 'DEF Publishers'),
('ISBN004', 'Book D', 'Fiction', 9.00, 'yes', 'Emily Davis', 'GHI Press'),
('ISBN005', 'Book E', 'Science Fiction', 11.00, 'yes', 'Emily Johnson', 'JKL Publishing'),
('ISBN006', 'Book F', 'Romance', 9.50, 'yes', 'Daniel Wilson', 'MNO Books'),
('ISBN007', 'Book G', 'Biography', 10.00, 'no', 'Sophia Adams', 'PQR Publishers'),
('ISBN008', 'Book H', 'Fiction', 8.00, 'yes', 'Liam Davis', 'STU Press'),
('ISBN009', 'Book I', 'History', 10.00, 'yes', 'John Smith', 'ABC Publishing');




# Write the queries for the following: 
#1.  Retrieve the book title, category, and rental price of all available books. 

SELECT Book_title, Category, Rental_Price FROM tblBooks WHERE Status = 'yes';


# 2. List the employee names and their respective salaries in descending order of salary. 
SELECT Emp_name, Salary FROM tblEmployee ORDER BY Salary DESC;

# 3.Retrieve the book titles and the corresponding customers who have issued those books.
 SELECT istat.Issued_book_name AS Book_title, cust.Customer_name FROM tblIssueStatus istat INNER JOIN tblCustomer cust
 ON istat.Issued_cust = cust.Customer_Id;

# 4.Display the total count of books in each category. 
SELECT Category,COUNT(ISBN) FROM tblBooks GROUP BY Category;

# 5.Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000.
SELECT Emp_name, Position FROM tblEmployee WHERE Salary>50000;

# 6. List the customer names who registered before 2022-01-01 and have not issued any books yet. 
SELECT cust.Customer_name FROM tblCustomer cust LEFT JOIN tblIssueStatus istat ON cust.Customer_Id = istat.Issued_cust
WHERE cust.Reg_date <'2022-01-01' AND istat.Issued_cust IS NULL ;

# 7. Display the branch numbers and the total count of employees in each branch.
SELECT br.Branch_no, COUNT(emp.Emp_Id) FROM tblBranch br LEFT JOIN tblEmployee emp ON br.Manager_Id = 
emp.Emp_Id GROUP BY br.Branch_no;

# 8.Display the names of customers who have issued books in the month of June 2023.
SELECT cust.Customer_name FROM tblCustomer cust INNER JOIN IssueStatus istat ON cust.Customer_Id = istat.Issued_cust
WHERE istat.Issue_date LIKE '2023-06-__';
 
# 9. Retrieve book_title from book table containing history. 
SELECT Book_title FROM tblBooks WHERE Category = 'History';

# 10.Retrieve the branch numbers along with the count of employees for branches having more than 5 employees.
SELECT br.Branch_no, count(emp.Emp_id) FROM tblBranch br INNER JOIN tblEmployee emp ON br.Manager_Id = emp.Emp_Id GROUP BY br.Branch_no HAVING count(emp.Emp_Id)>5 ;
