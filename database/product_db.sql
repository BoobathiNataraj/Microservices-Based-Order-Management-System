CREATE DATABASE IF NOT EXISTS product_db;
USE product_db;

CREATE TABLE products (
    product_id BIGINT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255),
    price DOUBLE NOT NULL,
    stock INT NOT NULL
);
