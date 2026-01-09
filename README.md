# BMW Used Cars Data Analysing And Price Predicion
## Project Overview
This project aims to analyze and predict the prices of used BMW cars using listing data. The goal is to build a data analytics workflow, starting from raw data ingestion and cleaning, followed by exploratory data analysis and regression-based price prediction.

---

## Current Progress
- Database schema design
- Raw data ingestion from CSV
- Data cleaning using a staging table

---

## Data Source
- Kaggle: BMW Used Car Listings dataset  
- Features include:
  - Model
  - Year
  - Price
  - Transmission
  - Mileage
  - Fuel type
  - Tax
  - MPG
  - Engine size

---

## Database Design
A PostgreSQL database was used to store and clean the data.

- A surrogate primary key (`car_id`) was introduced to uniquely identify each car listing.
- Initial attempts to import the raw CSV directly into a typed table failed due to missing and inconsistent values.
- To handle this, a staging table with all columns defined as `TEXT` was created to safely ingest raw data.

---

## Data Cleaning Approach
1. Imported raw CSV data into a staging table (`usedCars_staging`) with all columns stored as text.
2. Converted empty strings to `NULL` values using `NULLIF`.
3. Cast cleaned values into appropriate data types (`INT`, `FLOAT`) while inserting data into the final table.

This approach mirrors a real-world ETL process and ensures data integrity before analysis.

---

## Tech Stack
- SQL (PostgreSQL)
- Python (planned)
- Pandas, NumPy, scikit-learn (planned)
- Git & GitHub

---

## Next Steps
- Perform exploratory data analysis (EDA) using SQL and Python
- Visualize price trends and relationships between features
- Build regression models to predict used BMW car prices
- Analyze feature importance and model performance
