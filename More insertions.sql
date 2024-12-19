-- Inserting data into the Books table
DECLARE @i INT = 11
WHILE @i <= 1000
BEGIN
  INSERT INTO Books (BookID, Title, Author, ISBN, [Published Date], Genre, [Shelf Location], [Current Status])
  VALUES (@i, 'Title_' + CAST(@i AS VARCHAR(255)), 'Author_' + CAST(@i AS VARCHAR(255)), 1000000000 + @i, 
          DATEADD(DAY, @i, '1900-01-01'), 'Genre_' + CAST(@i AS VARCHAR(255)), 'Location_' + CAST(@i AS VARCHAR(510)), 
          CASE WHEN @i % 2 = 0 THEN 'Available' ELSE 'Borrowed' END)
  SET @i = @i + 1
END

-- Inserting data into the Borrowers table
DECLARE @j INT = 11
WHILE @j <= 1000
BEGIN
  INSERT INTO Borrowers (BorrowerID, [First Name], [Last Name], Email, [Date of birth], [Membership date])
  VALUES (@j, 'FirstName_' + CAST(@j AS VARCHAR(255)), 'LastName_' + CAST(@j AS VARCHAR(255)), 
          'email_' + CAST(@j AS VARCHAR(255)) + '@example.com', DATEADD(YEAR, -25, DATEADD(DAY, @j, '1970-01-01')), 
          DATEADD(YEAR, -5, DATEADD(DAY, @j, '2015-01-01')))
  SET @j = @j + 1
END

-- Inserting data into the Loans table
DECLARE @k INT = 11
WHILE @k <= 1000
BEGIN
  INSERT INTO Loans (LoanID, BorrowerID, BookID, [Date Borrowed], [Due Date], [Date Returned])
  VALUES (@k, (@k % 1000) + 1, (@k % 1000) + 1, DATEADD(DAY, @k, '2024-01-01'), 
          DATEADD(DAY, @k + 14, '2024-01-01'), NULL)
  SET @k = @k + 1
END
