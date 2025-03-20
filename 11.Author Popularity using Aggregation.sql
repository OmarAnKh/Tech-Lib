--Author Popularity using Aggregation: Rank authors by the borrowing frequency of their books.
WITH AuthorBorrowing 
AS(
	SELECT COUNT(Loans.BookID) AS [Book Borrowing Frequency],
	Books.Author
	FROM Loans
	INNER JOIN Books
	ON Books.BookID=Loans.BookID
	GROUP BY Books.Author
),
RankedAuthors
AS(
	SELECT Author,
	[Book Borrowing Frequency],
	RANK() OVER(ORDER BY([Book Borrowing Frequency]) DESC) AS Rank,
	ROW_NUMBER() OVER(ORDER BY([Book Borrowing Frequency]) DESC ) AS [Row Number],
	DENSE_RANK() OVER(ORDER BY([Book Borrowing Frequency]) DESC) AS [Dense Rank]
	FROM AuthorBorrowing
)


SELECT *
	FROM RankedAuthors
	ORDER BY RankedAuthors.[Book Borrowing Frequency] DESC;



