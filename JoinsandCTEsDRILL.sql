----Joins and CTEs DRILL


--What are the three longest trips on rainy days?

WITH raining as 
(
SELECT 
DATE(date)
From weather
WHERE events = 'Rain'
GROUP BY 1
) 
SELECT
trips.trip_id,
trips.duration,
DATE(trips.start_date)
FROM trips 
JOIN raining 
on DATE(trips.start_date) = raining.date
ORDER BY duration DESC
LIMIT 3;




--Which station is full most often?
SELECT 
stations.station_id,
stations.name AS "Station",
COUNT(CASE WHEN docks_available=0 then 1 END) "Times Not Available"
FROM status
JOIN stations
ON stations.station_id = status.station_id
GROUP BY 1, 2
ORDER BY "Times Not Available" DESC
LIMIT 1;




--Return a list of stations with a count of number of trips 
--starting at that station but ordered by dock count.

SELECT
trips.start_station as "Station",
dockcount as "Dock Count",
COUNT(*) as "Trip Count"
FROM trips
JOIN stations
ON stations.name=trips.start_station
GROUP BY 1, 2
ORDER BY 2 DESC;




--(Challenge) What's the length of the longest trip 
--for each day it rains anywhere?

With rainyday as 
(
SELECT 
DATE(date) weather_date
From weather
WHERE events = 'Rain'
GROUP BY 1
),
rainy_trips as (
SELECT
trip_id,
duration,
DATE(trips.start_date) rainy_trips_date
FROM trips
JOIN rainyday
on rainyday.weather_date = DATE(trips.start_date)
ORDER BY duration DESC
)
SELECT 
rainy_trips_date,
max(duration) max_duration
from rainy_trips
GROUP BY 1
ORDER BY max_duration DESC;





