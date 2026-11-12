
SELECT c_custkey, c_name, o_custkey, o_orderkey, o_orderdate
FROM samples.tpch.customer
JOIN samples.tpch.orders
ON c_custkey = o_custkey
GROUP BY c_custkey, c_name, o_custkey, o_orderkey, o_orderdate
ORDER BY c_custkey
LIMIT 10;

SELECT c.c_name, n.n_name AS nation
FROM samples.tpch.customer c
JOIN samples.tpch.nation n ON c.c_nationkey = n.n_nationkey



SELECT r_name AS region, COUNT(*) AS Customers FROM samples.tpch.customer c
JOIN samples.tpch.nation n
ON c.c_nationkey = n.n_nationkey
JOIN samples.tpch.region r
ON n.n_regionkey = r.r_regionkey
GROUP BY r.r_name
order by Customers desc;

SELECT c_name as customer,SUM(o_totalprice) as ordervalue FROM samples.tpch.orders
JOIN samples.tpch.customer
ON c_custkey = o_custkey
GROUP BY c_name,o_totalprice
ORDER BY ordervalue DESC
LIMIT 10;


SELECT c.c_custkey, c.c_name, SUM(o.o_totalprice) AS revenue
FROM samples.tpch.customer c
JOIN samples.tpch.orders o ON o.o_custkey = c.c_custkey
GROUP BY c.c_custkey, c.c_name
ORDER BY revenue DESC
LIMIT 10;



SELECT COUNT(*) AS customers_without_orders
FROM samples.tpch.customer c
LEFT JOIN samples.tpch.orders o ON o.o_custkey = c.c_custkey
WHERE o.o_orderkey IS NULL;
