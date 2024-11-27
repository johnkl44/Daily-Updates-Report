CREATE DATABASE SqlTaskDB;

CREATE TABLE tblEmployee (
	EmployeeID INT IDENTITY PRIMARY KEY, 
	EmployeeName VARCHAR(255),
	Designation VARCHAR(255),
	BirthDate DATETIME
);

CREATE TABLE tblSalary(
	SalaryID INT IDENTITY PRIMARY KEY,
	EmployeeID INT FOREIGN KEY REFERENCES tblEmployee(EmployeeID) ON DELETE CASCADE,
	SalaryAmount FLOAT(8),
	SalaryDate DATETIME
);

INSERT INTO tblEmployee (EmployeeName, Designation, BirthDate) VALUES
	('John Doe', 'Manager', '1985-01-15'),
	('Jane Smith', 'Developer', '1990-06-25'),
	('Alice Johnson', 'HR', '1987-09-10'),
	('Robert Brown', 'Analyst', '1992-03-18'),
	('Emily Davis', 'Accountant', '1989-11-22'),
	('Michael Wilson', 'Team Lead', '1983-05-30'),
	('Sarah White', 'QA Tester', '1991-08-09'),
	('David Miller', 'DevOps Engineer', '1986-12-12'),
	('Sophia Taylor', 'Designer', '1993-02-05'),
	('Daniel Moore', 'Intern', '1995-07-20');

INSERT INTO tblSalary (EmployeeID, SalaryAmount, SalaryDate) VALUES
	(1, 80000, '2024-01-01'),
	(2, 60000, '2024-01-01'),
	(3, 50000, '2024-01-01'),
	(4, 55000, '2024-01-01'),
	(5, 48000, '2024-01-01'),
	(6, 70000, '2024-01-01'),
	(7, 52000, '2024-01-01'),
	(8, 65000, '2024-01-01'),
	(9, 47000, '2024-01-01'),
	(10, 35000, '2024-01-01'),

	(1, 82000, '2024-02-01'),
	(2, 61000, '2024-02-01'),
	(3, 51000, '2024-02-01'),
	(4, 56000, '2024-02-01'),
	(5, 49000, '2024-02-01'),
	(6, 71000, '2024-02-01'),
	(7, 53000, '2024-02-01'),
	(8, 66000, '2024-02-01'),
	(9, 48000, '2024-02-01'),
	(10, 36000, '2024-02-01');

SELECT * FROM tblEmployee;

SELECT * FROM tblSalary; 

SELECT e.EmployeeName, e.Designation, s.SalaryAmount 
FROM tblEmployee e JOIN tblSalary s
ON e.EmployeeID = s.EmployeeID
ORDER BY e.EmployeeName ASC, s.SalaryAmount ASC;

SELECT e.EmployeeName, e.Designation, s.SalaryAmount 
FROM tblEmployee e LEFT OUTER JOIN tblSalary s
ON e.EmployeeID = s.EmployeeID
ORDER BY e.EmployeeName ASC, s.SalaryAmount ASC;

SELECT e.EmployeeName, e.Designation, s.SalaryAmount 
FROM tblEmployee e RIGHT OUTER JOIN tblSalary s
ON e.EmployeeID = s.EmployeeID
ORDER BY e.EmployeeName ASC, s.SalaryAmount ASC;

SELECT e.EmployeeName, e.Designation, s.SalaryAmount 
FROM tblEmployee e FULL OUTER JOIN tblSalary s
ON e.EmployeeID = s.EmployeeID
ORDER BY e.EmployeeName ASC, s.SalaryAmount ASC;


