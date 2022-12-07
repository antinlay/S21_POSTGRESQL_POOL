SELECT pizzeria.name,
    COUNT(pizzeria.id) AS count_of_orders,
    ROUND(AVG(menu.price), 2)::real AS average_price,
    MAX(menu.price) AS max_price,
    MIN(menu.price) AS min_price
FROM pizzeria
    JOIN menu ON menu.pizzeria_id = pizzeria.id
    JOIN person_order ON person_order.menu_id = menu.id
GROUP BY pizzeria.name
ORDER BY 1;