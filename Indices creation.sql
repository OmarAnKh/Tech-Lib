use [Tech-Lib]

CREATE INDEX Loans_DateBorrowed ON Loans ([Date Borrowed])

CREATE INDEX Loans_DateReturned ON Loans ([Date Returned])

CREATE INDEX Loans_DueDate ON Loans ([Due Date])

CREATE INDEX Borrowers_Email ON Borrowers (Email);

CREATE INDEX Borrowers_DateOfBirth ON Borrowers ([Date of birth]);

CREATE INDEX Books_CurrentStatus ON Books([Current Status]);

CREATE INDEX Books_Genre ON Books(Genre);

EXEC sp_helpindex 'Loans';
EXEC sp_helpindex 'Borrowers';
EXEC sp_helpindex 'Books';
