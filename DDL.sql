CREATE TABLE Books(
	BookID int PRIMARY KEY,
	Title varchar(255) NOT NULL,
	Author varchar(255) NOT NULL,
	ISBN int,
	[Published Date] Date,
	Genre varchar(255),
	[Shelf Location] varchar(510),
	[Current Status] varchar(10) CHECK ([Current Status] IN ('Available', 'Borrowed'))
	CONSTRAINT UQ_Books_ISBN UNIQUE (ISBN) 
);

CREATE TABLE Borrowers(
	BorrowerID int NOT NULL,
	[First Name] varchar(255) NOT NULL,
	[Last Name] varchar(255) NOT NULL,
	Email varchar(255) UNIQUE NOT NULL,
	[Date of birth] date,
	[Membership date] date NOT NULL,
	PRIMARY KEY(BorrowerID)
);

CREATE TABLE Loans(
	LoanID int PRIMARY KEY,
	BorrowerID int FOREIGN KEY REFERENCES Borrowers(BorrowerID),
	BookID int,
	[Date Borrowed] date NOT NULL,
	[Due Date] date NOT NULL,
	[Date Returned] date DEFAULT NULL,
	FOREIGN KEY (BookID) REFERENCES Books(BookID)
);


ALTER TABLE Books DROP CONSTRAINT UQ_Books_ISBN;
ALTER TABLE Books ALTER COLUMN ISBN BIGINT NOT NULL;
ALTER TABLE Books ADD CONSTRAINT UQ_Books_ISBN UNIQUE (ISBN);
