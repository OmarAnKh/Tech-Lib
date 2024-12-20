WITH ActiveBorrowers AS (
    SELECT BorrowerID, BookID
    FROM loans
    WHERE [Date Returned] IS NULL
),
BorrowerCounts AS (
    SELECT BorrowerID, COUNT(BookID) AS BorrowedBooks
    FROM ActiveBorrowers
    GROUP BY BorrowerID
    HAVING COUNT(BookID) >= 2
)
SELECT b.BorrowerID
FROM BorrowerCounts b
JOIN ActiveBorrowers a ON b.BorrowerID = a.BorrowerID
GROUP BY b.BorrowerID
HAVING COUNT(a.BookID) >= 2;


;with BorrowerIdentifyer as (
	SELECT BorrowerID
	,COUNT(*)
	borrowCount from Loans
	where [Date Returned] IS NULL
	GROUP BY BorrowerID
),
ActiveBorrowers as (
	select *
	from Borrowers
	where BorrowerID
	IN
	(select BorrowerID from BorrowerIdentifyer where borrowCount>=2)
)
select * from ActiveBorrowers;


