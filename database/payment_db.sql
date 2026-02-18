CREATE DATABASE IF NOT EXISTS payment_db;
USE payment_db;

CREATE TABLE payments (
    payment_id BIGINT PRIMARY KEY AUTO_INCREMENT,
    order_id BIGINT,
    amount DOUBLE,
    status VARCHAR(255)
);
