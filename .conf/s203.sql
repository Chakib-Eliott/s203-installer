CREATE DATABASE s203;

USE s203;

CREATE TABLE comment
(
    id INT PRIMARY KEY AUTO_INCREMENT,
    pseudo VARCHAR(30),
    comment TEXT,
    date DATE DEFAULT now()
);