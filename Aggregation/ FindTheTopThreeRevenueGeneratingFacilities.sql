-- Produce a list of the top three revenue generating facilities (including ties).
--Output facility name and rank, sorted by rank and facility name.

SELECT
    f.name AS name,
    RANK() OVER (
        ORDER BY SUM(
            CASE
                WHEN memid = 0 THEN slots * f.guestcost
                ELSE slots * membercost
            END
        ) DESC
    ) AS rank
FROM cd.bookings b
JOIN cd.facilities f ON b.facid = f.facid
GROUP BY f.name
LIMIT 3