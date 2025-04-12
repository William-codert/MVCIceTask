CREATE DATABASE ProductsDb;
GO
USE ProductsDb;

CREATE TABLE Products (
    Id INT PRIMARY KEY IDENTITY,
    Name NVARCHAR(100),
    Price DECIMAL(10, 2)
);

INSERT INTO Products (Name, Price) VALUES
('Laptop', 999.99),
('Smartphone', 499.99),
('Headphones', 79.99);
