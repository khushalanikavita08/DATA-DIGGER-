# DATA-DIGGER-
<div align="center">

![Header](https://capsule-render.vercel.app/api?type=waving&color=gradient&customColorList=6,11,20&height=270&section=header&text=SQL%20DATA%20VAULT&fontSize=60&fontColor=ffffff&animation=fadeIn&fontAlignY=38&desc=Database%20Design%20%7C%20CRUD%20%7C%20Aggregates%20%7C%20Analytics&descAlignY=58&descSize=20)

[![Typing SVG](https://readme-typing-svg.demolab.com?font=Fira+Code&weight=600&size=22&duration=3000&pause=800&color=F7B801&center=true&vCenter=true&width=650&lines=Learning+SQL+one+query+at+a+time...;Customers+%E2%9E%A4+Orders+%E2%9E%A4+Products+%E2%9E%A4+OrderDetails;JOINS+%7C+AGGREGATES+%7C+CRUD+%7C+FILTERS;Made+with+%E2%9D%A4%EF%B8%8F+by+Kavita+Khushalani)](https://git.io/typing-svg)

![SQL](https://img.shields.io/badge/SQL-4479A1?style=for-the-badge&logo=postgresql&logoColor=white)
![Database](https://img.shields.io/badge/Database-PostgreSQL%2FMySQL-blue?style=for-the-badge&logo=database&logoColor=white)
![Status](https://img.shields.io/badge/Status-Completed-brightgreen?style=for-the-badge)
![Level](https://img.shields.io/badge/Level-Beginner--Intermediate-orange?style=for-the-badge)
![License](https://img.shields.io/badge/License-MIT-lightgrey?style=for-the-badge)

</div>

<div align="center">

> 💭 *"Data is the new oil, but SQL is the engine that refines it."*

</div>

<br>

## **📌 Project Overview**

This project simulates the backend database of a simple **e-commerce platform**. It covers database design, CRUD operations, foreign-key relationships, aggregate functions, and analytical queries across four related tables — **Customers, Orders, Products, and OrderDetails**.

<br>

## **🗂️ Database Schema**

| Table | Description |
|:------|:------------|
| 🧑 `customers` | Stores customer details — ID, name, email, address |
| 📦 `orders` | Stores order info linked to a customer |
| 🛒 `products` | Stores product catalog with price & stock |
| 🧾 `orderdetails` | Bridge table linking orders ↔ products with quantity & subtotal |

```sql
CREATE TABLE customers (
    customerID   INT PRIMARY KEY,
    name         VARCHAR(50),
    email        VARCHAR(100),
    address      VARCHAR(100)
);

CREATE TABLE orders (
    orderID      INT PRIMARY KEY,
    customerID   INT,
    orderDate    DATE,
    totalAmount  DECIMAL(10,2),
    FOREIGN KEY (customerID) REFERENCES customers(customerID)
);

CREATE TABLE products (
    productID    INT PRIMARY KEY,
    productName  VARCHAR(200),
    price        DECIMAL(10,2),
    stock        INT
);

CREATE TABLE orderdetails (
    orderDetailID INT PRIMARY KEY,
    orderID       INT,
    productID     INT,
    quantity      INT,
    subTotal      DECIMAL(10,2),
    FOREIGN KEY (orderID) REFERENCES orders(orderID),
    FOREIGN KEY (productID) REFERENCES products(productID)
);
```

> ⚠️ **Note:** A few small syntax fixes were made from the original draft — missing commas, mismatched column names (`cust_EmaiL` → `email`, `customer address` → `address`), and a missing `CREATE TABLE orders` line. `orderdetails` also got its own primary key since `orderID` repeats across multiple products in the same order.

<br>

## **⚙️ Operations Covered**

- ✅ **INSERT** — Adding sample records into all 4 tables
- 🔍 **SELECT** — Retrieving full/filtered data
- ✏️ **UPDATE** — Modifying address, price, and order amount
- ❌ **DELETE** — Removing customers, orders & out-of-stock products
- 📅 **Date Filtering** — Orders placed in the last 30 days
- 📊 **Aggregate Functions** — `MAX()`, `MIN()`, `AVG()`, `SUM()`, `COUNT()`
- 🏆 **GROUP BY + ORDER BY + LIMIT** — Top 3 most ordered products
- 🔗 **Foreign Keys** — Relational integrity between all tables

<br>

## **💡 Sample Query Highlights**

**🏅 Top 3 Most Ordered Products**
```sql
SELECT productID, SUM(quantity) AS totalQuantity
FROM orderdetails
GROUP BY productID
ORDER BY totalQuantity DESC
LIMIT 3;
```

**💰 Total Revenue Generated**
```sql
SELECT SUM(subTotal) AS totalRevenue FROM orderdetails;
```

**📈 Highest, Lowest & Average Order Value**
```sql
SELECT MAX(totalAmount) AS highest,
       MIN(totalAmount) AS lowest,
       AVG(totalAmount) AS average
FROM orders;
```

<br>

## **🛠️ Tech & Skills Used**

![SQL Badge](https://img.shields.io/badge/Language-SQL-blue?style=flat-square&logo=mysql)
![Joins](https://img.shields.io/badge/Concept-Joins-yellow?style=flat-square)
![Aggregates](https://img.shields.io/badge/Concept-Aggregate%20Functions-orange?style=flat-square)
![CRUD](https://img.shields.io/badge/Concept-CRUD%20Operations-brightgreen?style=flat-square)
![Constraints](https://img.shields.io/badge/Concept-Primary%2FForeign%20Keys-purple?style=flat-square)

<br>

## **🚀 How to Use**

1. Clone this repository
2. Open your favorite SQL client (PostgreSQL / MySQL Workbench / SQLite)
3. Run the schema creation scripts first, then the `INSERT` statements
4. Explore the queries section by section
5. Modify and experiment — that's the best way to learn! 🧠

<br>

## **🤝 Contributing**

Contributions are always welcome! If you'd like to add more queries, optimize existing ones, or fix something:

1. 🍴 Fork this repository
2. 🌿 Create a new branch (`git checkout -b feature/new-query`)
3. 💾 Commit your changes
4. 📤 Push and open a Pull Request

Even small improvements like better comments or additional edge-case queries are appreciated! 🌟

<br>

## **📬 Feedback**

Got suggestions, spotted a bug, or have an idea to make this better?

💌 Feel free to open an **Issue** or drop a **Pull Request** — all feedback is welcome and genuinely appreciated! Your input helps this project grow. 🌱

<br>

<div align="center">

> 💭 *"Every expert was once a beginner who refused to give up."*

## **✨ Author**

**Kavita Khushalani**

![Profile Badge](https://img.shields.io/badge/Author-Kavita%20Khushalani-ff69b4?style=for-the-badge&logo=github&logoColor=white)
![Learning](https://img.shields.io/badge/Always-Learning-9cf?style=for-the-badge)
![SQL Lover](https://img.shields.io/badge/SQL-Enthusiast-critical?style=for-the-badge)

![Footer](https://capsule-render.vercel.app/api?type=waving&color=gradient&customColorList=6,11,20&height=150&section=footer)

</div>
