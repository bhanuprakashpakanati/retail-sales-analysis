Retail Sales Data Analysis Project
📊 Project Overview
This project involves a comprehensive analysis of a retail sales dataset using SQL. The goal is to explore, clean, and derive meaningful business insights from transactional data, including customer demographics, product categories, sales performance, and purchasing patterns. The SQL scripts perform data quality checks, aggregate sales metrics, and segment data to answer key business questions.

📁 Repository Contents
This repository contains the following SQL file:

Retail_Sales.sql: The main script containing all SQL queries used for data exploration and analysis.

🗃️ Dataset Description
The analysis is based on a table named RETAIL_SALES, which appears to contain point-of-sale transaction records with the following columns:

TRANSACTIONS_ID: A unique identifier for each transaction.

SALE_DATE: The date of the sale.

SALE_TIME: The time of the sale.

CUSTOMER_ID: A unique identifier for the customer.

GENDER: The gender of the customer.

AGE: The age of the customer.

CATEGORY: The product category (e.g., Clothing, Beauty).

QUANTITY: The number of units sold in the transaction.

PRICE_PER_UNIT: The price of a single unit.

COGS: The calculated Cost of Goods Sold, rounded to two decimal places.

TOTAL_SALE: The total value of the sale (likely QUANTITY * PRICE_PER_UNIT).

🔍 Key Analysis Performed
The SQL script performs a wide range of analytical tasks:

Data Quality & Integrity

Renamed a column for consistency (quantiy to QUANTITY).

Checked for and deleted records with missing (NULL) values to ensure data cleanliness.

Calculated the total number of records and unique customers.

Basic Exploration

Identified all unique product categories available in the dataset.

Retrieved all sales for a specific date (2022-11-05).

Sales Analysis

Calculated the total net sales and number of orders for each product category.

Identified transactions with high value (e.g., sales over $1000).

Found the top 5 customers based on the highest total sales amount.

Analyzed sales trends by calculating the average sales for each month and identifying the best-selling months.

Customer Analysis

Calculated the average age of customers purchasing from specific categories (e.g., Beauty).

Found the number of unique customers per product category.

Analyzed purchasing patterns by gender across different categories.

Operational Analysis

Categorized sales into shifts (Morning, Afternoon, Evening) based on the time of transaction and counted the number of orders per shift to understand peak business hours.

🛠️ SQL Skills Demonstrated
This project showcases practical use of the following SQL techniques:

Data Definition Language (DDL): sp_rename for column management.

Data Querying: SELECT, WHERE, BETWEEN, DISTINCT.

Aggregate Functions: COUNT(), SUM(), AVG().

Data Cleaning: Handling NULL values with DELETE and IS NULL.

Grouping and Sorting: GROUP BY, ORDER BY.

Conditional Logic: CASE statements for data categorization.

Date and Time Functions: YEAR(), MONTH(), DATEPART().

Top-N Analysis: Using TOP to limit results.

📈 Insights (Examples)
Which product category generates the highest total sales?

What is the busiest time of day for sales?

What is the demographic profile (age, gender) of customers for different product categories?

Which were the best-performing months for sales?

Who are the top-spending customers?

🚀 How to Use
Environment Setup: Ensure you have access to a SQL database system that supports the used functions (e.g., Microsoft SQL Server, as indicated by sp_rename and DATEPART).

Load Data: Import the RETAIL_SALES dataset into your database.

Run the Script: Execute the queries in the Retail_Sales.sql file sequentially to reproduce the analysis.

Adapt and Explore: Feel free to modify the queries to ask new questions of the data or adapt them for your own datasets.

🤝 Contributing
Contributions, issues, and feature requests are welcome! Feel free to check the issues page or fork the repository and submit a pull request.
