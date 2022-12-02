WITH PIA AS (
    SELECT DISTINCT pizza_name,
        pizzeria.name,
        pizzeria_id,
        menu.price
    FROM menu
        JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
)
SELECT menu.pizza_name,
    PIA.name AS pizzeria_name_1,
    pizzeria.name AS pizzeria_name_1,
    menu.price
FROM menu
    JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
    JOIN PIA ON menu.pizza_name = PIA.pizza_name
    AND menu.pizzeria_id < PIA.pizzeria_id
    AND menu.price = PIA.price
ORDER BY 1