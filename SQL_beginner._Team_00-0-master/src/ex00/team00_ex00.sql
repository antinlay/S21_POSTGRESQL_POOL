CREATE TABLE city_and_price (
    t1 varchar,
    t2 varchar,
    price integer not null default 0
);
INSERT INTO city_and_price
VALUES ('a', 'b', 10),
    ('b', 'a', 10),
    ('a', 'd', 20),
    ('d', 'a', 20),
    ('a', 'c', 15),
    ('c', 'a', 15),
    ('b', 'c', 35),
    ('c', 'b', 35),
    ('d', 'b', 25),
    ('b', 'd', 25),
    ('d', 'c', 30),
    ('c', 'd', 30);
WITH RECURSIVE a_traces AS (
    SELECT t1 AS tour,
        t1 AS node1,
        t2 AS node2,
        price,
        price AS summ
    FROM city_and_price
    WHERE t1 = 'a'
    UNION ALL
    SELECT parrent.tour || ',' || child.t1 AS trace,
        child.t1,
        child.t2,
        child.price,
        parrent.summ + child.price AS summ
    FROM city_and_price AS child
        INNER JOIN a_traces AS parrent ON child.t1 = parrent.node2
    WHERE tour NOT LIKE '%' || child.t1 || '%'
),
CTE_SUMM (summ) AS (
    SELECT min(summ)
    FROM a_traces
    WHERE length(tour) = 7
        AND node2 = 'a'
)
SELECT summ AS total_cost,
    ('{' || tour || ',' || node2 || '}') AS tour
FROM a_traces
WHERE length(tour) = 7
    AND node2 = 'a'
    AND summ = (
        SELECT summ
        FROM CTE_SUMM
    )
ORDER BY summ,
    tour;
-- DROP TABLE cities, graph