--Based on the 3 complete months of data so far, calculate the amount of time each facility will
--take to repay its cost of ownership.
--Remember to take into account ongoing monthly maintenance. Output facility name and payback time in months,
--order by facility name. Don't worry about differences in month lengths, we're only looking for a rough value here!


WITH revenue AS (
  SELECT
  	f.name,
  	f.initialoutlay,
  	f.monthlymaintenance,
	SUM(
	  	CASE
    		WHEN b.memid = 0 THEN b.slots * f.guestcost
    		ELSE b.slots * f.membercost
		END) AS revenue

FROM cd.facilities AS f
JOIN cd.bookings AS b ON b.facid = f.facid
GROUP BY f.name, f.initialoutlay, f.monthlymaintenance
),
payback_time AS (
  SELECT
    name,
  	initialoutlay,
  	monthlymaintenance,
  	(initialoutlay / ((revenue / 3) - monthlymaintenance)) AS months
  FROM revenue
)
SELECT
	name,
	months
FROM payback_time
ORDER BY name