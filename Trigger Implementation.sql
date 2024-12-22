CREATE TABLE AuditLog(
	LogID int IDENTITY(1,1) primary key,
	BookID int Foreign key REFERENCES Books(BookID),
	[Status change] varchar(10) NOT NULL,
	[Change Date] date
)

CREATE TRIGGER BookStatusChangeTrigger
ON Books
AFTER UPDATE
AS
BEGIN
    INSERT INTO AuditLog ( BookID, [Status change], [Change Date])
    SELECT 
        i.BookID,
        i.[Current Status],
        GETDATE()
    FROM INSERTED i;
END;

UPDATE Books SET [Current Status] = 'Borrowed' WHERE BookID = 3
SELECT * FROM BOOKS;
SELECT * FROM AuditLog 