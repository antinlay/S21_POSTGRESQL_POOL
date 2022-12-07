WITH ORD AS (
    SELECT pizzeria.name,
        COUNT(pizzeria.id) AS total_count
    FROM pizzeria
        JOIN menu ON menu.pizzeria_id = pizzeria.id
        JOIN person_order ON person_order.menu_id = menu.id
    GROUP BY pizzeria.name
),
VIS AS (
    SELECT pizzeria.name,
        COUNT(pizzeria.id) AS total_count
    FROM pizzeria
        JOIN person_visits ON pizzeria_id = pizzeria.id
    GROUP BY pizzeria.name
),
RES AS (
    SELECT *
    FROM ORD
    UNION ALL
    SELECT *
    FROM VIS
)
SELECT RES.name,
    SUM(total_count) AS total_count
FROM RES
GROUP BY RES.name
ORDER BY 2 DESC,
    1 ASC