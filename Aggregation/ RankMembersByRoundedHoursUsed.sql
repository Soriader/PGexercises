--Produce a list of members (including guests), along with the number of hours they've
--booked in facilities, rounded to the nearest ten hours. Rank them by this rounded figure,
--producing output of first name, surname, rounded hours, rank. Sort by rank, surname, and first name.



SELECT firstname, surname,
	((sum(b.slots)+10)/20)*10 AS hours,
	rank() over (ORDER BY((sum(b.slots)+10)/20)*10 DESC) AS rank

FROM cd.bookings b
JOIN cd.members AS m ON b.memid = m.memid
GROUP BY m.memid
ORDER BY rank, surname, firstname;