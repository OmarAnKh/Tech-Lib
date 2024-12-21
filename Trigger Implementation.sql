CREATE TRIGGER BookStatusChangeTrigger
ON Books
AFTER UPDATE
AS
BEGIN
    INSERT INTO AuditLog (LogID, BookID, StatusChange, ChangeDate)
    SELECT 
        1,
        i.BookID,
        i.[Current Status],
        GETDATE()
    FROM INSERTED i;
END;

UPDATE Books SET [Current Status] = 'Borrowed' WHERE BookID = 3
SELECT * FROM BOOKS;
SELECT * FROM AuditLog 