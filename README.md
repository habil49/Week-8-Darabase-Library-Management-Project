Library Management System

Project Overview

This Library Management System is designed to manage a library's book inventory, member records, and loan transactions. The system uses MySQL as the database backend and consists of tables for storing information about books, authors, publishers, categories, members, and loans.

Database Schema

The database schema includes the following tables:

Authors: Stores information about book authors (ID, first name, last name).

Publishers: Stores information about book publishers (ID, name).

Categories: Stores book categories (ID, name).

Books: Stores details about books (ID, title, ISBN, publication year, publisher, category).

BookAuthors: Establishes a many-to-many relationship between books and authors.

Members: Stores information about library members (ID, first name, last name, membership date, email).

Loans: Tracks book loans, including loan date, due date, and return date.

Relationships

A book can have one or more authors (many-to-many).

A book is published by one publisher and belongs to one category.

A member can borrow multiple books (one-to-many).

A book can be borrowed multiple times by different members (one-to-many).

ERD Diagram

An Entity-Relationship Diagram (ERD) is used to visually represent the relationships among the entities. It shows how tables like Authors, Books, Publishers, Categories, Members, and Loans are interconnected.


Sample Data

The database comes pre-populated with some sample authors, books, publishers, categories, members, and loans to demonstrate functionality.

Contributing

Feel free to fork the repository and submit pull requests for any improvements or bug fixes.
