-- Output the names of all members, formatted as 'Surname, Firstname'

SELECT (surname ||', '|| firstname) AS name
FROM cd.members