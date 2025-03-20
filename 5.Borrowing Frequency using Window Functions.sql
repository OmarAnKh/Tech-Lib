--Borrowing Frequency using Window Functions: Rank borrowers based on borrowing frequency.

Select  b.BorrowerID,
    b.[First Name],
    b.[Last Name],
	COUNT(l.LoanID),
	RANK() OVER (ORDER BY COUNT(l.LoanID) DESC)AS Rank,
	ROW_NUMBER() OVER (ORDER BY COUNT(l.LoanID) DESC) AS [Row Number],
	DENSE_RANK() OVER(ORDER BY COUNT(l.LoanID) DESC) AS [Dense Rank]
	from Borrowers b LEFT JOIN Loans l ON l.BorrowerID=b.BorrowerID 
	GROUP BY  b.BorrowerID, b.[First Name], b.[Last Name]
	ORDER BY Rank;

SELECT  * FROM Loans WHERE BorrowerID=997;