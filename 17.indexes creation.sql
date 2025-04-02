-- Index on frequently filtered columns
CREATE INDEX IX_Loans_BorrowerID ON Loans(BorrowerID);
CREATE INDEX IX_Loans_BookID ON Loans(BookID);
CREATE INDEX IX_Loans_DateReturned ON Loans([Date Returned]);

-- Composite index to optimize joins between Loans and Borrowers
CREATE INDEX IX_Loans_BorrowerID_DateReturned ON Loans(BorrowerID, [Date Returned]);

-- Composite index for Loans table to speed up overdue book queries
CREATE INDEX IX_Loans_DueDate_Returned ON Loans([Due Date], [Date Returned]);

-- Index on frequently searched BookId
CREATE INDEX IX_Books_BookId ON Books(BookId);

-- Composite index to optimize joins between Books and Loans
CREATE INDEX IX_Books_Genre ON Books(Genre);
CREATE INDEX IX_Books_BookID_Genre ON Books(BookID, Genre);

-- Index on frequently searched BorrowerID in Borrowers table
CREATE INDEX IX_Borrowers_BorrowerID ON Borrowers(BorrowerID);

-- Composite index for Borrowers table to optimize active borrower queries
CREATE INDEX IX_Borrowers_Email ON Borrowers(Email);
CREATE INDEX IX_Borrowers_DOB_MembershipDate ON Borrowers([Date Of Birth], [Membership Date]);

-- Index to optimize audit log queries
CREATE INDEX IX_AuditLog_BookID ON AuditLog(BookID);

