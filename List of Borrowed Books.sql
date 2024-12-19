SELECT * FROM Books WHERE BookID IN (SELECT BookID FROM loans WHERE loans.BorrowerID = 2);
