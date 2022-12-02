SELECT pizza_name,
    pizzeria.name AS pizzeria_name
FROM person_order,
    menu,
    pizzeria,
    (
        SELECT person.id AS pid
        FROM person
        WHERE person.name = 'Anna'
            OR person.name = 'Denis'
    ) AS id_per
WHERE id_per.pid = person_id
    AND menu_id = menu.id
    AND pizzeria_id = pizzeria.id
ORDER BY pizza_name,
    pizzeria_name