CREATE MATERIALIZED VIEW mv_dmitriy_visits_and_eats AS
SELECT DISTINCT pizzeria.name
FROM person_visits,
    menu,
    pizzeria,
    (
        SELECT id
        FROM person
        WHERE name = 'Dmitriy'
    ) AS id_dmitriy
WHERE id_dmitriy.id = person_id
    AND visit_date = '2022-01-08'
    AND person_visits.pizzeria_id = pizzeria.id
    AND menu.price <= 800