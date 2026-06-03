-- Return a list of the start and end time of the last 10 bookings
-- (ordered by the time at which they end, followed by the time at which they start) in the system.


SELECT starttime, starttime + slots*(interval '30 minutes') AS endtime
FROM cd.bookings
ORDER BY endtime DESC, starttime DESC
LIMIT 10