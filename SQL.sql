CREATE SCHEMA `zadacadb_105_111`;

USE `zadacadb_105_111`;

CREATE TABLE users
(
	id INT PRIMARY KEY AUTO_INCREMENT,
    username NVARCHAR(50) UNIQUE NOT NULL,
    address NVARCHAR(100) NOT NULL,
    password NVARCHAR(100) NOT NULL,
    role SMALLINT NOT NULL
);

INSERT INTO users (username, address, password, role) VALUE ('admin', 'admin bb', 'admin', 1);

SELECT * FROM users;

CREATE TABLE items
(
	id INT PRIMARY KEY AUTO_INCREMENT,
    name NVARCHAR(50) NOT NULL,
    description NVARCHAR(100) NOT NULL,
    price DOUBLE NOT NULL
);

SELECT * FROM items;

CREATE TABLE orders
(
	orderId INT PRIMARY KEY AUTO_INCREMENT,
    items NVARCHAR(50) NOT NULL,
    total_price DOUBLE NOT NULL,
    order_date datetime DEFAULT CURRENT_TIMESTAMP(),
    order_status SMALLINT NOT NULL,
    userId INT NOT NULL
);

SELECT * FROM orders;
