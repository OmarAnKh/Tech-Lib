--List of Borrowed Books: Retrieve all books borrowed by a specific borrower, including those currently unreturned.

SELECT Books.Title, Books.Author
FROM Books
INNER JOIN Loans ON Loans.BookID = Books.BookId
INNER JOIN Borrowers ON Loans.BorrowerID = Borrowers.BorrowerID
WHERE Borrowers.BorrowerID = 3;

select * from loans where BorrowerID=3;
select * from Books where BookId=41;