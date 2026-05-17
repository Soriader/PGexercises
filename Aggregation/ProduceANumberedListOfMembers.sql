-- Produce a monotonically increasing numbered list
-- of members (including guests), ordered by their date of joining.
-- Remember that member IDs are not guaranteed to be sequential.

SELECT ROW_NUMBER() OVER(ORDER BY joindate) AS row_num,
		m.firstname,
		m.surname
FROM cd.members AS m
Order By m.joindate