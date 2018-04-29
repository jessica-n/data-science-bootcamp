--What's the most expensive listing? What else can you tell me about the listing?
SELECT *
FROM listings
ORDER BY price DESC 
LIMIT 1

--What neighborhoods seem to be the most popular? (based on most # of bookings)
SELECT neighbourhood, SUM(365-availability_365) AS days_booked
FROM listings
GROUP BY neighbourhood
ORDER BY days_booked DESC

--What time of year is the cheapest time to go to your city? What about the busiest?
SELECT date, MIN(price) AS cheap
FROM calendar
GROUP BY date
ORDER BY cheap 

SELECT date, COUNT(*) AS bookings
FROM calendar
WHERE available = 'f'
GROUP BY date
ORDER BY bookings DESC
