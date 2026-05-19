-- How can you produce a list of all facilities with the word 'Tennis' in their name?

SELECT facid, name, membercost, guestcost, initialoutlay, monthlymaintenance
FROM cd.facilities
WHERE name LIKE'%Tennis%';