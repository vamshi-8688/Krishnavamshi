CREATE TABLE clinics (
    cid VARCHAR(50),
    clinic_name VARCHAR(100),
    city VARCHAR(50),
    state VARCHAR(50),
    country VARCHAR(50)
);

INSERT INTO clinics VALUES
('cnc-0100001','XYZ clinic','Hyderabad','Telangana','India');

CREATE TABLE customer (
    uid VARCHAR(50),
    name VARCHAR(100),
    mobile VARCHAR(20)
);

INSERT INTO customer VALUES
('bk-09f3e-95hj','Jon Doe','97XXXXXXXX');

CREATE TABLE clinic_sales (
    oid VARCHAR(50),
    uid VARCHAR(50),
    cid VARCHAR(50),
    amount INT,
    datetime DATETIME,
    sales_channel VARCHAR(50)
);

INSERT INTO clinic_sales VALUES
('ord-001','bk-09f3e-95hj','cnc-0100001',24999,'2021-09-23 12:03:22','sodat');

CREATE TABLE expenses (
    eid VARCHAR(50),
    cid VARCHAR(50),
    description VARCHAR(100),
    amount INT,
    datetime DATETIME
);

INSERT INTO expenses VALUES
('exp-001','cnc-0100001','first-aid supplies',557,'2021-09-23 07:36:48');
