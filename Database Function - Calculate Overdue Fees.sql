CREATE FUNCTION fn_CalculateOverdueFees(@LoanID int)
RETURNS int AS
BEGIN
	DECLARE @return_value int=0;
	DECLARE @days int;
	SELECT @days = DATEDIFF(DAY, [Due Date],ISNULL([Date Returned], GETDATE()))
	FROM loans
	WHERE LoanID = @LoanID;
	IF @days<=30
	BEGIN
		SET @return_value=@days*1;
	END
	ELSE IF @days >30
	BEGIN
		SET @return_value=@days*2;
	END

	RETURN @return_value
END;

SELECT * FROM LOANS WHERE LoanID=1;
SELECT dbo.fn_CalculateOverdueFees(1) as Fees;