--You'd like to produce a count of how many members you have whose surname starts with each letter of the alphabet. Sort by the letter,
--and don't worry about printing out a letter if the count is 0.


SELECT SUBSTR(surname,1,1) AS letter, COUNT(*) AS count
FROM cd.members
GROUP BY letter
ORDER BY letter
