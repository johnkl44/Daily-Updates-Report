CREATE DATABASE InvertoryManagementDB;

USE InvertoryManagmentDB

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName NVARCHAR(100) NOT NULL,
    Quantity INT NOT NULL,
    PricePerUnit DECIMAL(18, 2) NOT NULL,
    Supplier NVARCHAR(100) NOT NULL
);


INSERT INTO Products (ProductID, ProductName, Quantity, PricePerUnit, Supplier)
VALUES 
(1, 'Laptop', 50, 1200.00, 'TechSupplier Inc.'),
(2, 'Mouse', 200, 25.00, 'AccessoriesHub'),
(3, 'Keyboard', 150, 45.00, 'AccessoriesHub'),
(4, 'Monitor', 80, 300.00, 'DisplayWorld'),
(5, 'Printer', 40, 150.00, 'PrintTech Solutions'),
(6, 'External Hard Drive', 70, 85.50, 'Storage Experts'),
(7, 'USB Cable', 500, 5.00, 'CablePro Supplies');

SELECT * FROM Products;

=== CRUD using Stored Procedure =====

CREATE PROCEDURE SPI_Products
	@ProductID INT,
	@ProductName NVARCHAR,
	@Quantity INT,
	@PricePerUnit DECIMAL,
	@Supplier NVARCHAR
	AS
	BEGIN
		INSERT INTO Products (ProductID,ProductName,Quantity,PricePerUnit,Supplier)
		VALUES (@ProductID,@ProductName,@Quantity,@PricePerUnit,@Supplier)
	END


