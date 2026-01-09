--- Creating the staging table 
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

--- Creating the actual table
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

--- Inserting the values from the staging table into the actual table
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


--- Verifying that all the data got imported
SELECT * FROM usedcars;

--- Verifying that copying the data from the staging table (usedCars_staging) to the main table (usedCars)
SELECT COUNT(*) FROM usedCars;
SELECT COUNT(*) FROM usedCars_staging;
