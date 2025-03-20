WITH AgeGroups AS (
    SELECT 
        BorrowerID,
        CASE 
            WHEN DATEDIFF(YEAR, [Date Of Birth], GETDATE()) BETWEEN 0 AND 10 THEN '(0-10)'
            WHEN DATEDIFF(YEAR, [Date Of Birth], GETDATE()) BETWEEN 11 AND 20 THEN '(11-20)'
            WHEN DATEDIFF(YEAR, [Date Of Birth], GETDATE()) BETWEEN 21 AND 30 THEN '(21-30)'
            WHEN DATEDIFF(YEAR, [Date Of Birth], GETDATE()) BETWEEN 31 AND 40 THEN '(31-40)'
            WHEN DATEDIFF(YEAR, [Date Of Birth], GETDATE()) BETWEEN 41 AND 50 THEN '(41-50)'
            WHEN DATEDIFF(YEAR, [Date Of Birth], GETDATE()) BETWEEN 51 AND 60 THEN '(51-60)'
            ELSE '(60+)' 
        END AS AgeGroup
    FROM Borrowers
),
GenreBorrowing AS (
    SELECT 
        ag.AgeGroup,
        b.Genre,
        COUNT(l.LoanID) AS BorrowingFrequency
    FROM Loans l
    JOIN Books b ON l.BookID = b.BookID
    JOIN Borrowers br ON l.BorrowerID = br.BorrowerID
    JOIN AgeGroups ag ON br.BorrowerID = ag.BorrowerID
    GROUP BY ag.AgeGroup, b.Genre
),
MaxGenreBorrowing AS (
    SELECT 
        AgeGroup,
        MAX(BorrowingFrequency) AS MaxFrequency
    FROM GenreBorrowing
    GROUP BY AgeGroup
)
SELECT gb.AgeGroup, gb.Genre AS PreferredGenre, gb.BorrowingFrequency
FROM GenreBorrowing gb
JOIN MaxGenreBorrowing mg ON gb.AgeGroup = mg.AgeGroup
WHERE gb.BorrowingFrequency = mg.MaxFrequency
ORDER BY gb.AgeGroup;
