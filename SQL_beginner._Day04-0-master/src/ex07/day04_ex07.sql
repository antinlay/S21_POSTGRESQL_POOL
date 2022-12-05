INSERT INTO person_visits
VALUES (
        (
            SELECT max(id) + 1
            FROM person_visits
        ),
        (
            SELECT person.id
            FROM person
            WHERE person.name = 'Dmitriy'
        ),
        (
            WITH MV AS (
                SELECT *
                FROM mv_dmitriy_visits_and_eats
            )
            SELECT DISTINCT pizzeria.id
            FROM pizzeria
                JOIN menu ON price < 800
                AND pizzeria.id = pizzeria_id
            EXCEPT
            SELECT pizzeria.id
            FROM pizzeria,
                MV
            WHERE pizzeria.name = MV.name
            LIMIT 1
        ), '2022-01-08'
    );
REFRESH MATERIALIZED VIEW mv_dmitriy_visits_and_eats