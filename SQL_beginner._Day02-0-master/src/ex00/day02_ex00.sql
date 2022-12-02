SELECT DISTINCT pizzeria.name,
    pizzeria.rating
FROM pizzeria
    LEFT JOIN person_visits ON pizzeria_id = pizzeria.id
WHERE person_id IS NULL