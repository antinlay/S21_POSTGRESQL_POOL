SELECT person.name,
    menu.pizza_name,
    menu.price,
    round ((100 - discount) / 100 * price, 2)::real AS discount_price,
    pizzeria.name AS pizzeria_name
FROM person,
    menu
    JOIN person_discounts ON person_discounts.pizzeria_id = menu.pizzeria_id -- AND person_discounts.pizzeria_id = pizzeria.id
    JOIN pizzeria ON pizzeria.id = person_discounts.pizzeria_id
ORDER BY 1,
    2