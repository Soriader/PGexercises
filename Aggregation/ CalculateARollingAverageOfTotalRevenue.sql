-- For each day in August 2012, calculate a rolling average of total revenue over the previous 15 days.
-- Output should contain date and revenue columns, sorted by the date. Remember to account for the possibility of a day having zero revenue.
-- This one's a bit tough, so don't be afraid to check out the hint!

WITH calendar AS (
SELECT
    generate_series(
        '2012-07-18'::date,
        '2012-08-31'::date,
        '1 day'::interval
    )::date AS date_cal
),

daily_revenue AS (
  SELECT
  	DATE(b.starttime) as actual_date,
	SUM(
	  	CASE
    		WHEN b.memid = 0 THEN b.slots * f.guestcost
    		ELSE b.slots * f.membercost
		END) AS revenue

FROM cd.facilities AS f
JOIN cd.bookings AS b ON b.facid = f.facid
GROUP BY DATE(b.starttime)
),

daily_complete AS (
    SELECT
        c.date_cal,
        COALESCE(dr.revenue, 0) AS revenue
    FROM calendar AS c
    LEFT JOIN daily_revenue AS dr ON c.date_cal = dr.actual_date
),

rolling_average AS (
    SELECT
        date_cal,
        AVG(revenue) OVER (
            ORDER BY date_cal
            ROWS BETWEEN 14 PRECEDING AND CURRENT ROW
        ) AS revenue
    FROM daily_complete
)

SELECT
    date_cal AS date,
    revenue
FROM rolling_average
WHERE date_cal >= '2012-08-01'
ORDER BY date_cal;