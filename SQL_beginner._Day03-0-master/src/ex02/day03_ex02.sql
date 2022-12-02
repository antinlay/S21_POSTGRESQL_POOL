WITH ANN AS (
    SELECT menu.id
    FROM menu
    EXCEPT
    SELECT person_order.menu_id
    FROM person_order
)
SELECT pizza_name,
    price,
    pizzeria.name AS pizzeria_name
FROM menu
    JOIN ANN ON ANN.id = menu.id
    JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
ORDER BY 1,
    2