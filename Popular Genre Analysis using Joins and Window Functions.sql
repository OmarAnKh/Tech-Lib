WITH GenreBorrowings AS (
    SELECT 
        b.Genre,
        COUNT(l.BookID) AS BorrowedCount
    FROM loans l
    JOIN Books b ON l.BookID = b.BookID
    WHERE FORMAT(l.[Date Borrowed], 'yyyy-MM') = '2024-12'
    GROUP BY b.Genre
),
RankedGenres AS (
    SELECT 
        Genre,
        BorrowedCount,
        RANK() OVER (ORDER BY BorrowedCount DESC) AS GenreRank
    FROM GenreBorrowings
)
SELECT Genre, BorrowedCount
FROM RankedGenres
WHERE GenreRank = 1;
