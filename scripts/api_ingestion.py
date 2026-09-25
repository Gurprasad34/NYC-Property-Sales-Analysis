import os
import pandas as pd
import requests
from sqlalchemy import create_engine
from dotenv import load_dotenv


# Get NYC property sales data from the API
sales_url = "https://data.cityofnewyork.us/resource/usep-8jbt.json"

all_sales = []
limit = 50000
offset = 0

while True:
    params = {
        "$limit": limit,
        "$offset": offset
    }

    response = requests.get(sales_url, params=params)
    response.raise_for_status()

    data = response.json()

    if len(data) == 0:
        break

    all_sales.extend(data)
    offset += limit

    print(f"Downloaded {len(all_sales)} property sales records")


# Convert the API data into a DataFrame
property_sales = pd.DataFrame(all_sales)


# Check the data
print("\nProperty Sales:")
print(property_sales.head())

print("\nShape:")
print(property_sales.shape)


# Load MySQL credentials from .env
load_dotenv()

db_user = os.getenv("DB_USER")
db_password = os.getenv("DB_PASSWORD")
db_host = os.getenv("DB_HOST")
db_port = os.getenv("DB_PORT")
db_name = os.getenv("DB_NAME")


# Create python and mysql connection
engine = create_engine(
    f"mysql+pymysql://{db_user}:{db_password}@{db_host}:{db_port}/{db_name}"
)


# Load the property sales data into MySQL and turn it into a table
property_sales.to_sql(
    name="property_sales",
    con=engine,
    if_exists="replace",
    index=False
)

print("\nProperty sales data successfully loaded into MySQL.")