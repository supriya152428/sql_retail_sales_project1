# 📊 Retail Sales Analysis Using SQL

This project presents a comprehensive analysis of retail sales data using SQL. It involves database design, data cleaning, exploration, and the extraction of business insights to support data-driven decision-making.

## 📁 Project Overview

- **Database**: `project_sql_2`
- **Primary Table**: `retail_sales`
- **Tech Stack**: PostgreSQL

The dataset includes details such as transaction ID, sale date and time, customer demographics, product categories, quantities sold, cost of goods sold (COGS), and total sales.

## 🔧 Database Setup

```sql
CREATE TABLE retail_sales (
    transactions_id INT PRIMARY KEY,
    sale_date DATE,
    sale_time TIME,
    customer_id INT,
    gender VARCHAR(15),
    age INT,
    category VARCHAR(15),
    quantiy INT,
    price_per_unit FLOAT,
    cogs FLOAT,
    total_sale FLOAT
);
```

## 🧹 Data Cleaning

To ensure data quality, the following steps were performed:
- Identified and removed rows containing `NULL` values.
- Verified data types and ensured logical consistency in sales records.

## 🔍 Exploratory Data Analysis (EDA)

- Total number of sales and unique customers
- Sales performance across product categories and demographics
- Time-based analysis (shift-wise and monthly trends)

## 🧠 Key Business Questions & Insights

1. Sales made on a specific date (`2022-11-05`)
2. High-quantity clothing sales in November 2022
3. Total sales and order counts by category
4. Average customer age for the Beauty category
5. Transactions with total sales > ₹1000
6. Transaction distribution by gender and category
7. Monthly average sales and best-performing months
8. Top 5 customers by total sales
9. Unique customer count per category
10. Order volume by time shifts (Morning, Afternoon, Evening)
11. Top-selling category overall
12. Busiest days by transaction count
13. Customers with more than 3 purchases

## 📈 SQL Techniques Applied

- Aggregations and grouping (`SUM`, `COUNT`, `AVG`)
- Filtering and conditional logic (`WHERE`, `CASE`, `HAVING`)
- Date and time functions (`EXTRACT`, `TO_CHAR`)
- Window functions (`RANK() OVER`)

## ✅ Project Status

- [x] Data Cleaning
- [x] Exploratory Analysis
- [x] Business Questioning and Insight Generation
- [ ] Dashboard Integration (Planned)

## 🚀 Future Enhancements

- Integrate visual dashboards using Power BI or Tableau
- Automate data pipelines for real-time analysis
- Expand analysis with customer segmentation

---
linkedin - https://www.linkedin.com/in/supriya-yadav-b1564b319

**Author**: *Supriya Yadav*  
  
