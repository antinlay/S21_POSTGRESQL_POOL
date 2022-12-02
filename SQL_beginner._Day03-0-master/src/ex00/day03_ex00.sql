SELECT DISTINCT pizza_name,
    price,
    pizzeria.name AS pizzeria_name,
    visit_date
FROM menu
    JOIN person ON person.name = 'Kate'
    JOIN pizzeria ON pizzeria_id = pizzeria.id
    JOIN person_visits ON person_visits.pizzeria_id = pizzeria.id
    AND person.id = person_visits.person_id
WHERE price >= 800
    AND price <= 1000
ORDER BY pizza_name,
    price,
    pizzeria_name