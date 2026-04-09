CREATE TABLE users (
    user_id VARCHAR(50),
    name VARCHAR(100),
    phone_number VARCHAR(20),
    mail_id VARCHAR(100),
    billing_address VARCHAR(200)
);

INSERT INTO users VALUES
('21wrcxuy-67erfn','John Doe','97XXXXXXXX','john.doe@example.com','ABC City');

CREATE TABLE bookings (
    booking_id VARCHAR(50),
    booking_date DATETIME,
    room_no VARCHAR(50),
    user_id VARCHAR(50)
);

INSERT INTO bookings VALUES
('bk-09f3e-95hj','2021-09-23 07:36:48','rm-bhf9-aerjn','21wrcxuy-67erfn');

CREATE TABLE items (
    item_id VARCHAR(50),
    item_name VARCHAR(100),
    item_rate INT
);

INSERT INTO items VALUES
('itm-a9e8-q8fu','Tawa Paratha',18),
('itm-a07vh-aer8','Mix Veg',89);

CREATE TABLE booking_commercials (
    id VARCHAR(50),
    booking_id VARCHAR(50),
    bill_id VARCHAR(50),
    bill_date DATETIME,
    item_id VARCHAR(50),
    item_quantity FLOAT
);

INSERT INTO booking_commercials VALUES
('q34r','bk-09f3e-95hj','bl-0a87y-q340','2021-09-23 12:03:22','itm-a9e8-q8fu',3),
('q35r','bk-09f3e-95hj','bl-0a87y-q340','2021-09-23 12:03:22','itm-a07vh-aer8',1);
