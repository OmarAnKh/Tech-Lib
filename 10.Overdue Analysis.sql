--Overdue Analysis: List all books overdue by more than 30 days with their associated borrowers.
WITH OverdueBooks
AS(
	SELECT
	LoanId,
	BorrowerID,
	BookID
	FROM Loans
	WHERE DATEDIFF(DAY, [Due Date], [Date Returned]) > 30
)

SELECT o.LoanID,B.Email,Bo.Title FROM
	OverdueBooks o
	INNER JOIN Borrowers b 
	On o.BorrowerID=b.BorrowerID
	INNER JOIN Books Bo
	ON o.BookID=Bo.BookID;

SELECT * FROM Loans WHERE LoanID=125;