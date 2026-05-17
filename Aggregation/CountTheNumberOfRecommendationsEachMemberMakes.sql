-- Produce a count of the number of recommendations each member has made. Order by member ID.

SELECT
    m.memid AS recommendedby,
    COUNT(r.recommendedby)
FROM cd.members AS m
JOIN cd.members AS r
    ON r.recommendedby = m.memid
GROUP BY m.memid
ORDER BY m.memid;

--another (and better) result

SELECT recommendedby, COUNT(*)
	FROM cd.members
	WHERE recommendedby IS NOT NULL
	GROUP BY recommendedby
ORDER BY recommendedby;