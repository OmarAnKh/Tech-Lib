--Design a trigger to log an entry into a separate AuditLog table whenever a book's status changes from 'Available' to 'Borrowed' or vice versa. The AuditLog should capture BookID, StatusChange, and ChangeDate.
DROP TABLE AuditLog
CREATE TABLE AuditLog (
	LogID INT IDENTITY(1,1) PRIMARY KEY,
	BookID INT FOREIGN KEY REFERENCES Books(BookID),
	[Status Change] VARCHAR(20) NOT NULL,
	[Change Date] DATE DEFAULT GETDATE()
);


CREATE TRIGGER TR_Status_Change
ON Books
AFTER UPDATE
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO AuditLog(BookID, [Status Change], [Change Date])
	SELECT
	inserted.BookID,
	 CONCAT('Changed to ', inserted.[Current Status]) AS [Status Change],
	 GETDATE()
	FROM inserted
	INNER JOIN deleted 
	ON inserted.BookID=deleted.BookID
	WHERE inserted.[Current Status]<> deleted.[Current Status]
	AND (inserted.[Current Status] = 'Available' OR inserted.[Current Status] = 'Borrowed'); 
END;


UPDATE Books 
SET [Current Status] = 'Borrowed' 
WHERE BookID = 1;


SELECT * FROM AuditLog;

