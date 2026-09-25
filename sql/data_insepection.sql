CREATE DATABASE nyc_housing_analysis;

USE nyc_housing_analysis;

SELECT DATABASE();

-- Preview our data
SELECT *
FROM property_sales
LIMIT 10;

-- Check number of rows and table structure
SELECT
    COUNT(*) AS total_rows
FROM property_sales;

DESCRIBE property_sales;

-- Check for missing values in important columns
SELECT
    COUNT(*) AS total_rows,
    SUM(sale_price IS NULL) AS missing_sale_price,
    SUM(sale_date IS NULL) AS missing_sale_date,
    SUM(gross_square_feet IS NULL) AS missing_gross_square_feet,
    SUM(year_built IS NULL) AS missing_year_built
FROM property_sales;

-- Check the borough values
SELECT
    borough,
    COUNT(*) AS total_sales
FROM property_sales
GROUP BY borough
ORDER BY borough;

-- Check the property categories
SELECT
    building_class_category,
    COUNT(*) AS total_sales
FROM property_sales
GROUP BY building_class_category
ORDER BY total_sales DESC;

-- Cleaning notes:
-- All columns were imported as TEXT and will need appropriate data type conversions.
-- Convert sale_price, unit counts, square footage, and year_built to numeric types.
-- Convert sale_date to datetime.
-- Investigate missing values, especially gross_square_feet and year_built.
-- Check for duplicate records.
