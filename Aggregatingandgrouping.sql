--What was the hottest day in our data set? 
--Where was that?

SELECT
	max(date) AS "Day",
	max(zip) AS "City",
	max(maxtemperaturef) AS "Temp"
FROM
	weather;

--Hottest dat was August 31, 2016 in zip 95113

--DRILL Aggregating and grouping




--How many trips started at each station?
SELECT
	start_station as "Start Station",
	count(trip_id) as "Number of Trips"
FROM
	trips
GROUP BY 
	start_station;




--What's the shortest trip that happened?

SELECT

	min(duration) AS "Shortest Trip"
FROM
	trips;

--Unsure if more detail was needed. Answer was 60.




--What is the average trip duration, by end station?

SELECT 
	end_station as "End Station",
	AVG(duration) as "Average Trip Duration"
FROM 
	trips
GROUP BY
	end_station;




