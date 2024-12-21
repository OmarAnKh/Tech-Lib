DROP PROCEDURE  IF EXISTS p_borrower_insert;
GO
CREATE PROCEDURE p_borrower_insert 
	@ID int, 
    @FirstName varchar(255), 
    @LastName varchar(255), 
    @NewEmail varchar(255), 
    @birthday date,
	@MembershipDate date
AS
BEGIN
	IF EXISTS(SELECT 1 FROM Borrowers WHERE Email=@NewEmail)
	BEGIN
        THROW 50001, 'Email already exists. No record inserted.', 1;
    END
	
	INSERT INTO Borrowers
	VAlUES(@ID,@FirstName,@LastName,@NewEmail,@birthday,@MembershipDate);

END;

EXEC p_borrower_insert 11111, "Omar", "Khalili", "Omarkhalili810@gmail.com", "02-02-2004","02-02-2006";
select * from Borrowers where BorrowerID=11111;