-- Day 2: Aggregation (COUNT, SUM, AVG, MIN, MAX, GROUP BY, HAVING)
-- Data: Databricks sample tables samples.tpch.orders and samples.tpch.customer

-- 1. Total number of orders
SELECT COUNT(*) AS total_orders FROM samples.tpch.orders;

-- 2. Orders per order status
SELECT o_orderstatus, COUNT(*) AS orders
FROM samples.tpch.orders
GROUP BY o_orderstatus;

-- 3. Total revenue
SELECT SUM(o_totalprice) AS revenue FROM samples.tpch.orders;

-- 4. Revenue per year
SELECT YEAR(o_orderdate) AS yr, SUM(o_totalprice) AS revenue
FROM samples.tpch.orders
GROUP BY YEAR(o_orderdate)
ORDER BY yr;

-- 5. Average order value
SELECT ROUND(AVG(o_totalprice), 2) AS avg_order FROM samples.tpch.orders;

-- 6. First and last order dates
SELECT MIN(o_orderdate) AS first_order, MAX(o_orderdate) AS last_order
FROM samples.tpch.orders;

-- 7. Orders per priority, most to least
SELECT o_orderpriority, COUNT(*) AS orders
FROM samples.tpch.orders
GROUP BY o_orderpriority
ORDER BY orders DESC;

-- 8. Top 10 customers by number of orders
SELECT o_custkey, COUNT(*) AS orders
FROM samples.tpch.orders
GROUP BY o_custkey
ORDER BY orders DESC
LIMIT 10;

-- 9. Customers with more than 35 orders (HAVING filters groups)
SELECT o_custkey, COUNT(*) AS orders
FROM samples.tpch.orders
GROUP BY o_custkey
HAVING COUNT(*) > 35;

-- 10. Average order value per status
SELECT o_orderstatus, ROUND(AVG(o_totalprice), 2) AS avg_order
FROM samples.tpch.orders
GROUP BY o_orderstatus;

-- 11. Number of different customers who ordered
SELECT COUNT(DISTINCT o_custkey) AS customers_with_orders
FROM samples.tpch.orders;

-- 12. Revenue per year and status
SELECT YEAR(o_orderdate) AS yr, o_orderstatus, SUM(o_totalprice) AS revenue
FROM samples.tpch.orders
GROUP BY YEAR(o_orderdate), o_orderstatus
ORDER BY yr, o_orderstatus;

-- 13. Customers per market segment
SELECT c_mktsegment, COUNT(*) AS customers
FROM samples.tpch.customer
GROUP BY c_mktsegment;

-- 14. Average account balance per segment
SELECT c_mktsegment, ROUND(AVG(c_acctbal), 2) AS avg_bal
FROM samples.tpch.customer
GROUP BY c_mktsegment;

-- 15. Segments with average balance above 4,500
SELECT c_mktsegment, ROUND(AVG(c_acctbal), 2) AS avg_bal
FROM samples.tpch.customer
GROUP BY c_mktsegment
HAVING AVG(c_acctbal) > 4500;

-- Notes to self:
-- WHERE filters rows BEFORE grouping; HAVING filters groups AFTER grouping.
-- Every column in SELECT must be in GROUP BY or inside COUNT/SUM/AVG/MIN/MAX.
