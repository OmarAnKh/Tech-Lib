DROP PROCEDURE IF EXISTS sp_overdue_books_for_borrower;
GO
CREATE PROCEDURE sp_overdue_books_for_borrower
AS BEGIN
	SELECT
	Loans.LoanID, 
    Loans.BorrowerID, 
    Loans.BookID, 
    Loans.[Date Borrowed], 
    Loans.[Due Date], 
    Loans.[Date Returned], 
    Borrowers.[First Name], 
    Borrowers.[Last Name], 
    Borrowers.Email
	INTO ##OverdueBorrowers
	FROM Loans JOIN Borrowers
	ON Borrowers.BorrowerID=Loans.BorrowerID
	WHERE
	(DATEDIFF(DAY, [Due Date],ISNULL([Date Returned], GETDATE())) > 0)
	-- for a local table we can use the single #
	-- for a global table we can use the double ## as i did so i can access it from outside the PROCEDURE
END;
-- here is a DROP query if needed
--DROP TABLE ##OverdueBorrowers
EXEC sp_overdue_books_for_borrower;
SELECT * FROM ##OverdueBorrowers ORDER BY BorrowerID;
