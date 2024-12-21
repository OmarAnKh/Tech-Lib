DROP PROCEDURE IF EXISTS sp_BorrowedBooksReport;
GO
CREATE PROCEDURE sp_BorrowedBooksReport(@StartDate date, @EndDate date)
AS BEGIN
	SELECT  Books.BookID, 
        Books.Title, 
        Books.Author, 
        Books.ISBN, 
        Books.[Published Date], 
        Books.Genre, 
        Books.[Shelf Location], 
        Books.[Current Status],
        Loans.LoanID, 
        Loans.BorrowerID, 
        Loans.[Date Borrowed], 
        Loans.[Due Date], 
        Loans.[Date Returned],
        Loans.BookID AS LoansBookID,
		Borrowers.*
	FROM Books
	INNER JOIN Loans
	INNER JOIN Borrowers
	ON Loans.BorrowerID=Borrowers.BorrowerID
	ON Books.BookID=Loans.BookID
	WHERE [Date Borrowed] BETWEEN @StartDate AND @EndDate;
END;

EXEC sp_BorrowedBooksReport '2024-01-01' ,'2024-12-31';