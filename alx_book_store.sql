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
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

CREATE TABLE order_details (
    orderdetailid INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    book_id INT NOT NULL,
    quantity INT NOT NULL CHECK (quantity > 0),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (book_id) REFERENCES books(book_id)
);


CREATE INDEX idx_books_author ON books(author_id);
CREATE INDEX idx_orders_customer ON orders(customer_id);
CREATE INDEX idx_order_details_order ON order_details(order_id);
CREATE INDEX idx_order_details_book ON order_details(book_id);


INSERT INTO authors (author_name) VALUES
    ('Authors'),
    ('J.K. Rowling'),
    ('George R.R. Martin'),
    ('Stephen King'),
    ('Agatha Christie');

INSERT INTO books (title, author_id, price, publication_date) VALUES
    ('Books', 1, 19.99, '2023-01-01'),
    ('Harry Potter and the Philosophers Stone', 2, 29.99, '1997-06-26'),
    ('A Game of Thrones', 3, 24.99, '1996-08-01'),
    ('The Shining', 4, 19.99, '1977-01-28'),
    ('Murder on the Orient Express', 5, 14.99, '1934-01-01'),
    ('Harry Potter and the Chamber of Secrets', 2, 29.99, '1998-07-02');

INSERT INTO customers (customer_name, email, address) VALUES
    ('Customers', 'customers@email.com', '123 Main St, City'),
    ('Jane Smith', 'jane.smith@email.com', '456 Oak Ave, Town'),
    ('Bob Wilson', 'bob.wilson@email.com', '789 Pine Rd, Village'),
    ('Alice Brown', 'alice.brown@email.com', '321 Elm St, County'),
    ('Charlie Davis', 'charlie.davis@email.com', '654 Maple Dr, State');

INSERT INTO orders (customer_id, order_date) VALUES
    ('Orders', '2023-01-15'),
    (1, '2023-02-20'),
    (2, '2023-03-25'),
    (3, '2023-04-30'),
    (4, '2023-05-05');

INSERT INTO order_details (order_id, book_id, quantity) VALUES
    (1, 1, 2),
    (1, 2, 1),
    (2, 3, 1),
    (3, 4, 3),
    (4, 5, 1),
    (5, 1, 1);