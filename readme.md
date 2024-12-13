**ETL and Data Analytics on Global Retail Orders Dataset**


## Overview

This project demonstrates an end-to-end ETL (Extract, Transform, Load) pipeline and data analysis workflow on a global retail orders dataset. The goal is to clean, transform, and load the dataset into SQL Server and generate actionable business insights using Python and SQL.

## Dataset

The dataset contains sales data from 2022 and 2023, including details such as order dates, ship modes, customer segments, product categories, and financial metrics like cost price, list price, discount, and profit. The dataset was downloaded from Kaggle.

## Project Highlights

### Data Extraction and Cleaning:

1. Extracted the dataset using the Kaggle API.

2. Removed invalid entries such as "Not Available" and "unknown" in the Ship Mode column.

3. Standardized column names by converting them to lowercase and replacing spaces with underscores.

### Data Transformation:

1. Created new calculated fields such as discount, sale_price, and profit for in-depth analysis.

2. Converted the order_date column to a datetime format for time-series analysis.

### Database Design and Loading:

1. Designed a relational database schema and created the orders table in SQL Server.

2. Loaded the cleaned and transformed data into SQL Server using SQLAlchemy in Python.

#### Analytics and Insights:

1. Generated key business insights such as:

2. Top-performing categories, regions, and products by revenue and profit.

3. Monthly sales trends.

4. Impact of discounts on profitability.

5. State-wise and customer segment-wise performance.

6. Utilized SQL queries to provide actionable insights for business decision-making.

### Tools and Technologies:

1. Languages/Frameworks: Python (Pandas, SQLAlchemy), T-SQL.

2. Databases: SQL Server with ODBC Driver 17.

3. Others: Jupyter Notebook, Kaggle API, Power Query.