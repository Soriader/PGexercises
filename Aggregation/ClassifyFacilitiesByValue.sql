 --Classify facilities into equally sized groups of high, average,
 --and low based on their revenue. Order by classification and facility name.

WITH facility_revenue AS (
SELECT
  	f.name,
	SUM(
	  	CASE
    		WHEN b.memid = 0 THEN b.slots * f.guestcost
    		ELSE b.slots * f.membercost
		END) AS revenue

FROM cd.facilities AS f
JOIN cd.bookings AS b ON b.facid = f.facid
GROUP BY f.name
),

classified AS (
    SELECT
        name,
        revenue,
        NTILE(3) OVER (ORDER BY revenue DESC) AS revenue_group
    FROM facility_revenue
)

SELECT
    name,
    CASE
        WHEN revenue_group = 1 THEN 'high'
        WHEN revenue_group = 2 THEN 'average'
        WHEN revenue_group = 3 THEN 'low'
    END AS classification
FROM classified
ORDER BY revenue_group, name;
