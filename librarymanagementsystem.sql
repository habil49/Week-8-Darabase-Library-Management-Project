-- Database: Library Management System

-- Table: Authors
CREATE TABLE Authors (
    AuthorID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL
);

-- Table: Publishers
CREATE TABLE Publishers (
    PublisherID INT PRIMARY KEY AUTO_INCREMENT,
    PublisherName VARCHAR(100) UNIQUE NOT NULL
);

-- Table: Categories
CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY AUTO_INCREMENT,
    CategoryName VARCHAR(50) UNIQUE NOT NULL
);

-- Table: Books
CREATE TABLE Books (
    BookID INT PRIMARY KEY AUTO_INCREMENT,
    Title VARCHAR(255) NOT NULL,
    ISBN VARCHAR(20) UNIQUE NOT NULL,
    PublicationYear INT,
    PublisherID INT,
    CategoryID INT,
    FOREIGN KEY (PublisherID) REFERENCES Publishers(PublisherID),
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);

-- Table: BookAuthors (Many-to-Many relationship between Books and Authors)
CREATE TABLE BookAuthors (
    BookID INT,
    AuthorID INT,
    PRIMARY KEY (BookID, AuthorID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
);

-- Table: Members
CREATE TABLE Members (
    MemberID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    MembershipDate DATE NOT NULL,
    Email VARCHAR(100) UNIQUE
);

-- Table: Loans
CREATE TABLE Loans (
    LoanID INT PRIMARY KEY AUTO_INCREMENT,
    BookID INT NOT NULL,
    MemberID INT NOT NULL,
    LoanDate DATE NOT NULL,
    ReturnDate DATE,
    DueDate DATE NOT NULL,
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID)
);

-- Adding some sample data
INSERT INTO Authors (FirstName, LastName) VALUES
('Jane', 'Austen'),
('George', 'Orwell'),
('J.R.R.', 'Tolkien');

INSERT INTO Publishers (PublisherName) VALUES
('Penguin Classics'),
('Secker & Warburg'),
('Allen & Unwin');

INSERT INTO Categories (CategoryName) VALUES
('Fiction'),
('Science Fiction'),
('Fantasy');

INSERT INTO Books (Title, ISBN, PublicationYear, PublisherID, CategoryID) VALUES
('Pride and Prejudice', '978-0141439518', 1813, 1, 1),
('Nineteen Eighty-Four', '978-0451524935', 1949, 2, 2),
('The Hobbit', '978-0547928227', 1937, 3, 3);

INSERT INTO BookAuthors (BookID, AuthorID) VALUES
(1, 1),
(2, 2),
(3, 3);

INSERT INTO Members (FirstName, LastName, MembershipDate, Email) VALUES
('Alice', 'Smith', '2024-01-15', 'alice.smith@example.com'),
('Bob', 'Johnson', '2024-02-20', 'bob.johnson@example.com');

INSERT INTO Loans (BookID, MemberID, LoanDate, DueDate) VALUES
(1, 1, '2025-05-01', '2025-05-15'),
(3, 2, '2025-05-05', '2025-05-19');
