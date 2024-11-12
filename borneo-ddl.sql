-- file: borneo-schema.sql
-- authors: Yug Patel
-- last modified: 11 Nov 2024

CREATE TABLE product(
    ID          VARCHAR(10),
    seller_ID   VARCHAR(10),
    name        VARCHAR(50) NOT NULL,
    price       FLOAT(2) NOT NULL,
    stars       FLOAT(2),
    description VARCHAR(1000),
    PRIMARY KEY (ID),
    FOREIGN KEY (seller_ID) references seller(ID)
        ON DELETE CASCADE,
);

CREATE TABLE sold_by(
    product_ID      VARCHAR(10),
    seller_ID       VARCHAR(10),
    FOREIGN KEY (product_ID) references product(ID)
        ON DELETE CASCADE,
    FOREIGN KEY (seller_ID) references seller(ID)
        ON DELETE CASCADE,
);

CREATE TABLE bought_by(
    product_ID      VARCHAR(10),
    buyer_ID      VARCHAR(10),
    -- FOREIGN KEY (product_ID) references product(ID)
    --     ON DELETE CASCADE,
    -- FOREIGN KEY (buyer_ID) references buyer(ID)
    --     ON DELETE CASCADE,
);

CREATE TABLE seller(
    ID VARCHAR(10),
    name VARCHAR(50) NOT NULL,
    address VARCHAR(50) NOT NULL,
    stars FLOAT(2),
    phone_number VARCHAR(20),
    email VARCHAR(30),
    username VARCHAR(50),
    password VARCHAR(200),
    PRIMARY KEY ID,
);

CREATE TABLE buyer(
    ID varchar(10),
    name VARCHAR(50) NOT NULL,
    address VARCHAR(50) NOT NULL,
    phone_number VARCHAR(20),
    email VARCHAR(30),
    username VARCHAR(50),
    password VARCHAR(200),
    PRIMARY KEY ID,
);

CREATE TABLE products_offered(
    seller_ID       VARCHAR(10),
    product_ID      VARCHAR(10),
    FOREIGN KEY (seller_ID) REFERENCES seller(ID)
        ON DELETE CASCADE,
    FOREIGN KEY (product_ID) REFERENCES product(ID)
        ON DELETE CASCADE,
);

CREATE TABLE product_review(
    product_ID      VARCHAR(10),
    buyer_ID        VARCHAR(10),
    description     VARCHAR(5000),
    date_time       DATETIME(),
    FOREIGN KEY (product_ID) REFERENCES product(ID)
        ON DELETE CASCADE,
    FOREIGN KEY (buyer_ID) REFERENCES buyer(ID)
        ON DELETE SET NULL,
);

CREATE TABLE products_bought(
    product_ID      VARCHAR(10),
    buyer_ID        VARCHAR(10),
    date_time DATETIME(),
    payment_method VARCHAR(30)
    FOREIGN KEY (product_ID) REFERENCES product(ID)
        ON DELETE SET NULL,
    FOREIGN KEY (buyer_ID) REFERENCES buyer(ID)
        ON DELETE SET NULL,
);


-- Examples
-- New producct offered by the seller
insert into product values ('101','201' 'Flaming Hot Cheetos', '4.59', '4.9', 'Flaming Hot Cheetos Party Size Pack');
-- Product purchased
insert into products_bought values ('101', '1', '2024-11-11 13:23:44', 'debit-card')
-- Buyer deletes account
delete from buyer where ID == '105';
-- Seller address update
update seller set address = 'Kent, OH' where seller_ID = '201';
