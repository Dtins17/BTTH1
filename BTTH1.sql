CREATE DATABASE Book_Worm;

USE Book_Worm;

CREATE TABLE authors (
    id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(255) NOT NULL,
    birth_year INT,
    nationality VARCHAR(100)
);

CREATE TABLE books (
    id INT PRIMARY KEY AUTO_INCREMENT,
    book_name VARCHAR(255) NOT NULL,
    category VARCHAR(100),
    author_id INT,
    price DECIMAL(10,2) NOT NULL DEFAULT 0,
    publish_year INT,

    CONSTRAINT fk_books_authors
        FOREIGN KEY (author_id)
        REFERENCES authors(id)
        ON DELETE SET NULL
        ON UPDATE CASCADE,

    CONSTRAINT check_price
        CHECK (price >= 0)
);

CREATE TABLE customers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    phone VARCHAR(20) NOT NULL UNIQUE,
    registration_date DATE DEFAULT (CURRENT_DATE)
);