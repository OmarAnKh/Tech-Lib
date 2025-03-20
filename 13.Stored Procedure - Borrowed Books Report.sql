DROP PROCEDURE IF EXISTS sp_BorrowedBooksReport;
GO
CREATE PROCEDURE sp_BorrowedBooksReport(@StartDate DATE,@EndDate DATE)
AS BEGIN
	SELECT
	Borrowers.[First Name],
	Borrowers.[Last Name],
	Borrowers.Email,
	Books.BookID,
	Books.Title,
	Loans.[Date Borrowed]
	FROM Loans
	INNER JOIN Borrowers
	ON Loans.BorrowerID=Borrowers.BorrowerID
	INNER JOIN Books
	ON Loans.BookID = Books.BookID
	WHERE Loans.[Date Borrowed] BETWEEN @StartDate AND @EndDate
	ORDER BY [Date Borrowed] DESC
END;

EXEC sp_BorrowedBooksReport '2024-02-02', '2025-02-02';
