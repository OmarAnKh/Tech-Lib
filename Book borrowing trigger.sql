CREATE TRIGGER BookBorrowingTrigger
ON Books
AFTER UPDATE
AS 
BEGIN 
    IF EXISTS (
        SELECT 1
        FROM INSERTED i
        JOIN DELETED d ON i.BookID = d.BookID
        WHERE d.[Current Status] = 'Borrowed' AND i.[Current Status] = 'Borrowed'
    )
    BEGIN
        RAISERROR('You cant borrow a Borrowed book wait until the borrower returns it.', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;

SELECT * FROM Books WHERE BookID=2;
update  books SET [Current Status] = 'Borrowed' WHERE BookID =2;

