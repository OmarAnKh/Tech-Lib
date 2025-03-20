--Database Function - Book Borrowing Frequency:
--Function Name: fn_BookBorrowingFrequency
--Purpose: Gauge the borrowing frequency of a book.
--Parameter: BookID
--Implementation: Count the number of times the book has been issued.
--Return: Borrowing count of the book.
CREATE FUNCTION fn_BookBorrowingFrequency(@BookID INT)
RETURNS INT 
AS
	BEGIN
		DECLARE @BorrowingFrequewe ncy INT;
		
		SELECT
		@BorrowingFrequency=COUNT(BookID)
		FROM Loans
		WHERE Loans.BookID=@BookID;

		RETURN @BorrowingFrequency;
END;


--There is repeated calls over here so instead I used the CTE to return on memory table to use it in my query instead of calling the function multiple times.
SELECT
BookID,
dbo.fn_BookBorrowingFrequency(BookID) AS [Borrowing Frequency],
RANK()OVER(ORDER BY (dbo.fn_BookBorrowingFrequency(BookID)) DESC) AS Rank,
ROW_NUMBER() OVER(ORDER BY(dbo.fn_BookBorrowingFrequency(BookID)) DESC) AS [Row Number],
DENSE_RANK() OVER(ORDER BY(dbo.fn_BookBorrowingFrequency(BookID)) DESC) AS [Dense Rank]
FROM Books;






WITH BookBorrowingFrequencies AS (
    SELECT
        BookID,
        dbo.fn_BookBorrowingFrequency(BookID) AS BorrowingFrequency
    FROM Books
)
SELECT
    bbf.BookID,
    bbf.BorrowingFrequency AS [Borrowing Frequency],
    RANK() OVER (ORDER BY bbf.BorrowingFrequency DESC) AS Rank,
    ROW_NUMBER() OVER (ORDER BY bbf.BorrowingFrequency DESC) AS [Row Number],
    DENSE_RANK() OVER (ORDER BY bbf.BorrowingFrequency DESC) AS [Dense Rank]
FROM BookBorrowingFrequencies bbf;