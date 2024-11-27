USE SqlTaskDB;

CREATE TABLE tblRegister (
	EmployeeID INT IDENTITY PRIMARY KEY, 
	FirstName VARCHAR(255),
	LastName VARCHAR(255),
	BirthDate DATETIME,
	Age INT,
	Gender varchar(255),
	PhoneNumber varchar(255),
	EmailAddress varchar(255),
	City VARCHAR(255),
	Password_hash varchar(255)
);

INSERT INTO tblRegister (FirstName, LastName, BirthDate, Age, Gender, PhoneNumber, EmailAddress, City, Password_hash)
VALUES 
('John', 'Doe', '1985-07-15', 38, 'M', '1234567890', 'john.doe@example.com', 'New York', NULL),
('Jane', 'Smith', '1990-03-22', 33, 'F', '9876543210', 'jane.smith@example.com', 'Los Angeles', NULL),
('Alice', 'Johnson', '1982-11-05', 41, 'F', '5551234567', 'alice.johnson@example.com', 'Chicago', NULL),
('Bob', 'Brown', '1975-01-18', 49, 'M', '5559876543', 'bob.brown@example.com', 'Houston', NULL),
('Charlie', 'Taylor', '1995-09-30', 29, 'O', '5555555555', 'charlie.taylor@example.com', 'Phoenix', NULL);

SELECT * FROM tblRegister;

===============INSERT====================

	CREATE PROCEDURE SPI_Register
	@FirstName VARCHAR(255),
	@LastName VARCHAR(255),
	@BirthDate DATETIME,
	@Age INT,
	@Gender VARCHAR(255),
	@PhoneNumber VARCHAR(255),
	@EmailAddress VARCHAR(255),
	@City VARCHAR(255),
	@Password_hash VARCHAR(255) 
	AS
	BEGIN
		INSERT INTO tblRegister (FirstName,LastName,BirthDate,Age,Gender,PhoneNumber,EmailAddress,City,Password_hash)
		VALUES (@FirstName,@LastName,@BirthDate,@Age,@Gender,@PhoneNumber,@EmailAddress,@City,@Password_hash)
	END		

	EXEC SPI_Register @FirstName='Melvin' ,@lastName='Albert' , @BirthDate='2000-09-13' , @Age='24' ,@Gender ='M' , @PhoneNumber='9632587412' , @EmailAddress='Melvin@gmail.com' , @City='Kothamangalam' , @Password_hash='NULL'  

	SELECT * FROM tblRegister;



