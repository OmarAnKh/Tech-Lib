SELECT 
    BorrowerID,
    COUNT(BookID) AS BorrowedBooks,
    RANK() OVER (ORDER BY COUNT(BookID) DESC) AS BorrowingRank
FROM loans
GROUP BY BorrowerID
ORDER BY BorrowingRank;