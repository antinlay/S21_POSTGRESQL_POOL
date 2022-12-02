SELECT pizzeria.name
FROM pizzeria
WHERE id IN (
        SELECT DISTINCT pizzeria.id
        FROM pizzeria
        EXCEPT
        SELECT DISTINCT person_visits.pizzeria_id
        FROM person_visits
    )
SELECT pizzeria.name
FROM pizzeria
WHERE NOT EXISTS(
        SELECT person_visits.pizzeria_id
        FROM person_visits
        WHERE person_visits.pizzeria_id = pizzeria.id
    )