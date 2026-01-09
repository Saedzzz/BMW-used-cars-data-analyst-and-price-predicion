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

## Data Cleaning & Preprocessing
1. Imported raw CSV data into a staging table (`usedCars_staging`) with all columns stored as text.
2. Converted empty strings to `NULL` values using `NULLIF`.
3. Cast cleaned values into appropriate data types (`INT`, `FLOAT`) while inserting data into the final table.
4. Checked for missing values in all columns (`price`, `year`, `mileage`, `engineSize`, etc.)
- No null values were found, so all rows are ready for analysis
5. Checked for duplicates and removed them
6. Standardized categorical columns (`transmission`, `fuelType`, etc.)
7. Checked for unrealistic outliers in price and mileage
This approach mirrors a real-world ETL process and ensures data integrity before analysis.

---

## Exploratory Data Analysis (EDA) in SQL
- Checked distributions of price, mileage, engine size
- Analyzed average prices by model, transmission, and fuel type
- Visualized price trends and relationships using scatterplots and bar charts

## Feature Engineering
- Encoded categorical variables: `model`, `transmission`, `fuelType`
- Used derived features: `car_age`, `mileage_per_year`

## Regression Modeling
- Built Linear Regression and Random Forest models to predict used BMW prices
- Evaluated models using R² and RMSE
- Analyzed feature importance; top factors influencing price: `car_age`, `engineSize`, `mileage_per_year`
---
## Connecting the Database to Python.
The PostgreSQL database was connected to Python using `SQLAlchemy` and `pandas` to perform exploratory data analysis and modeling.

---
## Exploratory Data Analysis (EDA) in Python

After cleaning the data, we performed EDA to understand price trends and key relationships between features:

1. **Price Distribution**
   - Visualized the distribution of used BMW car prices using a histogram.
   - Observed the majority of cars fall within a mid-range price bracket, with fewer very expensive or very cheap listings.

2. **Price vs Mileage**
   - Scatter plot of price against mileage.
   - Shows a clear trend that higher mileage generally corresponds to lower prices, as expected.

3. **Average Price by Model**
   - Calculated the average price for each BMW model and plotted as a bar chart.
   - Identified which models are generally more expensive on the used market.

These visualizations helped identify patterns and relationships that will inform feature engineering and predictive modeling.

---

### Predictive Modeling

We built regression models to predict the prices of used BMW cars using the cleaned dataset.

**Workflow:**

1. **Feature Engineering**
   - `car_age` = Current year − Registration year  
   - `mileage_per_year` = Mileage ÷ `car_age`  

2. **Preprocessing**
   - Standardized numeric features: `mileage`, `engineSize`, `car_age`, `mileage_per_year`  
   - One-hot encoded categorical features: `model`, `transmission`, `fuelType`  

3. **Models Used**
   - **Linear Regression**  
   - **Random Forest Regressor**  


4. **Feature Importance (Random Forest)**
- The Random Forest model identifies which features most influence car prices.  
- Top features include: `engineSize`, `mileage`, `car_age`, and specific BMW models.


---
