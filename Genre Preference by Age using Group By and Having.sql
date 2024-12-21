WITH AgeGroups AS (
    SELECT 
        b.BorrowerID,
        CASE 
            WHEN DATEDIFF(YEAR, [Date of birth], GETDATE()) BETWEEN 0 AND 10 THEN '0-10'
            WHEN DATEDIFF(YEAR, [Date of birth], GETDATE()) BETWEEN 11 AND 20 THEN '11-20'
            WHEN DATEDIFF(YEAR, [Date of birth], GETDATE()) BETWEEN 21 AND 30 THEN '21-30'
            WHEN DATEDIFF(YEAR, [Date of birth], GETDATE()) BETWEEN 31 AND 40 THEN '31-40'
            ELSE '41+'
        END AS AgeGroup,
        bk.Genre
    FROM 
        Borrowers b
    JOIN 
        Loans l ON b.BorrowerID = l.BorrowerID
    JOIN 
        Books bk ON l.BookID = bk.BookID
),
GenrePreferences AS (
    SELECT 
        AgeGroup,
        Genre,
        COUNT(*) AS GenreCount
    FROM 
        AgeGroups
    GROUP BY 
        AgeGroup, Genre
),
MaxGenrePerGroup AS (
    SELECT 
        AgeGroup,
        Genre,
        GenreCount
    FROM 
        GenrePreferences g1
    WHERE 
        GenreCount = (
            SELECT MAX(GenreCount)
            FROM GenrePreferences g2
            WHERE g1.AgeGroup = g2.AgeGroup
        )
)
SELECT 
    AgeGroup,
    Genre AS PreferredGenre,
    GenreCount AS BorrowCount
FROM 
    MaxGenrePerGroup
ORDER BY 
    AgeGroup;

