CREATE DATABASE IF NOT EXISTS alx_book_store;
USE alx_book_store;

CREATE TABLE authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    author_name VARCHAR(215) NOT NULL
);

CREATE TABLE books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(130) NOT NULL,
    author_id INT NOT NULL,
    price DECIMAL(10,2) NOT NULL CHECK (price >= 0),
    publication_date DATE,
    FOREIGN KEY (author_id) REFERENCES authors(author_id)
);

CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(215) NOT NULL,
    email VARCHAR(215) UNIQUE,
    address TEXT
);

CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATE DEFAULT CURRENT_DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_details (
    orderdetailid INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    book_id INT NOT NULL,
    quantity INT NOT NULL CHECK (quantity > 0),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (book_id) REFERENCES books(book_id)
);

-- Add indexes for better performance
CREATE INDEX idx_books_author ON books(author_id);
CREATE INDEX idx_orders_customer ON orders(customer_id);
CREATE INDEX idx_order_details_order ON order_details(order_id);
CREATE INDEX idx_order_details_book ON order_details(book_id);

-- Insert sample authors data
INSERT INTO authors (author_name) VALUES
    ('Authors'),
    ('J.K. Rowling'),
    ('George R.R. Martin'),
    ('Stephen King'),
    ('Agatha Christie');