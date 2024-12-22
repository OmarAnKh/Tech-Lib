# Library Management System: Database Project

## **Introduction**
This project involves designing and implementing a relational database for a library to manage its operations, track books, borrowers, loans, and returns, and analyze borrowing trends. Built with MS SQL, the system supports extensive querying capabilities and ensures data consistency and integrity.

---

## **Features**
- Entity-Relationship Model (ERM) diagram.
- Robust database implementation with meaningful seeded data.
- Complex SQL queries using CTEs, window functions, and joins.
- Stored procedures and database functions for streamlined operations.
- Trigger implementation for audit logging.

---

## **Database Schema**

### **Books Table**
| Column          | Data Type        | Constraints                  |
|-----------------|------------------|------------------------------|
| BookID          | INT              | Primary Key                  |
| Title           | VARCHAR(255)     | NOT NULL                     |
| Author          | VARCHAR(255)     | NOT NULL                     |
| ISBN            | BIGINT           | Unique, NOT NULL             |
| [Published Date]| DATE             |                              |
| Genre           | VARCHAR(255)     |                              |
| [Shelf Location]| VARCHAR(510)     |                              |
| [Current Status]| VARCHAR(10)      | CHECK ('Available', 'Borrowed')|

### **Borrowers Table**
| Column          | Data Type        | Constraints                  |
|-----------------|------------------|------------------------------|
| BorrowerID      | INT              | Primary Key                  |
| [First Name]    | VARCHAR(255)     | NOT NULL                     |
| [Last Name]     | VARCHAR(255)     | NOT NULL                     |
| Email           | VARCHAR(255)     | Unique, NOT NULL             |
| [Date of birth] | DATE             |                              |
| [Membership date]| DATE            | NOT NULL                     |

### **Loans Table**
| Column          | Data Type        | Constraints                  |
|-----------------|------------------|------------------------------|
| LoanID          | INT              | Primary Key                  |
| BookID          | INT              | Foreign Key (Books.BookID)   |
| BorrowerID      | INT              | Foreign Key (Borrowers.BorrowerID) |
| [Date Borrowed] | DATE             | NOT NULL                     |
| [Due Date]      | DATE             | NOT NULL                     |
| DateReturned    | DATE             | NULLABLE                     |

---

## **Key SQL Queries and Procedures**

### **1. List of Borrowed Books**
Retrieve all books borrowed by a specific borrower, including unreturned ones. This query ensures detailed tracking of active loans.

### **2. Active Borrowers with CTEs**
Identify borrowers who have borrowed two or more books and not returned any. This uses Common Table Expressions for efficient analysis.

### **3. Borrowing Frequency**
Rank borrowers based on how frequently they borrow books, leveraging window functions for ranking.

### **4. Popular Genre Analysis**
Determine the most borrowed genre in a given month by aggregating data and filtering based on time.

### **5. Stored Procedure: Add New Borrowers**
Simplify adding a new borrower and prevent duplicate entries with a stored procedure.

### **6. Trigger: Audit Log**
Automatically log status changes of books in an audit table, capturing the nature and timing of changes.

### **7. Database Function: Calculate Overdue Fees**
Calculates overdue fees for a loan based on the number of days overdue. Fees are charged at $1 per day for the first 30 days and $2 per day afterward.

### **8. Database Function: Book Borrowing Frequency**
Determines how often a specific book has been borrowed by counting its loan records.

### **9. Overdue Analysis**
Lists all books overdue by more than 30 days, along with the associated borrowers.

### **10. Author Popularity Analysis**
Ranks authors based on the borrowing frequency of their books, highlighting the most popular authors in the library.

### **11. Genre Preference by Age Group**
Analyzes and identifies the preferred genre among different age groups of borrowers (e.g., 0-10, 11-20, etc.).

### **12. Stored Procedure: Borrowed Books Report**
Generates a report of books borrowed within a specified date range, including borrower details and borrowing dates.

### **13. Trigger: Audit Log for Book Status**
Logs changes to a book's status (e.g., from 'Available' to 'Borrowed') in a separate audit log table, recording the book ID, change type, and timestamp.

### **14. Stored Procedure: Overdue Borrowers Report**
Uses a temporary table to identify all borrowers with overdue books and joins it with the loans table to list overdue books for each borrower.

---

## **Rationale**
1. **Data Consistency**: Constraints like unique keys and foreign keys maintain referential integrity.
2. **Query Optimization**: Complex queries leverage CTEs, window functions, and indexes for performance.
---