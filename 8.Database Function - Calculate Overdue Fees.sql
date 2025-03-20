--Database Function - Calculate Overdue Fees:
--Function Name: fn_CalculateOverdueFees
--Purpose: Compute overdue fees for a given loan.
--Parameter: LoanID
--Implementation: Charge fees based on overdue days: $1/day for up to 30 days, $2/day after.
--Return: Overdue fee for the LoanID.

CREATE FUNCTION fn_CalculateOverdueFees (@LoanId int)
RETURNS DECIMAL(10,2) AS
BEGIN
	DECLARE @Fee DECIMAL(10,2),@DueDate DATE, @DateReturned DATE, @OverDueDays INT;

	SELECT
	@DueDate=[Due Date],
	@DateReturned =[Date Returned]
	FROM Loans
	WHERE LoanID=@LoanId;

	IF @DateReturned IS NULL
		RETURN NULL

	Set @OverDueDays = DATEDIFF(DAY, @DueDate, @DateReturned);

	IF @OverDueDays <= 0
		SET @Fee=0
	ELSE 
		SET @Fee= CASE
			WHEN @OverDueDays <= 30 THEN @OverDueDays * 1
			ELSE (30 * 1) + ((@OverDueDays - 30) * 2)
		END
	RETURN @Fee
END;

SELECT LoanID,[Due Date],[Date Returned],dbo.fn_CalculateOverdueFees(LoanID) AS OverdueFee FROM Loans where dbo.fn_CalculateOverdueFees(LoanID) > 0;