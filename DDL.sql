CREATE TABLE Books(
	BookID int PRIMARY KEY,
	Title varchar(255) NOT NULL,
	Author varchar(255),
	ISBN int UNIQUE NOT NULL,
	[Published Date] Date,
	Genre varchar(255),
	[Shelf Location] varchar(510),
	[Current Status] varchar(10)
);

CREATE TABLE Borrowers(
	BorrowerID int NOT NULL,
	[First Name] varchar(255),
	[Last Name] varchar(255),
	Email varchar(255),
	[Date of birth] date,
	[Membership date] date,
	PRIMARY KEY(BorrowerID)
);

CREATE TABLE Loans(
	LoanID int PRIMARY KEY,
	BorrowerID int FOREIGN KEY REFERENCES Borrowers(BorrowerID),
	BookID int,
	[Date Borrowed] date,
	[Due Date] date,
	[Date Returned] date DEFAULT NULL,
	FOREIGN KEY (BookID) REFERENCES Books(BookID)
);

ALTER TABLE Books DROP CONSTRAINT UQ__Books__447D36EA336D8058;
ALTER TABLE Books ALTER COLUMN ISBN BIGINT NOT NULL;
ALTER TABLE Books ADD CONSTRAINT UQ_Books_ISBN UNIQUE (ISBN);
