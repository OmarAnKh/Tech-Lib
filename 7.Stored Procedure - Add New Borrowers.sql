DROP PROCEDURE IF EXISTS sp_AddNewBorrower;
Go
CREATE PROCEDURE sp_AddNewBorrower(@First_Name VARCHAR(255), @Last_Name VARCHAR(255), @Email VARCHAR(510),@DateOfBirth DATE, @MembershipDate DATE, @IsDeleted BIT)
AS BEGIN
	SET NOCOUNT ON;
	BEGIN TRY
		INSERT INTO Borrowers ([First Name], [Last Name], Email, [Date Of Birth], [Membership Date], IsDeleted)
		VALUES (@First_Name, @Last_Name, @Email, @DateOfBirth, @MembershipDate, @IsDeleted)
	END TRY
	BEGIN CATCH 
		SELECT ERROR_NUMBER() AS [Error code], ERROR_MESSAGE() AS [Error Message];
	END CATCH
END;



EXEC sp_AddNewBorrower 'John', 'Doe', 'johndoe@example.com', '1990-05-15', '2024-03-20', 0;
SELECT * FROM Borrowers WHERE Email = 'johndoe@example.com';
