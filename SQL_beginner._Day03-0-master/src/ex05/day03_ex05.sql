WITH PV AS (
    SELECT pizzeria.name AS pizzeria_name
    FROM pizzeria
        JOIN person_visits ON person_visits.pizzeria_id = pizzeria.id
        JOIN person_order ON person_order.person_id = person_visits.person_id
        JOIN person ON person.name = 'Andrey'
        AND person.id = person_order.person_id
    ORDER BY pizzeria_name
),
PO AS (
    SELECT pizzeria.name AS pizzeria_name
    FROM pizzeria
        JOIN person_visits ON person_visits.pizzeria_id = pizzeria.id
        JOIN person_order ON person_order.person_id = person_visits.person_id
        JOIN person ON person.name = 'Andrey'
        AND person.id = person_visits.person_id
    ORDER BY pizzeria_name
)
SELECT pizzeria_name -- FROM PV
    -- INTERSECT
    -- SELECT pizzeria_name
FROM PO
ORDER BY pizzeria_name