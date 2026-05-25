-- Select all entiries from the dataset
SELECT *
FROM warehouse_and_retail_sales;

-- Alter the ITEM DESCRIPTION, ITEM TYPE, RETAIL SALES and WAREHOUSE SALES TO ITEM_DESCRIPTION, ITEM_TYPE, RETAIL_SALES, WAREHOUSE_SALES
ALTER TABLE warehouse_and_retail_sales
CHANGE COLUMN `ITEM DESCRIPTION` ITEM_DESCRIPTION VARCHAR(255);

ALTER TABLE warehouse_and_retail_sales
CHANGE COLUMN `ITEM TYPE` ITEM_TYPE VARCHAR(255);

ALTER TABLE warehouse_and_retail_sales
CHANGE COLUMN `RETAIL SALES` RETAIL_SALES VARCHAR(255);

ALTER TABLE warehouse_and_retail_sales
CHANGE COLUMN `WAREHOUSE SALES` WAREHOUSE_SALES VARCHAR(255);

ALTER TABLE warehouse_and_retail_sales
CHANGE COLUMN `RETAIL TRANSFERS` RETAIL_TRANSFERS VARCHAR(255);

-- Which items has the highest amount of retail sales
SELECT ITEM_DESCRIPTION, ITEM_TYPE, RETAIL_SALES
FROM warehouse_and_retail_sales
ORDER BY RETAIL_SALES DESC;

-- Which items have the highest amount in warehouse sales
SELECT ITEM_DESCRIPTION, ITEM_TYPE, WAREHOUSE_SALES
FROM warehouse_and_retail_sales
ORDER BY WAREHOUSE_SALES DESC;

-- Which year saw the most sales
SELECT YEAR,
	FORMAT(SUM(RETAIL_SALES), 'C2', 'en-GB') AS total_retail_sales,
	COUNT(RETAIL_SALES) AS retail_count,
	FORMAT(SUM(WAREHOUSE_SALES), 'C2', 'en_GB') AS total_warehouse_sales,
	COUNT(WAREHOUSE_SALES) AS warehouse_count
FROM warehouse_and_retail_sales
GROUP BY YEAR;

-- Are certain items sold more than others and which items make the most profit?
SELECT ITEM_TYPE, 
	COUNT(ITEM_TYPE) AS total_of_items,
	FORMAT(SUM(RETAIL_SALES), 'C2', 'en-GB') AS total_retail_sales,
	FORMAT(SUM(WAREHOUSE_SALES), 'C2', 'en_GB') AS total_warehouse_sales,
    FORMAT(SUM(RETAIL_SALES + WAREHOUSE_SALES), 'C2', 'en-GB') AS total_combined_sales
FROM warehouse_and_retail_sales
GROUP BY ITEM_TYPE;

-- Which suppliers supply's the most products 
SELECT SUPPLIER,
	COUNT(SUPPLIER) AS total_items_supplied
FROM warehouse_and_retail_sales
GROUP BY SUPPLIER;

-- Which month saw the most sales in 2017
SELECT 
	YEAR, 
    MONTH,
	COUNT(MONTH) AS items_sold_per_month,
    FORMAT(SUM(RETAIL_SALES + WAREHOUSE_SALES), 'C2', 'en-GB') AS total_combined_sales
FROM warehouse_and_retail_sales
WHERE YEAR = '2017'
GROUP BY YEAR, MONTH
ORDER BY MONTH;

-- Which month saw the most sales in 2018
SELECT 
	YEAR, 
    MONTH,
	COUNT(MONTH) AS items_sold_per_month,
    FORMAT(SUM(RETAIL_SALES + WAREHOUSE_SALES), 'C2', 'en-GB') AS total_combined_sales
FROM warehouse_and_retail_sales
WHERE YEAR = '2018'
GROUP BY YEAR, MONTH
ORDER BY MONTH;

-- Which month saw the most sales in 2019
SELECT 
	YEAR, 
    MONTH,
	COUNT(MONTH) AS items_sold_per_month,
    FORMAT(SUM(RETAIL_SALES + WAREHOUSE_SALES), 'C2', 'en-GB') AS total_combined_sales
FROM warehouse_and_retail_sales
WHERE YEAR = '2019'
GROUP BY YEAR, MONTH
ORDER BY MONTH;

