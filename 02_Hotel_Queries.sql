-- Q1
SELECT user_id, room_no
FROM bookings b1
WHERE booking_date = (
    SELECT MAX(booking_date)
    FROM bookings b2
    WHERE b1.user_id = b2.user_id
);

-- Q2
SELECT bc.booking_id,
SUM(bc.item_quantity * i.item_rate) AS total_bill
FROM booking_commercials bc
JOIN items i ON bc.item_id = i.item_id
WHERE MONTH(bc.bill_date)=11
AND YEAR(bc.bill_date)=2021
GROUP BY bc.booking_id;

-- Q3
SELECT bill_id,
SUM(item_quantity * item_rate) AS bill_amount
FROM booking_commercials bc
JOIN items i ON bc.item_id = i.item_id
WHERE MONTH(bill_date)=10
AND YEAR(bill_date)=2021
GROUP BY bill_id
HAVING SUM(item_quantity * item_rate) > 1000;

-- Q4
WITH item_sales AS (
SELECT MONTH(bill_date) m,
item_id,
SUM(item_quantity) total_qty,
RANK() OVER(PARTITION BY MONTH(bill_date) ORDER BY SUM(item_quantity) DESC) r1,
RANK() OVER(PARTITION BY MONTH(bill_date) ORDER BY SUM(item_quantity) ASC) r2
FROM booking_commercials
WHERE YEAR(bill_date)=2021
GROUP BY MONTH(bill_date), item_id
)
SELECT *
FROM item_sales
WHERE r1=1 OR r2=1;

-- Q5
WITH monthly_bill AS (
SELECT MONTH(bc.bill_date) m,
b.user_id,
SUM(bc.item_quantity*i.item_rate) total_bill,
DENSE_RANK() OVER(PARTITION BY MONTH(bc.bill_date)
ORDER BY SUM(bc.item_quantity*i.item_rate) DESC) rnk
FROM booking_commercials bc
JOIN items i ON bc.item_id=i.item_id
JOIN bookings b ON bc.booking_id=b.booking_id
WHERE YEAR(bc.bill_date)=2021
GROUP BY MONTH(bc.bill_date), b.user_id
)
SELECT *
FROM monthly_bill
WHERE rnk=2;
