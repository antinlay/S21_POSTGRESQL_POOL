-- CREATE TABLE IF NOT EXISTS graph (point1 VARCHAR, point2 VARCHAR, cost INT);
-- INSERT INTO graph(point1, point2, cost)
-- VALUES ('a', 'b', 10),
--     ('a', 'c', 15),
--     ('a', 'd', 20),
--     ('b', 'a', 10),
--     ('b', 'c', 35),
--     ('b', 'd', 25),
--     ('c', 'a', 15),
--     ('c', 'b', 35),
--     ('c', 'd', 30),
--     ('d', 'a', 20),
--     ('d', 'b', 25),
--     ('d', 'c', 30);
WITH city1 AS (
    SELECT DISTINCT point1
    FROM graph
)
SELECT (city1 + city2 + city3) AS total_cost,
    CONCAT(p1, p2, p3, p4, p5) AS tour