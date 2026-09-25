# NYC Property Sales Analysis

## Overview

This project analyzes New York City property sales data to uncover patterns in sale prices, property characteristics, and geographic differences across the five boroughs.

Property sales data was collected directly from NYC Open Data using its public API, stored in MySQL, analyzed using SQL and Python, and visualized through an interactive Tableau dashboard.

The analysis combines exploratory data analysis with statistical testing to move beyond basic visualizations and determine whether observed patterns in the data are statistically significant.

## Project Goals

- Analyze the distribution of NYC property sale prices
- Compare property values and sales activity across boroughs
- Examine how property characteristics relate to sale price
- Explore differences in property types across NYC
- Identify meaningful trends and patterns in the NYC real estate market
- Use statistical testing to validate findings from exploratory analysis
- Present key insights through an interactive Tableau dashboard

## Tools & Technologies

- **Python** — API data collection, data cleaning, transformation, and analysis
- **Pandas / NumPy** — data manipulation and exploratory analysis
- **SciPy** — statistical hypothesis testing
- **SQL / MySQL** — data storage, querying, filtering, and aggregation
- **Matplotlib / Seaborn** — exploratory data visualization
- **Tableau** — interactive dashboard and final visual analysis
- **VS Code / Jupyter Notebook** — development and analysis
- **Git / GitHub** — version control and project documentation

## Data Source

Property sales data was collected from **NYC Open Data** using its public API.

The original dataset contained over **82,000 property sale records**. After cleaning and filtering invalid or unusable transactions, approximately **52,600 valid sales** were retained for analysis.

Raw data is retrieved programmatically rather than stored directly in this repository.

## Key Findings

1. **NYC property sale prices are highly right-skewed.**  
   Across 52,595 valid transactions, the median sale price was approximately **$920,000**, while the average was approximately **$3.30 million**. A relatively small number of extremely high-value transactions, including a maximum sale of approximately **$572 million**, substantially raise the overall average.

2. **Property values vary significantly across NYC boroughs.**  
   Borough-level analysis revealed substantial differences in property sale prices across the city. An ANOVA confirmed that these differences in average sale prices were **statistically significant** (F = 332.98, p < 0.001), reinforcing location as an important factor in NYC property values.

3. **Property size matters, but it is only part of the pricing story.**  
   Gross square footage had a **positive correlation of approximately 0.35 with sale price**, meaning larger properties generally sold for more. However, the moderate relationship suggests that factors beyond size, such as location and property type, also play an important role in determining sale prices.

4. **NYC boroughs have distinctly different mixes of property types.**  
   The distribution of building categories varied substantially across the five boroughs. A chi-square test confirmed a **statistically significant association between borough and property type** (χ² = 26,622.09, p < 0.001), highlighting differences in the composition of each borough's real estate market.

5. **Median sale price provides a more representative view of the typical NYC transaction than the average.**  
   With **75% of analyzed properties selling for approximately $1.69 million or less**, the $3.30 million average is heavily influenced by unusually expensive transactions. Using median prices alongside averages provides a clearer picture when comparing NYC property markets.

## Tableau Dashboard

The final Tableau dashboard provides an interactive overview of NYC property sales, allowing users to explore key metrics, geographic differences, property characteristics, and sale price patterns.

### Interactive Dashboard

<img width="1003" height="802" alt="Tableau Screenshot" src="https://github.com/user-attachments/assets/4e08a1d8-6490-4a98-9337-bc54fe97c72b" />

## Repository Structure

    data/
        processed/      # Cleaned datasets used for analysis
    notebooks/          # Jupyter notebooks for cleaning, EDA, and statistical analysis
    scripts/            # Python API data collection scripts
    sql/                # SQL queries and initial analysis
    tableau/            # Tableau dashboard and dashboard images
    requirements.txt    # Python dependencies
    README.md           # Project documentation

## Future Improvements

The primary future extension of this project would be to develop a **machine learning model for predicting NYC property sale prices**.

Potential improvements include:

- Engineer predictive features using property size, location, building type, age, and other available characteristics
- Train and compare regression models such as Linear Regression, Random Forest, Gradient Boosting, and XGBoost
- Evaluate model performance using MAE, RMSE, and R²
- Apply cross-validation and hyperparameter tuning
- Analyze feature importance to identify the strongest predictors of property value
- Generate predicted sale prices for new properties
- Integrate model predictions into the Tableau dashboard
- Deploy the final model through an API or lightweight web application
