-- Find all facilities whose name begins with 'Tennis'. Retrieve all columns.

SELECT *
FROM cd.facilities
WHERE name LIKE '%Tennis Court%'