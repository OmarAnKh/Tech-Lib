CREATE FUNCTION fn_BookBorrowingFrequency(@BookID int)
RETURNS int AS
BEGIN
	DECLARE @return_value int =0;
	SELECT @return_value=COUNT(*)
	FROM Loans
	WHERE BookID=@BookID;
	RETURN @return_value
END;
select * from loans where BookID=156;
SELECT dbo.fn_BookBorrowingFrequency(156) as [Book Borrowing Frequency];