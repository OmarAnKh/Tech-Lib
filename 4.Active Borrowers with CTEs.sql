--Active Borrowers with CTEs: Identify borrowers who've borrowed 2 or more books but haven't returned any using CTEs.

USE [Tech Lib];
WITH ActiveBorrowers AS (
    SELECT [First Name], [Last Name], Email 
    FROM Borrowers 
    INNER JOIN Loans ON Loans.BorrowerID = Borrowers.BorrowerID 
    WHERE Loans.[Date Returned] IS NULL
)

SELECT COUNT(*) AS [number of borrows], Email 
FROM ActiveBorrowers 
GROUP BY Email 
HAVING COUNT(*) >= 2;

select * from loans where [Date Returned] IS NULL;

insert into Loans (BookID, BorrowerID, [Date Borrowed], [Due Date]) values (960, 128, '4/8/2024', '12/26/2024');