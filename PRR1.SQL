CREATE TABLE customers(
customersID INT PRIMARY KEY,
 name VARCHAR(50),
customer_EmaiL VARCHAR(100),
customer_address VARCHAR(100)
);
---INSERT AT LEAST 5 SAMPLE OF CUSTOMERS----
INSERT INTO customers(customersID,name,EmaiL,address )
 VALUES
(1, 'kavita' , 'kavita@xample.com', 'ahmedabad'),
(2 , 'bhavika' , 'bhavika@xample.com','ahmedabad'),
(3, 'sakshi' , 'sakshi@xample.com' , 'delhi'),
(4 , 'alice', 'alice@xample.com' , 'surat'),
(5 , 'bob', 'bob@xample.com' , 'nagpur');

---RETRIVE ALL CUSTOMERS DETAILS---
SELECT* FROM customers

---update CUSTOMERS ADDRESS--
UPDATE customers
SET customer_address ='ahmedabad'
WHERE customersID=5;
SELECT * FROM customers;

---delete customerid---
DELETE FROM customers WHERE customersID=3;

---display all customers whose name is alice---
SELECT*FROM customers WHERE name = 'alice'

---ORDER TABLE---
CREATE TABLE orders(
orderID INT PRIMARY KEY,
customersID INT , 
orderDATE DATE , 
totalamount DECIMAL (10,2),
FOREIGN KEY (customersID) REFERENCES customers(customersID)
);
---INSERT ATLEAST 5 SAMPLE  ORDERS ---
INSERT INTO orders(orderID,customersID,orderDATE,totalamount)
VALUES
(101 ,1 ,'2026-08-13' , 2000 ),
(102 ,2 ,'2026-08-15' , 2500 ),
(103 ,2 ,'2026-08-20' , 3000 ),
(104 ,4 ,'2026-10-13' , 3500 ),
(105 ,5 ,'2026-02-05' , 4000 );

---RETRIEVE ALL ORDER MADE BY A SPECIFIC CUSTOMER---
SELECT*FROM orders WHERE customersID=1;

----UPDATE AN ORDERS OF TOTALAMOUNT---
UPDATE orders
SET totalamount = 5000
WHERE orderID=105;

-----DELETE ORDER USING ORDERID----
DELETE FROM orders WHERE orderID=102;
SELECT * FROM orders

----RETREIVE ORDERS PLACED IN THE LAST 30 DAYS---
SELECT * FROM orders WHERE orderDATE >=CURRENT_DATE - INTERVAL '30 DAYS';

----RETREIVE THE HIGHEST LOWEST AND AVG ORDER----
SELECT MAX(totalamount) AS highest, MIN(totalamount) AS lowest, AVG(totalamount) AS average FROM orders;

---CREATE PRODUCT TABLE---
CREATE TABLE products(
    productID INT PRIMARY KEY,
    productname VARCHAR(200),
    price DECIMAL(10,2),
    stock INT
);
INSERT INTO products(productID, productname, price, stock)
VALUES
(111 , 'choco', 250.00 , 10),
(112 , 'keyboard', 2500.00 , 25),
(113 , 'mouse',1500.00,10),
(114 , 'cpu', 900.00 , 5);

----ALL PRODUCT SORTED IN DESC ORDERS---
SELECT * FROM products ORDER BY price DESC;

------UPDATE PRICE OF SPECIFIC PRODUCT----
UPDATE products
SET PRICE =1500
WHERE productID =114

-----DELETE PRODUCT WHICH IS OUT OF STOCK---
DELETE FROM products WHERE stock=1

----RETREIVE PRODUCT BETWEEN 500 TO 2000 PRICE----
SELECT * FROM products
WHERE price between 500.00 AND 2000.00;

----RETREIVE THE MOST EXPENSIVE AND THE CHEAPEST PRODUCT USING MAX() AND MIN()----
SELECT MAX (price) AS Mostexpensive FROM products;
SELECT MIN (price) AS cheapest FROM products;

------CREATE ORDERDETAILS TABLE ----
CREATE TABLE orderdetails(
orderID INT PRIMARY KEY ,
productID INT ,
quantity INT ,
sub_total DECIMAL(10,2),
FOREIGN KEY (orderID) REFERENCES orders (orderID),
FOREIGN KEY (productID) REFERENCES products(productID)
);
INSERT INTO orderdetails(orderID,productID,quantity,sub_total)
VALUES
(101,112,1,55000),
(103 ,113,3,65000),
(104,114,5,70000);

----retreive all the table speicfic order----
SELECT * FROM orderdetails;

----calculate total revenue from all the orders using SUM()----
SELECT SUM(sub_total) FROM orderdetails;

-----retreived top 3 most ordered products ----
SELECT productID , SUM(quantity) AS totalqauntity
FROM orderdetails 
GROUP BY productID
ORDER BY totalqauntity DESC 
LIMIT 3;
 ---- COUNT()  HOW MANY PRODUCTS ARE SOLD----
 SELECT COUNT(*)
 FROM orderdetails
 WHERE productID=112;
 



