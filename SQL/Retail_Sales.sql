SELECT
	TRANSACTIONS_ID
	,SALE_DATE
	,SALE_TIME
	,CUSTOMER_ID
	,GENDER
	,AGE
	,CATEGORY
	,QUANTITY
	,PRICE_PER_UNIT
	,ROUND(COGS,2) AS COGS
	,TOTAL_SALE
	FROM RETAIL_SALES;

---Rename the Column of Quantiy into 'QUANTITY'
---EXEC sp_rename 'Retail_Sales.quantiy', 'quantity', 'COLUMN';

---Record Count: Determine the total number of records in the dataset
SELECT COUNT(*) FROM RETAIL_SALES;

---Find out how many unique customers are in the dataset
SELECT COUNT(DISTINCT CUSTOMER_ID) FROM RETAIL_SALES;

---Identify all unique product categories in the dataset
SELECT DISTINCT CATEGORY FROM RETAIL_SALES;

---Null Value Check: Check for any null values in the dataset and delete records with missing data
SELECT * FROM RETAIL_SALES
WHERE 
	TRANSACTIONS_ID IS NULL OR SALE_DATE IS NULL OR SALE_TIME IS NULL OR
	CUSTOMER_ID IS NULL OR GENDER IS NULL OR AGE IS NULL OR CATEGORY IS NULL OR 
	QUANTITY IS NULL OR PRICE_PER_UNIT IS NULL OR COGS IS NULL;

DELETE FROM RETAIL_SALES
WHERE
	TRANSACTIONS_ID IS NULL OR SALE_DATE IS NULL OR SALE_TIME IS NULL OR
	CUSTOMER_ID IS NULL OR GENDER IS NULL OR AGE IS NULL OR CATEGORY IS NULL OR 
	QUANTITY IS NULL OR PRICE_PER_UNIT IS NULL OR COGS IS NULL;

---Retrieve all columns for sales made on '2022-11-05
SELECT * 
FROM RETAIL_SALES
WHERE SALE_DATE = '2022-11-05'

---Retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 4 in the month of Nov-2022
SELECT * 
FROM RETAIL_SALES
WHERE 
	CATEGORY = 'CLOTHING' 
	AND QUANTITY > 4 
	AND SALE_DATE BETWEEN '2022-11-01' AND '2022-11-30';

---Calculate the total sales (total_sale) for each category
SELECT 
	CATEGORY
	,SUM(TOTAL_SALE) AS NET_SALE
	,COUNT(*) AS TOTAL_ORDERS
FROM RETAIL_SALES
GROUP BY CATEGORY;

---Find the average age of customers who purchased items from the 'Beauty' category
SELECT
	CATEGORY
	,AVG(AGE) AS AVG_AGE
	,COUNT(*) AS TOTAL_ORDERS
FROM RETAIL_SALES
GROUP BY CATEGORY;

SELECT
    ROUND(AVG(age), 2) as avg_age
FROM retail_sales
WHERE category = 'Beauty';

---Find all transactions where the total_sale is greater than 1000
SELECT *
FROM RETAIL_SALES
WHERE
	TOTAL_SALE > 1000

---Find the total number of transactions (transaction_id) made by each gender in each category
SELECT 
	CATEGORY 
	,GENDER
	,COUNT(*) AS TOTAL_TRANSACTINOS
FROM RETAIL_SALES
GROUP BY 
	CATEGORY
	,GENDER
ORDER BY
	GENDER ASC;

---Calculate the average sale for each month. Find out best selling month in each year
SELECT TOP 2
	AVG(TOTAL_SALE) AS AVG_SALES
	,MONTH(SALE_DATE) AS SALE_MONTH
	,YEAR(SALE_DATE) AS SALE_YEAR
FROM RETAIL_SALES
GROUP BY
	YEAR(SALE_DATE),
    MONTH(SALE_DATE)
ORDER BY
		AVG_SALES DESC;

---Find the top 5 customers based on the highest total sales 
SELECT TOP 5 *
FROM RETAIL_SALES
ORDER BY 
		TOTAL_SALE DESC;

---Find the number of unique customers who purchased items from each category
SELECT 
	CATEGORY
	,COUNT(DISTINCT(CUSTOMER_ID)) AS UNIQUE_CUSTOMERS
FROM RETAIL_SALES
GROUP BY 
		CATEGORY;

---Create each shift and number of orders (Example Morning <12, Afternoon Between 12 & 17, Evening >17)
SELECT
	CASE
		WHEN DATEPART(HOUR,SALE_TIME) < 12 THEN 'MORNING'
		WHEN DATEPART(HOUR,SALE_TIME) BETWEEN 12 AND 17 THEN 'AFTERNOON'
		ELSE 'EVENING'
		END AS 'SHIFT'
		,COUNT(*) AS NUMBER_OF_ORDERS
FROM RETAIL_SALES
GROUP BY 
    CASE
        WHEN DATEPART(HOUR, SALE_TIME) < 12 THEN 'MORNING'
        WHEN DATEPART(HOUR, SALE_TIME) BETWEEN 12 AND 17 THEN 'AFTERNOON'
        ELSE 'EVENING'
    END
ORDER BY 
	NUMBER_OF_ORDERS DESC;
