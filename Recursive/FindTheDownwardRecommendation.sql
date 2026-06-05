-- Find the downward recommendation chain for member ID 1: that is, the members they recommended,
-- the members those members recommended, and so on. Return member ID and name, and order by ascending member id.

WITH RECURSIVE recomendation AS (
	SELECT
  		mem.memid,
  		mem.firstname,
  		mem.surname,
  		mem.recommendedby
  	FROM cd.members AS mem
  	JOIN cd.members AS rec ON rec.memid = mem.recommendedby
  	WHERE mem.recommendedby = 1

UNION ALL

  	SELECT
  		mem.memid,
  		mem.firstname,
  		mem.surname,
  		mem.recommendedby
  	FROM recomendation AS rec
  	JOIN cd.members AS mem ON rec.memid = mem.recommendedby
)
SELECT memid, firstname, surname
FROM recomendation
ORDER BY memid ASC