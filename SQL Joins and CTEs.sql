--What are the three longest trips on rainy days?

WITH rainy
AS (
	SELECT Date FROM weather 
	WHERE Events = 'Rain'
	GROUP BY Date 
)
SELECT trip_id, duration, start_date
FROM trips
JOIN rainy AS r ON r.date = DATE(start_date)
ORDER BY duration DESC 
LIMIT 3

--Which station is full most often?
SELECT status.station_id, stations.name, 
COUNT(CASE WHEN docks_available = 0 then 1 END) AS empty
FROM status
JOIN stations ON stations.station_id = status.station_id
GROUP BY stations.station_id
ORDER BY empty DESC

--Return a list of stations with a count of number of trips starting at that station but ordered by dock count.
SELECT trips.start_station, COUNT(*)
FROM trips 
JOIN stations ON stations.name=trips.start_station
GROUP BY trips.start_station
ORDER BY stations.dockcount

--(Challenge) What's the length of the longest trip for each day it rains anywhere?
SELECT MAX(trips.duration), DATE(start_date)  AS trip_date
FROM trips 
JOIN weather ON weather.date=trip_date
WHERE Events = 'Rain'
GROUP BY trip_date
