;WITH BorrowerFrequency AS(
	SELECT BorrowerID,
	COUNT(*) as NumberOFBorrows,
	Rank() OVER(ORDER BY COUNT(*) DESC)
	as rank
	from Loans
	group by BorrowerID
),BorrowersINFO AS (
	SELECT Borrowers.*
	,BorrowerFrequency.NumberOFBorrows
	,BorrowerFrequency.rank
	from Borrowers INNER JOIN BorrowerFrequency
	ON Borrowers.BorrowerID = BorrowerFrequency.BorrowerID
)
SELECT * FROM BorrowersINFO ORDER BY rank


SELECT 
    BorrowerID,
    COUNT(BookID) AS BorrowedBooks,
    RANK() OVER (ORDER BY COUNT(BookID) DESC) AS BorrowingRank
FROM loans
GROUP BY BorrowerID
ORDER BY BorrowingRank;