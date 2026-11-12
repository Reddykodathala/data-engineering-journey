-- Day 1: SELECT basics on Databricks sample data (samples.tpch)

-- 1. Look at the data first
SELECT * FROM samples.tpch.customer LIMIT 10;

-- 2. Pick only the columns you need
SELECT c_custkey, c_name, c_phone, c_acctbal
FROM samples.tpch.customer
LIMIT 20;

-- 3. Distinct values in a column (5 market segments)
SELECT DISTINCT c_mktsegment FROM samples.tpch.customer;

-- 4. Filter with WHERE
SELECT c_name, c_mktsegment, c_acctbal
FROM samples.tpch.customer
WHERE c_mktsegment = 'BUILDING'
LIMIT 20;

-- 5. Filter on a number and sort (richest customers)
SELECT c_name, c_acctbal
FROM samples.tpch.customer
WHERE c_acctbal > 9000
ORDER BY c_acctbal DESC
LIMIT 10;

-- 6. Find unusual data (negative balances)
SELECT c_name, c_acctbal
FROM samples.tpch.customer
WHERE c_acctbal < 0
ORDER BY c_acctbal
LIMIT 10;

-- 7. IN and LIKE
SELECT c_name, c_phone, c_mktsegment
FROM samples.tpch.customer
WHERE c_mktsegment IN ('AUTOMOBILE', 'MACHINERY')
  AND c_phone LIKE '13-%'
LIMIT 20;

-- 8. The biggest orders
SELECT o_orderkey, o_custkey, o_orderdate, o_totalprice
FROM samples.tpch.orders
ORDER BY o_totalprice DESC
LIMIT 10;

-- 9. Filter on a date range
SELECT o_orderkey, o_orderdate, o_totalprice
FROM samples.tpch.orders
WHERE o_orderdate BETWEEN '1995-01-01' AND '1995-01-31'
ORDER BY o_orderdate
LIMIT 20;

-- 10. Combine AND / OR (brackets around the OR)
SELECT o_orderkey, o_orderstatus, o_orderpriority, o_totalprice
FROM samples.tpch.orders
WHERE o_orderstatus = 'F'
  AND (o_orderpriority = '1-URGENT' OR o_orderpriority = '2-HIGH')
  AND o_totalprice > 400000
LIMIT 20;

-- ===== Try these yourself =====

-- T1. 15 customers with the lowest balance in HOUSEHOLD
SELECT c_name, c_acctbal FROM samples.tpch.customer
WHERE c_mktsegment = 'HOUSEHOLD'
ORDER BY c_acctbal
LIMIT 15;

-- T2. Orders in December 1997 over 300,000, newest first
SELECT o_orderkey, o_orderdate, o_totalprice FROM samples.tpch.orders
WHERE o_orderdate BETWEEN '1997-12-01' AND '1997-12-31'
  AND o_totalprice > 300000
ORDER BY o_orderdate DESC;

-- T3. Customers whose name ends in '7'
SELECT c_name FROM samples.tpch.customer
WHERE c_name LIKE '%7';

-- ===== Break it on purpose (what I learned) =====
-- 1. Misspelled column -> error, Databricks suggests the right name
--    SELECT c_nme FROM samples.tpch.customer;
-- 2. No quotes on text -> BUILDING is treated as a column name
--    SELECT * FROM samples.tpch.customer WHERE c_mktsegment = BUILDING;
-- 3. Wrong case -> no error but ZERO rows (text comparison is case-sensitive)
--    SELECT * FROM samples.tpch.customer WHERE c_mktsegment = 'building';
-- 4. No catalog/schema -> table not found; always use samples.tpch.customer
--    SELECT * FROM customer;
