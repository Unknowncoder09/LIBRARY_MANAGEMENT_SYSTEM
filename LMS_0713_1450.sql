CREATE DATABASE Library_Management_System;
-- Create Book Table
CREATE TABLE Book (
  book_id INT PRIMARY KEY AUTO_INCREMENT,
  ISBN VARCHAR(13) UNIQUE NOT NULL,
  price INT NOT NULL,
  num_copies INT NOT NULL
);
-- Insert 10 Values to Book Table
INSERT INTO Book (book_id, ISBN, price, num_copies)
VALUES
(1, '9780743273565', 1000, 5),
(2, '9781594480003', 1500, 3),
(3, '9780547928227', 2000, 2),
(4, '9780439554939', 1200, 4),
(5, '9780679760801', 800, 6),
(6, '9780307277672', 1800, 2),
(7, '9780375726977', 1100, 3),
(8, '9780671027032', 1300, 4),
(9, '9780446577086', 1600, 2),
(10, '9780679745587', 900, 5);
-- Create Book Details according to ISBN Code
CREATE TABLE Book_Details (
  ISBN varchar(13) PRIMARY KEY,
  author_name varchar(255) NOT NULL,
  book_title varchar(255) NOT NULL,
  publisher_name varchar(255) NOT NULL
);
-- Insert 10 Values into Book Details Table
INSERT INTO Book_Details (ISBN, author_name, book_title, publisher_name)
VALUES
('9780743273565', 'Khaled Hosseini', 'The Kite Runner', 'Riverhead Books'),
('9781594480003', 'Harper Lee', 'To Kill a Mockingbird', 'Vintage'),
('9780547928227', 'J.K. Rowling', 'Harry Potter and the Philosopher\'s Stone', 'Bloomsbury'),
('9780439554939', 'J.K. Rowling', 'Harry Potter and the Goblet of Fire', 'Scholastic Press'),
('9780679760801', 'George Orwell', '1984', 'Penguin Books'),
('9780307277672', 'Chimamanda Ngozi Adichie', 'Half of a Yellow Sun', 'Alfred A. Knopf'),
('9780375726977', 'Junot Diaz', 'The Brief Wondrous Life of Oscar Wao', 'Riverhead Books'),
('9780671027032', 'Dan Brown', 'The Da Vinci Code', 'Anchor Books'),
('9780446577086', 'Gillian Flynn', 'Gone Girl', 'Crown Publishing Group'),
('9780679745587', 'Toni Morrison', 'Beloved', 'Vintage');
-- Create Table for User
CREATE TABLE User (
    card_no INT PRIMARY KEY AUTO_INCREMENT,
    user_name VARCHAR(50) NOT NULL,
    user_address VARCHAR(100) NOT NULL,
    user_contact VARCHAR(10) NOT NULL
);
-- Insert 10 different users into the table
INSERT INTO User (card_no, user_name, user_address, user_contact)
VALUES 
    (101, 'Amit Kumar', '123 Main Street, Delhi', '9876543210'),
    (102, 'Neha Gupta', '456 Park Avenue, Mumbai', '9876543211'),
    (103, 'Rajesh Singh', '789 5th Street, Bangalore', '9876543212'),
    (104, 'Kavita Sharma', '321 1st Avenue, Kolkata', '9876543213'),
    (105, 'Sanjay Verma', '654 3rd Street, Hyderabad', '9876543214'),
    (106, 'Anjali Patel', '987 Elm Street, Chennai', '9876543215'),
    (107, 'Rahul Shah', '654 2nd Avenue, Pune', '9876543216'),
    (108, 'Pooja Singh', '321 Main Road, Ahmedabad', '9876543217'),
    (109, 'Aakash Kumar', '789 Park Street, Jaipur', '9876543218'),
    (110, 'Sneha Gupta', '1234 Maple Avenue, Lucknow', '9876543219');
