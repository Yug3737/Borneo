-- file: borneo-schema.sql
-- authors: Yug Patel
-- last modified: 8 Nov 2024

CREATE TABLE product(
    ID VARCHAR(10),
    name VARCHAR(50) NOT NULL,
    price FLOAT(2) NOT NULL,
    stars FLOAT(2),
    description VARCHAR(1000)
    PRIMARY KEY (ID),
);

CREATE TABLE sold_by(
);

CREATE TABLE bought_by();

CREATE TABLE Seller(
    ID VARCHAR(10),
    name VARCHAR(50) NOT NULL,
    address VARCHAR(50) NOT NULL,
    stars FLOAT(2),
    phone_number VARCHAR(20),
    email VARCHAR(30),
    username VARCHAR(50),
    password VARCHAR(200),
    PRIMARY KEY ID
);

CREATE TABLE buyer(
    ID varchar(10),
    name VARCHAR(50) NOT NULL,
    address VARCHAR(50) NOT NULL,
    phone_number VARCHAR(20),
    email VARCHAR(30),
    username VARCHAR(50),
    password VARCHAR(200),
    PRIMARY KEY ID
);

CREATE TABLE products_offered(
    seller.ID,
    product.ID
);

CREATE TABLE product_review(
    product.ID,
    buyer.ID,
    description VARCHAR(5000),
    date_time DATETIME()
);

CREATE TABLE products_bought(
    product.ID,
    buyer.ID,
    date_time DATETIME(),
    payment_method VARCHAR(30)
);