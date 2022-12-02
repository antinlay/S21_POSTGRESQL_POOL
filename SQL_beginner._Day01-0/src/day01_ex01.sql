SELECT name AS object_name
FROM (
        SELECT person.name
        FROM person
        ORDER BY person.name
    ) AS fsd
UNION ALL
SELECT pizza_name AS object_name
FROM (
        SELECT pizza_name
        FROM menu
        ORDER BY menu.pizza_name
    ) AS getr