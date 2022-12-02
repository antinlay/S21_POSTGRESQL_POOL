SELECT COALESCE(person.name, '-') AS person_name,
    gs::date AS visit_date,
    COALESCE(pizzeria.name, '-') AS pizzeria_name
FROM generate_series('2022-01-01', '2022-01-03', interval '1 day') AS gs(day)
    JOIN person_visits ON visit_date = gs.day
    FULL OUTER JOIN person ON person.id = person_id
    FULL OUTER JOIN pizzeria ON pizzeria.id = pizzeria_id
ORDER BY person_name,
    visit_date,
    pizzeria_name