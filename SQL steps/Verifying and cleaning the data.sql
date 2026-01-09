--- Verifying that all the data got imported
SELECT * FROM usedcars;

--- Verifying that copying the data from the staging table (usedCars_staging) to the main table (usedCars)
SELECT COUNT(*) FROM usedCars;
SELECT COUNT(*) FROM usedCars_staging;

