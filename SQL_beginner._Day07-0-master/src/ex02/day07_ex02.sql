WITH ORD AS (
    SELECT pizzeria.name,
        COUNT(pizzeria.id) AS count,
        'order' AS action_type
    FROM pizzeria
        JOIN menu ON menu.pizzeria_id = pizzeria.id
        JOIN person_order ON person_order.menu_id = menu.id
    GROUP BY pizzeria.name
    LIMIT 3
), VIS AS (
    SELECT pizzeria.name,
        COUNT(pizzeria.id) AS count,
        'visit' AS action_type
    FROM pizzeria
        JOIN person_visits ON pizzeria_id = pizzeria.id
    GROUP BY pizzeria.name
    LIMIT 3
)
SELECT *
FROM ORD
UNION ALL
SELECT *
FROM VIS
ORDER BY action_type ASC,
    count DESC