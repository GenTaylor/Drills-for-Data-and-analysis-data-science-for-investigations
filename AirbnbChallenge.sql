
--What's the most expensive listing? What else can you tell me about the listing?


Select * from listings where price = (select max(price) from listings);


--There are two most expensive lots in Asheville, NC.One is named Brookwood and the other is named Montgord Bungalow. 
--One is located in zipcode/neighborhood 2 One is a house and the other is a townhouse.




--What neighborhoods seem to be the most popular?

SELECT
    neighborhood_cleansed,
	availability_30,
	availability_60,
	availability_90,
	availability_365
FROM
    listings
WHERE 
    availability_365 < 5 AND
    number_of_reviews >100
ORDER BY availability_365 ASC;

--The most popular neighborhoods are 28804, 28801, and 28806.




--What time of year is the cheapest time to go to your city? What about the busiest?

Select * 
from calendar 
where price = (select min(price) from calendar);

--The cheapest time to go to the city is January 27, 2019 for $10.




SELECT
    calendar.calendar_date,
	calendar.available,
	listings.number_of_reviews,
	listings.reviews_per_month,
	listings.availability_30,
	listings.availability_60,
	listings.availability_90,
	listings.availability_365
FROM
    calendar
JOIN listings
ON calendar.listing_id = listings.id
WHERE 
    listings.availability_365 < 5 AND
    listings.number_of_reviews >100
	ORDER BY listings.reviews_per_month DESC;
	
--The busiest time is around July 4th.
