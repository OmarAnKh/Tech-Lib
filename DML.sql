INSERT INTO Books
VALUES
    (1, 'The Great Gatsby', 'F. Scott Fitzgerald', 9780743273565, '1925-04-10', 'Fiction', 'A1', 'Available'),
    (2, 'To Kill a Mockingbird', 'Harper Lee', 9780061120084, '1960-07-11', 'Fiction', 'A2', 'Available'),
    (3, '1984', 'George Orwell', 9780451524935, '1949-06-08', 'Dystopian', 'A3', 'Available'),
    (4, 'Pride and Prejudice', 'Jane Austen', 9780141040349, '1813-01-28', 'Romance', 'A4', 'Available'),
    (5, 'Moby-Dick', 'Herman Melville', 9781503280786, '1851-11-14', 'Adventure', 'A5', 'Available'),
    (6, 'War and Peace', 'Leo Tolstoy', 9781400079988, '1869-01-01', 'Historical', 'A6', 'Borrowed'),
    (7, 'The Catcher in the Rye', 'J.D. Salinger', 9780316769488, '1951-07-16', 'Fiction', 'A7', 'Available'),
    (8, 'The Hobbit', 'J.R.R. Tolkien', 9780547928227, '1937-09-21', 'Fantasy', 'A8', 'Available'),
    (9, 'Crime and Punishment', 'Fyodor Dostoevsky', 9780143107637, '1866-01-01', 'Philosophical', 'A9', 'Available'),
    (10, 'Brave New World', 'Aldous Huxley', 9780060850524, '1932-08-18', 'Dystopian', 'A10', 'Borrowed');

INSERT INTO Borrowers
VALUES
    (1, 'John', 'Doe', 'john.doe@example.com', '1980-05-15', '2020-01-01'),
    (2, 'Jane', 'Smith', 'jane.smith@example.com', '1990-08-20', '2021-05-15'),
    (3, 'Alice', 'Johnson', 'alice.johnson@example.com', '1985-03-10', '2022-02-10'),
    (4, 'Bob', 'Brown', 'bob.brown@example.com', '1978-11-25', '2020-06-18'),
    (5, 'Charlie', 'Davis', 'charlie.davis@example.com', '1995-04-12', '2023-01-20'),
    (6, 'Diana', 'Evans', 'diana.evans@example.com', '1988-09-07', '2021-11-30'),
    (7, 'Eve', 'Williams', 'eve.williams@example.com', '1992-07-04', '2022-05-10'),
    (8, 'Frank', 'Wilson', 'frank.wilson@example.com', '1983-02-18', '2020-03-15'),
    (9, 'Grace', 'Taylor', 'grace.taylor@example.com', '1999-10-11', '2023-07-25'),
    (10, 'Henry', 'White', 'henry.white@example.com', '1987-12-19', '2021-09-05');

INSERT INTO Loans
VALUES
    (1, 1, 1, '2024-01-01', '2024-01-15', NULL),
    (2, 2, 2, '2024-02-01', '2024-02-15', NULL),
    (3, 3, 3, '2024-03-01', '2024-03-15', '2024-03-10'),
    (4, 4, 4, '2024-04-01', '2024-04-15', NULL),
    (5, 5, 5, '2024-05-01', '2024-05-15', '2024-05-14'),
    (6, 6, 6, '2024-06-01', '2024-06-15', NULL),
    (7, 7, 7, '2024-07-01', '2024-07-15', '2024-07-14'),
    (8, 8, 8, '2024-08-01', '2024-08-15', NULL),
    (9, 9, 9, '2024-09-01', '2024-09-15', '2024-09-14'),
    (10, 10, 10, '2024-10-01', '2024-10-15', NULL);
