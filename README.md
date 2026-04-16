# 🎵 Online Music Store Analysis using SQL

## 📌 Overview
This project analyzes an online music store database to uncover key business insights related to customer behavior, sales performance, and revenue trends.

Using SQL, I explored the dataset to answer real-world business questions such as identifying top customers, best-selling artists, and high-revenue locations. The goal of this project is to demonstrate strong SQL skills along with analytical thinking.

---

## 🎯 Objectives
- Analyze customer purchasing behavior
- Identify top-selling artists, albums, and genres
- Evaluate revenue trends across countries and cities
- Discover high-value customers
- Generate actionable business insights

---

## 🛠️ Tools & Technologies
- **SQL** (PostgreSQL / MySQL / SQLite)
- **Chinook Database** (Music Store Dataset)
- **Git & GitHub**

---

## 📂 Dataset
The project uses the **Chinook Database**, which simulates a digital music store.

### Key Tables:
- `customers` – Customer details
- `invoices` – Purchase transactions
- `invoice_items` – Line-level sales data
- `tracks` – Songs available in the store
- `albums` – Album information
- `artists` – Artist details
- `genres` – Music categories

---

## 🧱 Database Schema
The database consists of multiple related tables connected through primary and foreign keys.

Example relationships:
- One customer → many invoices  
- One invoice → many invoice items  
- One track → one album → one artist  

---

## 📊 Key SQL Concepts Used

### 🟢 Beginner
- SELECT, WHERE, ORDER BY  
- LIMIT, COUNT, SUM, AVG  

### 🟡 Intermediate
- GROUP BY, HAVING  
- INNER JOIN  
- Subqueries  

### 🔴 Advanced
- Common Table Expressions (CTEs)  
- Window Functions (RANK, NTILE)  
- Complex Joins & Nested Queries  

---

## 📈 Business Questions Answered

### 🔹 Easy
- Who is the senior-most employee?
- Which country has the most invoices?
- What are the top 3 invoice totals?

### 🔹 Medium
- Which city generates the highest revenue?
- Who are the best customers?
- What are the most popular music genres?

### 🔹 Advanced
- Identify the top 10% customers based on spending
- Find the most profitable artist
- Analyze customer purchase patterns across regions

---

## 📁 Project Structure
music-store-sql-analysis/
│
├── README.md
├── dataset/
│ └── chinook.db
│
├── schema/
│ └── schema.sql
│
├── queries/
│ ├── easy.sql
│ ├── medium.sql
│ └── advanced.sql
│
├── insights/
│ └── insights.md
│
└── screenshots/
└── (query outputs / charts)

Schema- Music Store Database






