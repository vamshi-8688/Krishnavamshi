-- Q1
SELECT sales_channel,
SUM(amount) revenue
FROM clinic_sales
WHERE YEAR(datetime)=2021
GROUP BY sales_channel;

-- Q2
SELECT uid,
SUM(amount) total_spent
FROM clinic_sales
WHERE YEAR(datetime)=2021
GROUP BY uid
ORDER BY total_spent DESC
LIMIT 10;

-- Q3
SELECT MONTH(cs.datetime) month,
SUM(cs.amount) revenue,
SUM(e.amount) expense,
SUM(cs.amount)-SUM(e.amount) profit
FROM clinic_sales cs
JOIN expenses e ON cs.cid=e.cid
GROUP BY MONTH(cs.datetime);
