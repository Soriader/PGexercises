-- The telephone numbers in the database are very inconsistently formatted.
-- You'd like to print a list of member ids and numbers that have had '-','(',')',
-- and ' ' characters removed. Order by member id.

SELECT memid, translate(telephone, '-() ', '') as telephone
FROM cd.members
ORDER BY memid