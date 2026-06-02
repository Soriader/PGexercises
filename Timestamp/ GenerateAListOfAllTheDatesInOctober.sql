-- Produce a list of all the dates in October 2012.
-- They can be output as a timestamp (with time set to midnight) or a date.

SELECT generate_series(
        '2012-10-01'::date,
        '2012-10-31'::date,
        '1 day'::interval
    ) AS TS