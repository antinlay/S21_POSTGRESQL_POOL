SELECT person.address,
    pizzeria.name,
    COUNT(person_order.person_id) AS count_of_orders
FROM person
    JOIN person_order ON person_id = person.id
    JOIN menu ON menu_id = menu.id
    JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
GROUP BY person.address,
    pizzeria.name
ORDER BY 1,
    2