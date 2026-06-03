-- Work out the utilisation percentage for each facility by month, sorted by name and month,
-- rounded to 1 decimal place. Opening time is 8am, closing time is 8.30pm.
-- You can treat every month as a full month, regardless of if there were some dates the club was not open.

 WITH monthly_bookings AS (
    SELECT
        f.name,
        date_trunc('month', b.starttime) AS month,
        SUM(b.slots) AS booked_slots
    FROM cd.facilities AS f
    JOIN cd.bookings AS b
        ON f.facid = b.facid
    GROUP BY
        f.name,
        date_trunc('month', b.starttime)
)
SELECT
    name,
    month,
    ROUND(
        booked_slots::numeric
        / (EXTRACT(DAY FROM (month + INTERVAL '1 month') - month) * 25)
        * 100,
        1
    ) AS utilisation
FROM monthly_bookings
ORDER BY
    name,
    month;