-- Create Record table for entering details of all issued books
CREATE TABLE Record (
    record_id INT AUTO_INCREMENT PRIMARY KEY,
    checkout_date DATE NOT NULL,
    due_date DATE NOT NULL,
    book_id INT NOT NULL,
    card_no INT NOT NULL,
    FOREIGN KEY (book_id) REFERENCES Book(book_id),
    FOREIGN KEY (card_no) REFERENCES User(card_no)
);
-- Final_Record table containing only that books which are returned
CREATE TABLE Final_Record (
    record_id INT NOT NULL,
    return_date DATE NOT NULL,
    book_id INT NOT NULL,
    card_no INT NOT NULL,
    PRIMARY KEY (record_id),
    FOREIGN KEY (record_id) REFERENCES Record(record_id),
    FOREIGN KEY (book_id) REFERENCES Book(book_id),
    FOREIGN KEY (card_no) REFERENCES User(card_no)
);
-- Insert 20 Records of issued books
INSERT INTO Record (record_id, checkout_date, due_date, book_id, card_no) 
VALUES 
    (1000, '2023-04-11', '2023-05-11', 1, 103),
    (1001, '2023-04-11', '2023-05-11', 2, 104),
    (1002, '2023-04-11', '2023-05-11', 3, 107),
    (1003, '2023-04-11', '2023-05-11', 4, 109),
    (1004, '2023-04-11', '2023-05-11', 5, 101),
    (1005, '2023-04-11', '2023-05-11', 6, 103),
    (1006, '2023-04-11', '2023-05-11', 7, 102),
    (1007, '2023-04-11', '2023-05-11', 8, 107),
    (1008, '2023-04-11', '2023-05-11', 9, 108),
    (1009, '2023-04-11', '2023-05-11', 10, 110),
    (1010, '2023-04-11', '2023-05-11', 1, 101),
    (1011, '2023-04-11', '2023-05-11', 2, 102),
    (1012, '2023-04-11', '2023-05-11', 3, 103),
    (1013, '2023-04-11', '2023-05-11', 4, 104),
    (1014, '2023-04-11', '2023-05-11', 5, 105),
    (1015, '2023-04-11', '2023-05-11', 6, 106),
    (1016, '2023-04-11', '2023-05-11', 7, 107),
    (1017, '2023-04-11', '2023-05-11', 8, 108),
    (1018, '2023-04-11', '2023-05-11', 9, 110),
    (1019, '2023-04-11', '2023-05-11', 10, 101);
-- Inserted 10 books returned by the user
INSERT INTO Final_Record (record_id, return_date, book_id, card_no)
VALUES
    (1019, '2023-04-29', 10, 101),
    (1001, '2023-04-21', 2, 104),
    (1012, '2023-05-16', 3, 103),
    (1003, '2023-05-11', 4, 109),
    (1015, '2023-05-25', 6, 106),
    (1014, '2023-04-29', 5, 105),
    (1011, '2023-04-21', 2, 102),
    (1002, '2023-05-16', 3, 107),
    (1013, '2023-05-11', 4, 104),
    (1005, '2023-05-25', 6, 103);
-- Create Tables for registering fine
CREATE TABLE Fine (
	record_id INT NOT NULL,
    fine_id INT NOT NULL AUTO_INCREMENT,
    amount INT NOT NULL DEFAULT 0,
    reason VARCHAR(255),
    card_no INT NOT NULL,
    PRIMARY KEY (fine_id),
    FOREIGN KEY (record_id) REFERENCES Record(record_id),
    FOREIGN KEY (card_no) REFERENCES User(card_no)
);
-- Insert 10 different values into Fine table containing different reasons of fines
INSERT INTO Fine (record_id, fine_id, amount, reason, card_no)
VALUES
	(1000, 500, 101, 'Overdue book', 103),
	(1002, 501, 50, 'Late return', 107),
	(1004, 502, 75, 'Lost book', 101),
	(1005, 503, 25, 'Late return', 103),
	(1006, 504, 100, 'Lost book', 102),
	(1007, 505, 50, 'Damaged book', 107),
	(1008, 506, 75, 'Late return', 108),
	(1012, 507, 25, 'Late return', 103),
	(1013, 508, 100, 'Lost book', 104),
	(1015, 509, 50, 'Late return', 106);
-- To calculate all the fines corresponding to particular card No
SELECT card_no, SUM(amount) AS total_fine
FROM Fine
GROUP BY card_no;
-- To return the names of books which are currently checked_out atleast once
SELECT DISTINCT Book_Details.book_title
FROM Book_Details
natural join Book join record
on Book.book_id = Record.book_id;
-- Adding On Delete Cascade for Book_id in different tables
ALTER TABLE Book_Details ADD CONSTRAINT fk_BookDetails_ISBN FOREIGN KEY (ISBN)
REFERENCES Book(ISBN) ON DELETE CASCADE;

ALTER TABLE Record ADD CONSTRAINT fk_Record_Book FOREIGN KEY (book_id)
REFERENCES Book(book_id) ON DELETE CASCADE;

ALTER TABLE Final_Record ADD CONSTRAINT fk_Final_Record_Book FOREIGN KEY (book_id)
REFERENCES Book(book_id) ON DELETE CASCADE;

ALTER TABLE Fine ADD CONSTRAINT fk_Fine_Record FOREIGN KEY (record_id)
REFERENCES Record(record_id) ON DELETE CASCADE;

ALTER TABLE Final_Record ADD CONSTRAINT fk_FinalRecord_Record FOREIGN KEY (record_id)
REFERENCES Record(record_id) ON DELETE CASCADE;

-- To delete a book with a given title
DELETE Book_Details
FROM Book_Details
JOIN Book ON Book.ISBN = Book_Details.ISBN
WHERE Book_Details.book_title = 'Gone Girl';

SELECT DISTINCT Book_Details.book_title
FROM Book_Details
natural join Book join record
on Book.book_id = Record.book_id;

-- To show book name issued by a specific user
SELECT Book_Details.book_title
FROM Book_Details
JOIN Book ON Book.ISBN = Book_Details.ISBN
JOIN Record ON Book.book_id = Record.book_id
JOIN User ON Record.card_no = User.card_no
WHERE User.user_name = 'Kavita Sharma';






