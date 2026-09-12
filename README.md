# DATA-DIGGER-
<div align="center">

![Header](https://capsule-render.vercel.app/api?type=waving&color=gradient&customColorList=6,11,20&height=280&section=header&text=SQL%20DATA%20VAULT&fontSize=62&fontColor=ffffff&animation=fadeIn&fontAlignY=36&desc=Database%20Design%20%7C%20CRUD%20%7C%20Aggregates%20%7C%20Analytics&descAlignY=58&descSize=20)

[![Typing SVG](https://readme-typing-svg.demolab.com?font=Fira+Code&weight=700&size=24&duration=3000&pause=800&color=F7B801&center=true&vCenter=true&width=700&lines=Learning+SQL+one+query+at+a+time...;Customers+%E2%9E%A4+Orders+%E2%9E%A4+Products+%E2%9E%A4+OrderDetails;JOINS+%7C+AGGREGATES+%7C+CRUD+%7C+FILTERS;Made+with+%E2%9D%A4%EF%B8%8F+by+Kavita+Khushalani)](https://git.io/typing-svg)

<br>

![SQL](https://img.shields.io/badge/SQL-4479A1?style=for-the-badge&logo=postgresql&logoColor=white)
![Database](https://img.shields.io/badge/Database-PostgreSQL%2FMySQL-00758F?style=for-the-badge&logo=mysql&logoColor=white)
![Status](https://img.shields.io/badge/Status-Completed-brightgreen?style=for-the-badge&logo=checkmarx&logoColor=white)
![Level](https://img.shields.io/badge/Level-Beginner--Intermediate-orange?style=for-the-badge)
![License](https://img.shields.io/badge/License-MIT-lightgrey?style=for-the-badge)
![Maintained](https://img.shields.io/badge/Maintained-Yes-success?style=for-the-badge)

![Visitors](https://komarev.com/ghpvc/?username=kavitakhushalani-sqlvault&label=Profile%20Views&color=ff69b4&style=for-the-badge)
![Stars](https://img.shields.io/badge/⭐-Give%20it%20a%20Star-yellow?style=for-the-badge)
![Forks](https://img.shields.io/badge/🍴-Fork%20%26%20Learn-blueviolet?style=for-the-badge)

</div>

<div align="center">

> 💭 *"Data is the new oil, but SQL is the engine that refines it."*

</div>

<br>

![divider](https://capsule-render.vercel.app/api?type=rect&color=gradient&customColorList=0,2,2,5,30&height=3&section=header)

## **📖 Table of Contents**

<div align="center">

| 📌 | 🗂️ | ⚙️ | 💡 | 🛠️ | 🚀 | 🤝 | 📬 | 🙏 |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| [Overview](#-project-overview) | [Schema](#️-database-schema) | [Operations](#️-operations-covered) | [Queries](#-sample-query-highlights) | [Tech Stack](#️-tech--skills-used) | [Usage](#-how-to-use) | [Contribute](#-contributing) | [Feedback](#-feedback) | [Thanks](#-thank-you) |

</div>

![divider](https://capsule-render.vercel.app/api?type=rect&color=gradient&customColorList=0,2,2,5,30&height=3&section=header)

<br>

## **📌 Project Overview**

<img align="right" width="180" src="https://media.giphy.com/media/qgQUggAC3Pfv687qPC/giphy.gif">

This project simulates the backend database of a simple **e-commerce platform** 🛍️. It covers database design, CRUD operations, foreign-key relationships, aggregate functions, and analytical queries across four related tables:

- 🧑 **Customers** — who's buying
- 📦 **Orders** — what they bought & when
- 🛒 **Products** — the catalog & inventory
- 🧾 **OrderDetails** — the bridge tying it all together

<br clear="right">

![divider](https://capsule-render.vercel.app/api?type=rect&color=gradient&customColorList=2,8,22&height=3&section=header)

## **🗂️ Database Schema**

<div align="center">

```mermaid
erDiagram
    CUSTOMERS ||--o{ ORDERS : places
    ORDERS ||--o{ ORDERDETAILS : contains
    PRODUCTS ||--o{ ORDERDETAILS : includes

    CUSTOMERS {
        int customerID PK
        string name
        string email
        string address
    }
    ORDERS {
        int orderID PK
        int customerID FK
        date orderDate
        decimal totalAmount
    }
    PRODUCTS {
        int productID PK
        string productName
        decimal price
        int stock
    }
    ORDERDETAILS {
        int orderDetailID PK
        int orderID FK
        int productID FK
        int quantity
        decimal subTotal
    }
```

</div>

| Table | Description |
|:------|:------------|
| 🧑 `customers` | Stores customer details — ID, name, email, address |
| 📦 `orders` | Stores order info linked to a customer |
| 🛒 `products` | Stores product catalog with price & stock |
| 🧾 `orderdetails` | Bridge table linking orders ↔ products with quantity & subtotal |

<details>
<summary>🔍 <b>Click to expand full CREATE TABLE scripts</b></summary>

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

</details>

> ⚠️ **Note:** A few small syntax fixes were made from the original draft — missing commas, mismatched column names (`cust_EmaiL` → `email`, `customer address` → `address`), and a missing `CREATE TABLE orders` line. `orderdetails` also got its own primary key since `orderID` repeats across multiple products in the same order.

![divider](https://capsule-render.vercel.app/api?type=rect&color=gradient&customColorList=12,18,25&height=3&section=header)

## **⚙️ Operations Covered**

<div align="center">

| Operation | Description |
|:---------:|:-------------|
| ✅ **INSERT** | Adding sample records into all 4 tables |
| 🔍 **SELECT** | Retrieving full/filtered data |
| ✏️ **UPDATE** | Modifying address, price, and order amount |
| ❌ **DELETE** | Removing customers, orders & out-of-stock products |
| 📅 **Date Filtering** | Orders placed in the last 30 days |
| 📊 **Aggregates** | `MAX()` `MIN()` `AVG()` `SUM()` `COUNT()` |
| 🏆 **GROUP BY + LIMIT** | Top 3 most ordered products |
| 🔗 **Foreign Keys** | Relational integrity between all tables |

</div>

![divider](https://capsule-render.vercel.app/api?type=rect&color=gradient&customColorList=4,22,30&height=3&section=header)

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

![divider](https://capsule-render.vercel.app/api?type=rect&color=gradient&customColorList=6,14,20&height=3&section=header)

## **🛠️ Tech & Skills Used**

<div align="center">

![skills](https://skillicons.dev/icons?i=mysql,postgres,sqlite,git,github&theme=dark)

<br><br>

![SQL Badge](https://img.shields.io/badge/Language-SQL-blue?style=flat-square&logo=mysql)
![Joins](https://img.shields.io/badge/Concept-Joins-yellow?style=flat-square)
![Aggregates](https://img.shields.io/badge/Concept-Aggregate%20Functions-orange?style=flat-square)
![CRUD](https://img.shields.io/badge/Concept-CRUD%20Operations-brightgreen?style=flat-square)
![Constraints](https://img.shields.io/badge/Concept-Primary%2FForeign%20Keys-purple?style=flat-square)
![ERD](https://img.shields.io/badge/Concept-ER%20Diagrams-ff69b4?style=flat-square)

</div>

![divider](https://capsule-render.vercel.app/api?type=rect&color=gradient&customColorList=8,16,24&height=3&section=header)

## **🚀 How to Use**

1. 📥 Clone this repository
2. 🖥️ Open your favorite SQL client (PostgreSQL / MySQL Workbench / SQLite)
3. 🏗️ Run the schema creation scripts first, then the `INSERT` statements
4. 🔎 Explore the queries section by section
5. 🧪 Modify and experiment — that's the best way to learn!

![divider](https://capsule-render.vercel.app/api?type=rect&color=gradient&customColorList=10,20,28&height=3&section=header)

## **🤝 Contributing**

Contributions are always welcome! If you'd like to add more queries, optimize existing ones, or fix something:

```
🍴 Fork  ➜  🌿 Branch  ➜  💾 Commit  ➜  📤 Push  ➜  🔁 Pull Request
```

Even small improvements like better comments or additional edge-case queries are appreciated! 🌟

![divider](https://capsule-render.vercel.app/api?type=rect&color=gradient&customColorList=1,9,17&height=3&section=header)

## **📬 Feedback**

Got suggestions, spotted a bug, or have an idea to make this better?

💌 Feel free to open an **Issue** or drop a **Pull Request** — all feedback is welcome and genuinely appreciated! Your input helps this project grow. 🌱

![divider](https://capsule-render.vercel.app/api?type=rect&color=gradient&customColorList=3,15,26&height=3&section=header)

<div align="center">

> 💭 *"Every expert was once a beginner who refused to give up."*

## **✨ Author**

<img src="https://api.dicebear.com/7.x/initials/svg?seed=Kavita%20Khushalani&backgroundColor=6a11cb,2575fc&backgroundType=gradientLinear" width="90" style="border-radius:50%"/>

### **Kavita Khushalani**

![Profile Badge](https://img.shields.io/badge/Author-Kavita%20Khushalani-ff69b4?style=for-the-badge&logo=github&logoColor=white)
![Learning](https://img.shields.io/badge/Always-Learning-9cf?style=for-the-badge)
![SQL Lover](https://img.shields.io/badge/SQL-Enthusiast-critical?style=for-the-badge)

</div>

<br>

## **🙏 Thank You**

<div align="center">

Thanks a ton for checking out this project! ⭐ If you found it useful, don't forget to **star this repo** — it motivates a lot and helps others discover it too. Happy Querying! 🎉

![Visitors](https://img.shields.io/badge/Visitors-Welcome-ff69b4?style=for-the-badge)
![Star](https://img.shields.io/badge/⭐-Star%20this%20Repo-yellow?style=for-the-badge)
![Thanks](https://img.shields.io/badge/Thank%20You-For%20Visiting-blueviolet?style=for-the-badge)

![Footer](https://capsule-render.vercel.app/api?type=waving&color=gradient&customColorList=6,11,20&height=160&section=footer)

</div> 
