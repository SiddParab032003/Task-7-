# Task-7-
Sql Task 7
# Task 7 – Creating Views in SQL  

##  Objective  
The goal of this task is to learn how to create and use SQL Views. Views allow us to simplify queries, provide abstraction, and improve security by controlling access to underlying data.  

## 🗄 Database Setup  

CREATE DATABASE Task7;  
USE Task7;  

##  Table Creation  

CREATE TABLE Customers (  
    customer_id INT PRIMARY KEY,  
    customer_name VARCHAR(50),  
    city VARCHAR(50)  
);  

CREATE TABLE Orders (  
    order_id INT PRIMARY KEY,  
    customer_id INT,  
    product VARCHAR(50),  
    amount DECIMAL(10,2),  
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)  
);  

##  Sample Data  

INSERT INTO Customers VALUES  
(1, 'Amit', 'Pune'),  
(2, 'Sita', 'Mumbai'),  
(3, 'Rahul', 'Delhi');  

INSERT INTO Orders VALUES  
(101, 1, 'Laptop', 55000.00),  
(102, 1, 'Mouse', 700.00),  
(103, 2, 'Mobile', 20000.00),  
(104, 3, 'Keyboard', 1500.00);  

## 👀 Views  

### 1. customer_spending  
This view shows customer details along with their purchased products and amount.  

CREATE VIEW customer_spending AS  
SELECT c.customer_name, c.city, o.product, o.amount  
FROM Customers c  
INNER JOIN Orders o ON c.customer_id = o.customer_id;  

Example Usage:  
SELECT * FROM customer_spending;  

### 2. customer_order  
This view shows the total spending of each customer.  

CREATE VIEW customer_order AS  
SELECT c.customer_name, SUM(o.amount) AS Total_spent  
FROM Customers c  
INNER JOIN Orders o ON c.customer_id = o.customer_id  
GROUP BY c.customer_name;  

Example Usage:  
SELECT * FROM customer_order;  


## Key Learnings  
- A View is a virtual table created from SQL queries.  
- Views help in abstraction, security, and reusability.  
- We can use aggregate functions (like SUM) inside views.  
