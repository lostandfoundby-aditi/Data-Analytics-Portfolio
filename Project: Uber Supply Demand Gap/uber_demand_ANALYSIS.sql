CREATE DATABASE uber_supply_demand_gap;
USE uber_supply_demand_gap;

CREATE TABLE uber_request_data (
  Request_id INT,
  Pickup_point VARCHAR (50),
  Driver_id VARCHAR (50),
  Status VARCHAR (50),
  Request_timestamp VARCHAR (50),
  Drop_timestamp VARCHAR (50)
);

SELECT count(*)
FROM uber_request_data;

----------- REMOVING DUPLICATES ----------
SELECT *
FROM uber_request_data
GROUP BY Request_id, Pickup_point, Driver_id, Status, Request_timestamp, Drop_timestamp
HAVING COUNT(*) > 1;

----------- FROMATTING TABLE ---------------

CREATE TABLE uber_request_cleaned (
    request_id INT,
    driver_id INT,
    pickup_point VARCHAR(50),
    request_timestamp VARCHAR(50),
    drop_timestamp VARCHAR(50),
	time_slot VARCHAR(20),
    date DATE,
    weekday VARCHAR(20),
    status VARCHAR(50)
);

INSERT INTO uber_request_cleaned (
    request_id, driver_id, pickup_point,
    request_timestamp, drop_timestamp,
    time_slot, date, weekday, status
)
SELECT 
    Request_id,
    CASE 
        WHEN Driver_id IN ('', 'NA') THEN NULL
        ELSE CAST(Driver_id AS UNSIGNED)
    END,
    Pickup_point,

    CASE
        WHEN Request_timestamp IN ('', 'NA') THEN NULL
        ELSE TIME(STR_TO_DATE(Request_timestamp, '%d-%m-%y %H:%i'))
    END,
    
    CASE
        WHEN Drop_timestamp IN ('', 'NA') THEN NULL
        ELSE TIME(STR_TO_DATE(Drop_timestamp, '%d-%m-%y %H:%i'))
    END,
    CASE
	    WHEN HOUR(request_timestamp) BETWEEN 0 AND 4 THEN 'Late Night'
        WHEN HOUR(request_timestamp) BETWEEN 5 AND 7 THEN 'Early Morning'
        WHEN HOUR(request_timestamp) BETWEEN 8 AND 11 THEN 'Morning'
        WHEN HOUR(request_timestamp) BETWEEN 12 AND 15 THEN 'Afternoon'
        WHEN HOUR(request_timestamp) BETWEEN 16 AND 19 THEN 'Evening'
        WHEN HOUR(request_timestamp) BETWEEN 20 AND 23 THEN 'Night'
        ELSE 'Unknown'
    END,

    CASE
        WHEN Request_timestamp IN ('', 'NA') THEN NULL
        ELSE DATE(STR_TO_DATE(Request_timestamp, '%d-%m-%y %H:%i'))
    END,

    CASE
        WHEN Request_timestamp IN ('', 'NA') THEN NULL
        ELSE DAYNAME(STR_TO_DATE(Request_timestamp, '%d-%m-%y %H:%i'))
    END,

    Status
    FROM uber_request_data;

select *
from uber_request_cleaned;

select count(*)
from uber_request_cleaned;

-------------------- REMOVING DUPLICATES --------------

SELECT request_id, COUNT(*) AS duplicates
FROM uber_request_cleaned
GROUP BY request_id
HAVING duplicates > 1;

----------- CHECKING FOR NULL VALUES -----------------

SELECT COUNT(*) AS null_timestamps
FROM uber_request_cleaned
WHERE request_timestamp IS NULL;


-------------------------------------------------------- INSIGHTS -----------------------------------------------------------------------------

----------- 1) SEGMENTATION FOR TRIP COMPLETED --------------------------
SELECT status, driver_id, COUNT(*) 
FROM uber_request_cleaned
WHERE status = 'Trip Completed'
GROUP BY status, driver_id
ORDER BY status, driver_id;

SELECT COUNT(*) AS Total_trips_completed
FROM uber_request_cleaned
WHERE status = 'Trip Completed';

----------- 2) SEGMENTATION FOR CANCELLATIONS ----------------------------

SELECT status, driver_id, COUNT(*) 
FROM uber_request_cleaned
WHERE status = 'Cancelled'
GROUP BY status, driver_id
ORDER BY status, driver_id;

SELECT COUNT(*) as Total_trips_cancelled
FROM uber_request_cleaned
WHERE status = 'Cancelled';

----------- 3) SEGMENTATION FOR NO CARS AVAILABLE ------------------------

SELECT status, driver_id, COUNT(*) 
FROM uber_request_cleaned
WHERE status= 'No cars available'
GROUP BY status, driver_id
ORDER BY status, driver_id;

SELECT COUNT(*) as Total_cars_unavailable
FROM uber_request_cleaned
WHERE status = 'No cars available';

-------------- 4) DRIVER WITH HIGHEST/LOWEST NUMBER OF TRIPS COMPLETED -------------

SELECT status, driver_id, COUNT(*) AS total_trips
FROM uber_request_cleaned
WHERE status= 'Trip completed'
GROUP BY status, driver_id
ORDER BY total_trips DESC
LIMIT 5;

SELECT driver_id, COUNT(*) AS total_trips
FROM uber_request_cleaned
WHERE status = 'Trip Completed'
GROUP BY status, driver_id
ORDER BY total_trips ASC
LIMIT 5;

----------------- 5) HIGHEST AND LOWEST NUMBER OF REQUESTS MADE TO DRIVER ID ----------------------

SELECT driver_id, COUNT(*) AS total_requests
FROM uber_request_cleaned
WHERE driver_id IS NOT NULL
GROUP BY driver_id
ORDER BY total_requests DESC
LIMIT 1;

SELECT driver_id, COUNT(*) AS total_requests
FROM uber_request_cleaned
WHERE driver_id IS NOT NULL
GROUP BY driver_id
ORDER BY total_requests ASC
LIMIT 1;

----------------- 6) TOTAL NUMBER OF PICKUPS --------------------------

SELECT pickup_point, COUNT(*) AS total_pickup
FROM uber_request_cleaned
GROUP BY pickup_point
ORDER BY total_pickup;

----------------- 7) MOST LIFTING IS DONE FROM ------------------------

SELECT pickup_point, weekday, COUNT(*) AS most_lifting
FROM uber_request_cleaned
GROUP BY pickup_point, weekday
ORDER BY pickup_point, most_lifting DESC
;

SELECT * FROM uber_request_cleaned
INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/uber_cleaned.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n';
