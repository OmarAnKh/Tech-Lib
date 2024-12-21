SELECT Books.Author
,Count(*) AS BorrowingFrequency
FROM Loans
INNER JOIN Books
on Loans.BookID=Books.BookID
GROUP BY Books.Author
ORDER BY BorrowingFrequency DESC
