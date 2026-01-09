# BMW Used Cars Data Analysing And Price Predicion
## Project Overview
This project aims to analyze and predict the prices of used BMW cars using listing data. The goal is to build a data analytics workflow, starting from raw data ingestion and cleaning, followed by exploratory data analysis and regression-based price prediction.

---
## Data Source
- Kaggle: BMW Used Car Listings dataset  https://www.kaggle.com/datasets/mysarahmadbhat/bmw-used-car-listing
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
## Tech Stack
- SQL (PostgreSQL)
- Python
- Pandas, NumPy, scikit-learn
- Git & GitHub

---

## Progress
- Database schema design (postgreSQL)
- Raw data ingestion from CSV
- Data cleaning using a staging table

---

## Database Design
A PostgreSQL database was used to store and clean the data.

- We added a primary key (`car_id`) to uniquely identify each car listing.
- Initial attempts to import the raw CSV directly into a typed table failed due to missing and inconsistent values.
- To handle this, a staging table with all columns defined as `TEXT` was created to safely ingest raw data.

---

## Data Cleaning Approach
1. Imported raw CSV data into a staging table (`usedCars_staging`) with all columns stored as text.
2. Converted empty strings to `NULL` values using `NULLIF`.
3. Cast cleaned values into appropriate data types (`INT`, `FLOAT`) while inserting data into the final table.

This approach mirrors a real-world ETL process and ensures data integrity before analysis.

---
CREATE TABLE usedCars_staging (
    model TEXT,
    year TEXT,
    price TEXT,
    transmission TEXT,
    mileage TEXT,
    fuelType TEXT,
    tax TEXT,
    mpg TEXT,
    engineSize TEXT
);

SELECT * FROM usedcars_staging;

DROP TABLE IF EXISTS usedCars;

CREATE TABLE usedCars (
    car_id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    model VARCHAR(50),
    year INT,
    price INT,
    transmission VARCHAR(20),
    mileage INT,
    fuelType VARCHAR(20),
    tax INT,
    mpg FLOAT,
    engineSize FLOAT
);


INSERT INTO usedCars (
    model, year, price, transmission, mileage,
    fuelType, tax, mpg, engineSize
)
SELECT
    model,
    NULLIF(year, '')::INT,
    NULLIF(price, '')::INT,
    transmission,
    NULLIF(mileage, '')::INT,
    fuelType,
    NULLIF(tax, '')::INT,
    NULLIF(mpg, '')::FLOAT,
    NULLIF(engineSize, '')::FLOAT
FROM usedCars_staging;

SELECT * FROM usedcars;

SELECT COUNT(*) FROM usedCars;
SELECT COUNT(*) FROM usedCars_staging;




---
## Next Steps
- Perform exploratory data analysis (EDA) using SQL and Python
- Visualize price trends and relationships between features
- Build regression models to predict used BMW car prices
- Analyze feature importance and model performance
