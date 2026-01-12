# BMW Used Cars Data Analysis and Price Prediction

## Project Overview
This project aims to analyze and predict the prices of used BMW cars using listing data. The goal is to build a complete data analytics workflow: raw data ingestion and cleaning, exploratory data analysis (EDA), feature engineering, and regression-based price prediction using advanced machine learning models.

---

## Data Source
The data is sourced from [Kaggle: BMW Used Car Listing](https://www.kaggle.com/datasets/mysarahmadbhat/bmw-used-car-listing), containing the following columns:  

| Column         | Description                  |
|----------------|------------------------------|
| model          | BMW model                    |
| year           | Registration year            |
| price          | Price in Euros               |
| transmission   | Gearbox type                 |
| mileage        | Distance driven              |
| fuelType       | Fuel type                    |
| tax            | Road tax                     |
| mpg            | Miles per gallon             |
| engineSize     | Engine size in litres        |

---

## Tech Stack
- PostgreSQL (Database design, cleaning, staging tables)  
- Python  
- Pandas, NumPy, scikit-learn, matplotlib, seaborn  
- Git & GitHub  

---

## Progress

**Completed:**
- Database schema design in PostgreSQL  
- Raw data ingestion from CSV into a staging table  
- Data cleaning: missing values, duplicates, outlier checks, categorical standardization  
- Exploratory Data Analysis (EDA) in SQL and Python  
- Feature Engineering: `car_age` and `mileage_per_year`  
- Predictive Modeling using regression pipelines and hyperparameter tuning  
- Model evaluation using MAE, RMSE, and R²  

**Final Model:**
- Tuned Histogram Gradient Boosting Regressor with log-transformed target (`price`)  
- Ready for predicting prices of new BMW listings  

---

## Database Design
- Primary key `car_id` added to uniquely identify each listing  
- Staging table created with all columns as `TEXT` to safely ingest raw CSV data  
- Final cleaned table with appropriate data types (`INT`, `FLOAT`, `VARCHAR`)  

---

## Data Cleaning & Preprocessing
1. Imported raw CSV data into `usedCars_staging`.  
2. Converted empty strings to `NULL` using `NULLIF`.  
3. Cast data into proper types (`INT`, `FLOAT`) for analysis.  
4. Checked for null values (none found).  
5. Removed duplicates.  
6. Standardized categorical columns (`model`, `transmission`, `fuelType`).  
7. Inspected for outliers in `price`, `mileage`, and `engineSize`.  

---

## Feature Engineering
- Added `car_age = REFERENCE_YEAR - year`  
- Added `mileage_per_year = mileage / car_age` (handling division by zero)  
- Encoded categorical variables using One-Hot Encoding: `model`, `transmission`, `fuelType`  

---

## Exploratory Data Analysis (EDA) in Python

1. **Price Distribution**  
   - Histogram showing distribution of BMW prices.  
   - Most cars are mid-priced; fewer listings at very low or very high prices.  

2. **Price vs Mileage**  
   - Scatter plot shows higher mileage generally corresponds to lower prices.  

3. **Average Price by Model**  
   - Bar chart of average price per BMW model.  
   - Highlights which models are more expensive on the used market.  

4. **Correlation Analysis**  
   - Numeric features like `engineSize`, `car_age`, and `mileage_per_year` show strong correlation with `price`.  

---

## Predictive Modeling

**Workflow:**

1. **Preprocessing Pipeline**
   - One-Hot Encoding for categorical features  
   - Numeric features passed through unchanged  

2. **Target Transformation**
   - Log transformation applied to `price` to reduce skew  

3. **Modeling**
   - Trained `HistGradientBoostingRegressor` using pipeline  
   - Hyperparameter tuning with `RandomizedSearchCV` and cross-validation  

4. **Evaluation Metrics**
   - MAE (Mean Absolute Error)  
   - RMSE (Root Mean Squared Error)  
   - R² (Coefficient of Determination)  

**Best Model Performance:**  
- Tuned HGB model outperformed others on test data.  
- Top predictors: `car_age`, `engineSize`, `mileage_per_year`, and specific `model` categories  

---

## Example Predictions

```python
sample = pd.DataFrame([
    {"model": "5 Series", "year": 2018, "transmission": "Automatic", "mileage": 23195, "fuelType": "Diesel", "tax": 145, "mpg": 65.7, "engineSize": 2.0},
    {"model": "1 Series", "year": 2017, "transmission": "Manual", "mileage": 17117, "fuelType": "Petrol", "tax": 145, "mpg": 53.3, "engineSize": 1.5},
    {"model": "X3", "year": 2016, "transmission": "Automatic", "mileage": 42691, "fuelType": "Diesel", "tax": 145, "mpg": 54.3, "engineSize": 2.0},
])

sample_fe = add_features(sample)  # adds car_age and mileage_per_year
preds = best_model.predict(sample_fe[feature_cols_fe])
sample["predicted_price"] = preds.round(0).astype(int)
