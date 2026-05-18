-- How can you produce a list of facilities that charge a fee to members?

SELECT  facid, name, membercost,guestcost, initialoutlay, monthlymaintenance
FROM cd.facilities
Where membercost > 0;