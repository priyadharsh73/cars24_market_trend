SELECT * FROM cars_24.dataset_used_cars;

-- To count the occurrences of each car make and model
SELECT `Manufacturer`, `Varient`, `Model`, COUNT(*) as `Occurrences`
FROM cars_24.dataset_used_cars
GROUP BY `Manufacturer`, `Varient`, `Model`
ORDER BY `Occurrences` DESC;

-- To calculate the average prices over time based on the Model as year of manufacturing
SELECT
   `Model` AS `Year`,
    AVG(`Price(INR)`) AS `Average Price`,
    MIN(`Price(INR)`) AS `Minimum Price`,
    MAX(`Price(INR)`) AS `Maximum Price`
FROM 
    cars_24.dataset_used_cars
GROUP BY 
    `Model`
ORDER BY 
    `Model` ASC;

-- To analyze regional variations by grouping data based on location
SELECT 
    `India Locations` AS `Location`,
    AVG(`Price(INR)`) AS `Average Price`,
    MIN(`Price(INR)`) AS `Minimum Price`,
    MAX(`Price(INR)`) AS `Maximum Price`
FROM 
     cars_24.dataset_used_cars
GROUP BY 
    `India Locations`
ORDER BY 
    `Average Price` DESC;
