-- Produce a CTE that can return the upward recommendation chain for any member.
-- You should be able to select recommender from recommenders where member=x.
-- Demonstrate it by getting the chains for members 12 and 22. Results table
-- should have member and recommender, ordered by member ascending, recommender descending.


WITH RECURSIVE recommendation AS (
    SELECT
        m.recommendedby AS recommender,
        m.memid AS member
    FROM cd.members AS m

    UNION ALL

    SELECT
        m.recommendedby AS recommender,
        r.member
    FROM recommendation AS r
    JOIN cd.members AS m ON m.memid = r.recommender
)

SELECT
    r.member,
    r.recommender,
    m.firstname,
    m.surname
FROM recommendation AS r
JOIN cd.members AS m ON m.memid = r.recommender
WHERE r.member = 12
   OR r.member = 22
ORDER BY r.member ASC, r.recommender DESC;