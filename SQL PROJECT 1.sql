---sql retail sales analysis-p1
create database  project_sql_2;

----create table
drop table if exists retail_sales;
create table retail_sales(
transactions_id int primary key,
sale_date date,
sale_time time,	
customer_id	int,
gender varchar(15),
age	int,
category varchar(15),	
quantiy	int,
price_per_unit float,
cogs float,	
total_sale float
);
select*from retail_sales
limit 11

select
count(*)
from retail_sales

--DATA CLEANING
select*from retail_sales
where
transactions_id is null
or 
sale_date is null
or
sale_time is null
or
customer_id is null
or
gender is null
or
age is null
or
category is null
or
quantiy is null
or
cogs is null
or
total_sale is null;
---
DELETE FROM retail_sales
where
transactions_id is null
or 
sale_date is null
or
sale_time is null
or
customer_id is null
or
gender is null
or
age is null
or
category is null
or
quantiy is null
or
cogs is null
or
total_sale is null;

---DATA EXPLORATION---

--HOW MANY SALES WE HAVE?
SELECT COUNT(*) as total_sale from retail_sales

--HOW MANY UNIQUE CUSTOMERS WE HAVE?
SELECT COUNT(DISTINCT customer_id) as total_sales from retail_sales

--DATA ANALYSIS & BUISINESS KEY PROBLEMS AND ANSWERS
-- My Analysis & Findings
-- Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05
-- Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 10 in the month of Nov-2022
-- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.
-- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.
-- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.
-- Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.
-- Q.7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year
-- Q.8 Write a SQL query to find the top 5 customers based on the highest total sales 
-- Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.
-- Q.10 Write a SQL query to create each shift and number of orders (Example Morning <=12, Afternoon Between 12 & 17, Evening >17)
-- Q.11 Find the category with the highest total sales overall.
-- Q.12 Find the top 3 days with the highest number of transactions.
-- Q.13 Find customers who made more than 3 purchases in total.



-- Q.1 Write a SQL query to retrieve all columns forsales made on '2022-11-05

SELECT*
FROM retail_sales
WHERE sale_date ='2022-11-05';

-- Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 10 in the month of Nov-2022

SELECT 
*
from retail_sales
where category='Clothing'
AND
TO_CHAR(sale_date,'YYYY-MM') = '2022-11'
AND 
quantiy>=4

--Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.

SELECT
category,
SUM(total_sale) as net_sale,
COUNT(*) as total_orders
FROM retail_sales
GROUP BY 1

-- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.

SELECT 
ROUND(AVG(age),2) as avg_age
FROM retail_sales
WHERE category = 'Beauty'

-- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.

SELECT* FROM retail_sales
WHERE total_sale>1000

-- Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.

SELECT 
category,
gender,
count(*) as total_trans
FROM retail_sales
GROUP BY 
category,
gender
Order by 1

--Q.7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year

SELECT
   year,
   month,
   avg_sale
   FROM
   (
SELECT
      extract(year from sale_date) as year,
	  extract(month from sale_date) as month,
	  AVG(total_sale) as avg_sale,
	  RANK() OVER(PARTITION BY EXTRACT(YEAR FROM sale_date)ORDER BY AVG(total_sale) DESC) as rank
FROM retail_sales
GROUP BY 1,2
)as t1 
WHERE rank =1
ORDER BY 1,2

-- Q.8 Write a SQL query to find the top 5 customers based on the highest total sales 

select
customer_id,
SUM(total_sale) as total_sales
from retail_sales

GROUP BY 1
ORDER BY 2 DESC
LIMIT 5

-- Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.

select
category,
COUNT(DISTINCT customer_id) as cnt_unique_cs
from retail_sales
--GROUP BY category

-- Q.10 Write a SQL query to create each shift and number of orders (Example Morning <=12, Afternoon Between 12 & 17, Evening >17)

WITH hourly_sale
as
(
SELECT*,
     CASE
        WHEN EXTRACT(HOUR FROM SALE_TIME) <12 THEN 'MORNING'
		WHEN EXTRACT(HOUR FROM SALE_TIME) BETWEEN 12 AND 17 THEN 'AFTERNOON'
		ELSE 'EVENING'
    END AS shift
	from retail_sales
	)
	select
	shift ,
	count(*) as total_orders
	from hourly_sale
	group by shift
	

--SELECT EXTRACT(HOUR FROM CURRENT_TIME)

--Q.11 Find the category with the highest total sales overall.

SELECT category, SUM(total_sale) AS total_sales
FROM retail_sales
GROUP BY category
ORDER BY total_sales DESC
LIMIT 1;

--Q.12 Find the top 3 days with the highest number of transactions.

SELECT sale_date, COUNT(transactions_id) AS total_transactions
FROM retail_sales
GROUP BY sale_date
ORDER BY total_transactions DESC
LIMIT 3;

--Q.13 Find customers who made more than 3 purchases in total.

SELECT customer_id, COUNT(transactions_id) AS total_purchases
FROM retail_sales
GROUP BY customer_id
HAVING COUNT(transactions_id) > 3;


-------------END OF PROJECT--------------








