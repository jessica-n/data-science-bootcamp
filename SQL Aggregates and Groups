--hottest day in data set and where
SELECT
	max(MaxTemperatureF) maxtemp,
	ZIP
FROM
	weather

--trips started at each station
SELECT
	count(*),
	start_station
FROM
	trips
GROUP BY 
	start_station

--shortest trip that happened
SELECT
	*,
	min(duration)
FROM
	trips

--average trip duration, by end station
SELECT
	end_station,
	avg(duration)
FROM
	trips
GROUP BY
	end_station