-- Which month saw the most sales in 2020
SELECT 
	YEAR, 
    MONTH,
	COUNT(MONTH) AS items_sold_per_month,
    FORMAT(SUM(RETAIL_SALES + WAREHOUSE_SALES), 'C2', 'en-GB') AS total_combined_sales
FROM warehouse_and_retail_sales
WHERE YEAR = '2020'
GROUP BY YEAR, MONTH
ORDER BY MONTH;

-- Which items didn't sell in 2017
SELECT
	YEAR,
    MONTH,
    MIN(ITEM_DESCRIPTION) AS item_decritpions,
    SUM(RETAIL_SALES) AS total_retail_sales,
	SUM(WAREHOUSE_SALES) AS total_warehouse_sales
FROM warehouse_and_retail_sales
WHERE RETAIL_SALES = 0 
AND WAREHOUSE_SALES = 0 
AND YEAR = '2017'
GROUP BY YEAR, MONTH, ITEM_DESCRIPTION
ORDER BY MONTH;

-- Which items didn't sell in 2018
SELECT
	YEAR,
    MONTH,
    MIN(ITEM_DESCRIPTION) AS item_decritpions,
    SUM(RETAIL_SALES) AS total_retail_sales,
	SUM(WAREHOUSE_SALES) AS total_warehouse_sales
FROM warehouse_and_retail_sales
WHERE RETAIL_SALES = 0 
AND WAREHOUSE_SALES = 0 
AND YEAR = '2018'
GROUP BY YEAR, MONTH, ITEM_DESCRIPTION
ORDER BY MONTH;

-- Which items didn't sell in 2019
SELECT
	YEAR,
    MONTH,
    MIN(ITEM_DESCRIPTION) AS item_decritpions,
    SUM(RETAIL_SALES) AS total_retail_sales,
	SUM(WAREHOUSE_SALES) AS total_warehouse_sales
FROM warehouse_and_retail_sales
WHERE RETAIL_SALES = 0 
AND WAREHOUSE_SALES = 0 
AND YEAR = '2019'
GROUP BY YEAR, MONTH, ITEM_DESCRIPTION
ORDER BY MONTH;

-- Which items didn't sell in 2020
SELECT
	YEAR,
    MONTH,
    MIN(ITEM_DESCRIPTION) AS item_decritpions,
    SUM(RETAIL_SALES) AS total_retail_sales,
	SUM(WAREHOUSE_SALES) AS total_warehouse_sales
FROM warehouse_and_retail_sales
WHERE RETAIL_SALES = 0 
AND WAREHOUSE_SALES = 0 
AND YEAR = '2020'
GROUP BY YEAR, MONTH, ITEM_DESCRIPTION
ORDER BY MONTH;

-- How many RETAIL TRANSFERS were used per year
SELECT
	YEAR,
    COUNT(RETAIL_TRANSFERS) AS total_amount_of_retail_transfers
FROM warehouse_and_retail_sales
GROUP BY YEAR;

-- Which items had the most RETAIL_TRANSFERS in 2017
SELECT	
	YEAR,
    COUNT(RETAIL_TRANSFERS) AS total_amount_of_retail_transfers,
    MIN(ITEM_DESCRIPTION) AS item_descriptions
FROM warehouse_and_retail_sales
WHERE YEAR = 2017
GROUP BY MONTH;

-- Which items had the most RETAIL_TRANSFERS in 2018
SELECT	
	YEAR,
    COUNT(RETAIL_TRANSFERS) AS total_amount_of_retail_transfers,
    MIN(ITEM_DESCRIPTION) AS item_descriptions
FROM warehouse_and_retail_sales
WHERE YEAR = 2018
GROUP BY MONTH;

-- Which items had the most RETAIL_TRANSFERS in 2019
SELECT	
	YEAR,
    COUNT(RETAIL_TRANSFERS) AS total_amount_of_retail_transfers,
    MIN(ITEM_DESCRIPTION) AS item_descriptions
FROM warehouse_and_retail_sales
WHERE YEAR = 2019
GROUP BY MONTH;

-- Which items had the most RETAIL_TRANSFERS in 2020
SELECT	
	YEAR,
    COUNT(RETAIL_TRANSFERS) AS total_amount_of_retail_transfers,
    MIN(ITEM_DESCRIPTION) AS item_descriptions
FROM warehouse_and_retail_sales
WHERE YEAR = 2020
GROUP BY MONTH;