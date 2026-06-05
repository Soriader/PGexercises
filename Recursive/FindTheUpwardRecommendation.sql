--Find the upward recommendation chain for member ID 27: that is, the member who recommended them,
--and the member who recommended that member, and so on.
--Return member ID, first name, and surname. Order by descending member id.

WITH RECURSIVE recomendation AS (
SELECT
  	rec.memid,
  	rec.firstname,
  	rec.surname,
  	rec.recommendedby
FROM cd.members AS m
JOIN cd.members AS rec ON rec.memid  = m.recommendedby
WHERE m.memid = 27

  UNION ALL

SELECT
  	m.memid,
  	m.firstname,
  	m.surname,
	m.recommendedby
FROM recomendation AS rec
JOIN cd.members AS m ON rec.recommendedby  = m.memid
  )
SELECT memid, firstname, surname
FROM recomendation
ORDER BY memid DESC