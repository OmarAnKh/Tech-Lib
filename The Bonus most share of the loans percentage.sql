use [Tech-Lib]
WITH WeeklyLoans AS (
    SELECT
        DATEPART(WEEKDAY, [Date Borrowed]) AS Weekday,
        COUNT(*) AS TotalLoans
    FROM Loans
    GROUP BY DATEPART(WEEKDAY, [Date Borrowed])
)
, TotalLoanCount AS (
    SELECT COUNT(*) AS TotalLoanCount
    FROM Loans
)
SELECT 
    CASE 
        WHEN Weekday = 1 THEN 'Sunday'
        WHEN Weekday = 2 THEN 'Monday'
        WHEN Weekday = 3 THEN 'Tuesday'
        WHEN Weekday = 4 THEN 'Wednesday'
        WHEN Weekday = 5 THEN 'Thursday'
        WHEN Weekday = 6 THEN 'Friday'
        WHEN Weekday = 7 THEN 'Saturday'
    END AS DayOfWeek,
    TotalLoans,
    CAST(TotalLoans AS FLOAT) / TotalLoanCount.TotalLoanCount * 100 AS Percentage
FROM WeeklyLoans
CROSS JOIN TotalLoanCount
ORDER BY Percentage DESC;