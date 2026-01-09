--- Verifying that all the data got imported
SELECT * FROM usedcars;

--- Verifying that copying the data from the staging table (usedCars_staging) to the main table (usedCars)
SELECT COUNT(*) FROM usedCars;
SELECT COUNT(*) FROM usedCars_staging;

--- Checking for Null values
SELECT COUNT(*) 
FROM usedCars
WHERE model IS NULL
	OR year IS NULL 
    OR price IS NULL
    OR transmission IS NULL
    OR mileage IS NULL
	OR fuelType IS NULL
	OR tax IS NULL
	OR mpg IS NULL
	OR engineSize IS NULL;

