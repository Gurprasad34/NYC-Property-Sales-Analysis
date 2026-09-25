USE nyc_housing_analysis;

-- Neighborhoods with the most property sales
SELECT
    neighborhood,
    COUNT(*) AS total_sales
FROM property_sales
GROUP BY neighborhood
ORDER BY total_sales DESC
LIMIT 10;

-- Sales activity by month
SELECT
    LEFT(sale_date, 7) AS sale_month,
    COUNT(*) AS total_sales
FROM property_sales
GROUP BY sale_month
ORDER BY sale_month;

-- Properties with the most residential units
SELECT
    address,
    neighborhood,
    borough,
    residential_units
FROM property_sales
WHERE residential_units IS NOT NULL
ORDER BY CAST(residential_units AS UNSIGNED) DESC
LIMIT 10;
