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

INSERT INTO authors (full_name, nationality) VALUES
('Nguyễn Nhật Ánh', 'Việt Nam'),
('Agatha Christie', 'Anh'),
('Dale Carnegie', 'Mỹ');

INSERT INTO books (book_name, category, price, author_id) VALUES
('Mắt Biếc', 'Văn học', 80000, 1),
('Cho Tôi Xin Một Vé Đi Tuổi Thơ', 'Văn học', 90000, 1),
('Án Mạng Trên Sông Nile', 'Trinh thám', 120000, 2),
('Vụ Án Mạng Bí Ẩn', 'Trinh thám', 110000, 2),
('Đắc Nhân Tâm', 'Kỹ năng', 100000, 3),
('Quẳng Gánh Lo Đi', 'Kỹ năng', 95000, 3),
('Học Cách Giao Tiếp', 'Kỹ năng', 85000, 3),
('Truyện Ngắn Hay', 'Văn học', 70000, 1);

INSERT INTO customers (full_name, email, phone) VALUES
('Nguyễn Văn A', 'a@gmail.com', '0900000001'),
('Trần Thị B', 'b@gmail.com', '0900000002'),
('Lê Văn C', 'c@gmail.com', '0900000003'),
('Phạm Thị D', 'd@gmail.com', '0900000004'),
('Hoàng Văn E', 'e@gmail.com', '0900000005');

-- Cố tình thêm khách hàng có mail trùng
INSERT INTO customers (full_name, email, phone) VALUES
('Nguyễn Văn F', 'a@gmail.com', '0900000006');

-- Kết quả: Lỗi 1062 (Duplicate entry)
-- Nguyên nhân: Email 'a@gmail.com' đã tồn tại trong bảng customers
-- Do cột email được thiết lập ràng buộc UNIQUE
-- => Hệ thống không cho phép dữ liệu trùng lặp
-- => Đảm bảo mỗi khách hàng có email duy nhất

SELECT *
FROM books
WHERE category = 'Trinh thám'
  AND price < 100000;
  
SELECT *
FROM customers
WHERE email LIKE '%@gmail.com';

SELECT *
FROM books
ORDER BY price DESC
LIMIT 3;

SET SQL_SAFE_UPDATES = 0;
UPDATE books
SET price = price * 0.9
WHERE publish_year < 2020 OR publish_year IS NULL;

