WITH OverdueLoans AS (
	SELECT BookID,BorrowerID,(DATEDIFF(DAY, [Due Date],ISNULL([Date Returned], GETDATE()))) AS Days
	FROM Loans
	WHERE (DATEDIFF(DAY, [Due Date],ISNULL([Date Returned], GETDATE()))>=30)
),
OverdueAnalysis AS(
	SELECT
	Books.*,
	Borrowers.*,
	OverdueLoans.BookID AS OverdueLoansBookID,
	OverdueLoans.BorrowerID AS OverdueLoansBorrowerID,
	OverdueLoans.Days
	FROM OverdueLoans INNER JOIN Books 
	ON Books.BookID=OverdueLoans.BookID INNER JOIN Borrowers 
	ON Borrowers.BorrowerID=OverdueLoans.BorrowerID
)
SELECT * FROM OverdueAnalysis ORDER BY Days DESC;