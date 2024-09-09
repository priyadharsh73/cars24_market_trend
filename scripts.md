```sql
SELECT * FROM cars_24.dataset_used_cars;
describe cars_24.dataset_used_cars;
Show columns FROM cars_24.dataset_used_cars;

-- Select key fields
SELECT `Manufacturer`, `Model`, `Price(INR)`, `Distance Travelled`, `India Locations`, `Fuel Type`, `Engine Capacity`, `Transmission`
FROM cars_24.dataset_used_cars
LIMIT 10;

-- Calculate the total distance travelled by Manufacturer
SELECT `Manufacturer`, SUM(`Distance Travelled`) AS total_distance
FROM cars_24.dataset_used_cars
GROUP BY Manufacturer;

-- Count the number of cars available in each location
SELECT `India Locations`, COUNT(*) AS car_count
FROM cars_24.dataset_used_cars
GROUP BY `India Locations`;

-- Count the number of cars available in each manufacturer
SELECT `Manufacturer`, COUNT(*) AS manufacturer_count
FROM cars_24.dataset_used_cars
GROUP BY `Manufacturer`;

-- Get the price distribution by Fuel Type
SELECT `Fuel Type`, `Price(INR)`
FROM cars_24.dataset_used_cars
ORDER BY `Fuel Type`, `Price(INR)`;

-- Get the Varient distribution by Manufacturer
SELECT `Manufacturer`, `Varient`
FROM cars_24.dataset_used_cars
ORDER BY `Manufacturer`, `Varient`;

-- total distanced travelled by model
SELECT `Manufacturer`,`model`, SUM(`Distance Travelled`) AS total_distance
FROM cars_24.dataset_used_cars
GROUP BY `Manufacturer`,`model`;

-- total distanced travelled by fuel type and manufacturer
SELECT `Manufacturer`,`Fuel Type`, SUM(`Distance Travelled`) AS total_distance
FROM cars_24.dataset_used_cars
GROUP BY `Manufacturer`,`Fuel Type`;

-- Count the number of cars available in Transmission
SELECT `Transmission`, COUNT(*) AS transmission_count
FROM cars_24.dataset_used_cars
GROUP BY `Transmission`;

-- Count the number of cars available in transmission by manufacturer
SELECT `Manufacturer`, `Transmission`, COUNT(*) AS transmission_count
FROM cars_24.dataset_used_cars
GROUP BY `Manufacturer`, `Transmission`;

-- Data Extraction, Filtration & Cleaning:
select * from cars_24.dataset_used_cars;
SELECT `Manufacturer`, `Model`, `Price(INR)`, `Distance Travelled`, `India Locations`, `Fuel Type`, `Engine Capacity`, `Transmission`
FROM cars_24.dataset_used_cars;

-- Select key fields for cars located in Mumbai and priced below 1,000,000 INR
SELECT `Manufacturer`, `Model`, `Price(INR)`, `Distance Travelled`, `India Locations`, `Fuel Type`, `Engine Capacity`, `Transmission`
FROM cars_24.dataset_used_cars
WHERE `India Locations` = 'Mumbai' AND `Price(INR)` < 1000000;

-- Calculate the average engine capacity by Transmission type
SELECT Transmission, AVG(`Engine Capacity`) AS average_engine_capacity
FROM cars_24.dataset_used_cars
GROUP BY Transmission;

-- Filter out rows with NULL or zero values in key fields
SELECT `Manufacturer`, `Model`, `Price(INR)`, `Distance Travelled`, `India Locations`, `Fuel Type`, `Engine Capacity`, `Transmission`
FROM cars_24.dataset_used_cars
WHERE `India Locations` = 'Mumbai'
  AND `Price(INR)` > 0
  AND `Distance Travelled` > 0
  AND `Engine Capacity` > 0;

-- Replace NULL values in Fuel Type with 'Unknown'
SELECT `Manufacturer`, `Model`, `Price(INR)`, `Distance Travelled`, `India Locations`,
       COALESCE(`Fuel Type`, 'Unknown') AS `Fuel Type`,
       `Engine Capacity`, `Transmission`
FROM cars_24.dataset_used_cars
WHERE `India Locations` = 'Jaipur'
  AND `Price(INR)` > 0
  AND `Distance Travelled` > 0
  AND `Engine Capacity` > 0;
  
SELECT `Manufacturer`, `Model`, `Price(INR)`, `Distance Travelled`, `India Locations`,
       COALESCE(`Fuel Type`, 'Unknown') AS `Fuel Type`,
       `Engine Capacity`, `Transmission`
FROM cars_24.dataset_used_cars
WHERE `India Locations` = 'Mumbai'
  AND `Price(INR)` > 0
  AND `Distance Travelled` > 0
  AND `Engine Capacity` > 0;
  
  -- Standardize Transmission values and filter data
SELECT `Manufacturer`, `Model`, `Price(INR)`, `Distance Travelled`, `India Locations`,
       COALESCE(`Fuel Type`, 'Unknown') AS `Fuel Type`,
       `Engine Capacity`,
       CASE
           WHEN UPPER(`Transmission`) = 'Manual' THEN 'MANUAL'
           WHEN UPPER(`Transmission`) = 'Automatic' THEN 'AUTOMATIC'
           ELSE `Transmission`
       END AS `Transmission`
FROM cars_24.dataset_used_cars
WHERE `India Locations` = 'Mumbai'
  AND `Price(INR)` > 0
  AND `Distance Travelled` > 0
  AND `Engine Capacity` > 0;

-- Calculate the average price by Manufacturer and Model
SELECT `Manufacturer`, `Model`, AVG(`Price(INR)`) AS average_price
FROM cars_24.dataset_used_cars
GROUP BY Manufacturer, Model;

-- Count the number of cars based on model of manufacture
SELECT `Model` AS manufacture_year, COUNT(*) AS car_count
FROM cars_24.dataset_used_cars
GROUP BY manufacture_year;

-- Calculate the maximum distance travelled by Manufacturer and Model
SELECT `Manufacturer`, `Model`, MAX(`Distance Travelled`) AS max_distance
FROM cars_24.dataset_used_cars
GROUP BY `Manufacturer`, `Model`;

-- Count the number of cars by Fuel Type
SELECT `Fuel Type`, COUNT(*) AS car_count
FROM cars_24.dataset_used_cars
GROUP BY `Fuel Type`;

-- Calculate the total price of cars by location
SELECT `India Locations`, SUM(`Price(INR)`) AS total_price
FROM cars_24.dataset_used_cars
GROUP BY `India Locations`;
