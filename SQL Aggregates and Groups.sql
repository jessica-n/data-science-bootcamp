--hottest day in data set and where
SELECT MAX(MaxTemperatureF) AS maxtemp, ZIP
FROM weather

--trips started at each station
SELECT COUNT(*), start_station
FROM trips
GROUP BY start_station

--shortest trip that happened
SELECT *, MIN(duration)
FROM trips
LIMIT 1

--average trip duration, by end station
SELECT end_station, avg(duration)
FROM trips
GROUP BY end_station