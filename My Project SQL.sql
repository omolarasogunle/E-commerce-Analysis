USE store;
#1.List top-selling products.
SELECT product_name, SUM(product_price * product_quantity) AS total_sales
FROM products
GROUP BY product_name
ORDER BY total_sales DESC;

#2.Find the total revenue generated.
SELECT SUM(price * quantity) AS total_revenue
FROM transaction;

#3. Identify the most valuable customers.
SELECT customer_id, SUM(price * quantity) AS total_purchase_amount
FROM transaction
GROUP BY customer_id
ORDER BY total_purchase_amount DESC;

#4.Calculate the average order value.
SELECT AVG(price * quantity) AS average_order_value
FROM transaction;

#5.Break down the total revenue by month.
SELECT MONTH(transaction_date) AS month,
SUM(price * quantity) AS total_revenue
FROM transaction
GROUP BY MONTH(transaction_date);

#6. Retrieve the purchase history for a specific customer.
SELECT *
FROM transaction
WHERE customer_id = '26';

#7. Identify the top product categories by total revenue.
SELECT product_category, SUM(product_price * product_quantity) AS total_revenue
FROM products
GROUP BY product_category
ORDER BY total_revenue DESC;

#8.Count the number of repeat customers.
SELECT COUNT(DISTINCT customer_id) AS  repeat_customers
FROM transaction
WHERE customer_id IN (
SELECT customer_id
FROM transaction
GROUP BY customer_id
HAVING COUNT(*) > 1);

#9. Calculate the customer churn rate.
SELECT (COUNT(DISTINCT lost_customers.customer_id)/ 
COUNT(DISTINCT all_customers.customer_id))* 100 AS churn_rate
FROM(
SELECT customer_id
FROM customers
WHERE registration_date BETWEEN '2022/01/01' AND '2022/12/31'
) AS lost_customers
CROSS JOIN (
SELECT customer_id
FROM customers 
WHERE registration_date <= '2022/12/31'
) AS all_customers; 

#10. Find the most popular products in a specific category.
SELECT  product_name, COUNT(*) AS popularity
FROM products
WHERE product_category = 'home decor'
GROUP BY product_name
ORDER BY popularity DESC
LIMIT 5;

#11. Identify products that haven't been sold in the last three months.
SELECT DISTINCT product_id
FROM transaction
WHERE product_id < DATE_SUB(CURDATE(),
INTERVAL 3 MONTH);

#12. Calculate the average transaction value for each customer.
SELECT customer_id, AVG(price * quantity) AS avg_transaction_value
FROM transaction
GROUP BY customer_id;

#13. Determine the percentage of total revenue contributed by the top 10 customeers.
SELECT (SUM(total_price) / (SELECT SUM(total_price) 
FROM orders)) * 100 AS percentage
FROM
(SELECT customer_id, SUM(total_price) AS total_price
FROM orders
GROUP BY customer_id
ORDER BY total_price DESC
LIMIT 10) AS top_customers;

#14. Identify the days with the highest number of sales.
SELECT order_date, COUNT(*) AS sales_count
FROM orders
GROUP BY order_date
ORDER BY sales_count DESC
LIMIT 1;

#15. Calculate the average number of products included in each order.
SELECT COUNT(*) / (SELECT COUNT(DISTINCT order_id) 
FROM orders) AS average_products_per_order
FROM orders;

#New customers:
SELECT * FROM customers
WHERE registration_date >= DATE_SUB(CURDATE(), INTERVAL 30 DAY);

#Repeat customers:
SELECT customer_id, COUNT(*) AS total_orders
FROM orders
GROUP BY customer_id
HAVING total_orders > 1;

#High-value customers:
SELECT customer_id, SUM(total_price) AS total_spent
FROM orders
GROUP BY customer_id
HAVING total_spent > 5000
LIMIT 5;

#Monthly revenue:
SELECT DATE_FORMAT(order_date, '%Y-%m')
AS month, SUM(total_price) AS revenue
FROM orders
GROUP BY month
ORDER BY month;

#Quarterly revenue
SELECT CONCAT(YEAR(order_date), ' Q', 
QUARTER(order_date)) AS quarter, SUM(total_price) AS revenue
FROM orders
GROUP BY quarter
ORDER BY quarter;

#Peak sales periods:
SELECT DATE_FORMAT(order_date, '%Y-%m') AS month, SUM(total_price) AS revenue
FROM orders
GROUP BY month
HAVING revenue >= (SELECT AVG(revenue)
 FROM (SELECT DATE_FORMAT(order_date, '%Y-%m') AS month,
 SUM(total_price) AS revenue 
 FROM orders GROUP BY month) AS subquery)
ORDER BY month;

#Identify best-selling products by category:
SELECT product_category, product_name, 
SUM(product_quantity) AS total_quantity
FROM products
GROUP BY product_category, product_name
ORDER BY total_quantity DESC;

#Find products with declining sales:
SELECT product_id
FROM (
SELECT product_id, YEAR(order_date) AS year,SUM(quantity) AS total_quantity
FROM orders
WHERE YEAR(order_date) = YEAR(CURDATE()) OR YEAR(order_date) = YEAR(CURDATE()) - 1
GROUP BY product_id, year) AS subquery
GROUP BY product_id
HAVING COUNT(*) = 2 AND MIN(total_quantity)
< MAX(total_quantity);

#Determine the average order size:
SELECT AVG(total_price) AS average_order_size
FROM orders
