create database Task7
use task7

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

INSERT INTO Customers VALUES
(1, 'Amit', 'Pune'),
(2, 'Sita', 'Mumbai'),
(3, 'Rahul', 'Delhi');

INSERT INTO Orders VALUES
(101, 1, 'Laptop', 55000.00),
(102, 1, 'Mouse', 700.00),
(103, 2, 'Mobile', 20000.00),
(104, 3, 'Keyboard', 1500.00);

--View
create view customer_spending as 
select c.customer_name,c.city,o.product,o.amount
from Customers c inner join Orders o on c.customer_id=o.customer_id

select * from customer_spending

-- example 2 
create view customer_order as 
select c.customer_name, sum(o.amount) as Total_spent
from customers c
inner join Orders o on c.customer_id=o.customer_id
group by c.customer_name

select * from customer_order