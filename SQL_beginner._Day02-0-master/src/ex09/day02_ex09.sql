WITH ppp AS (
    SELECT person_order.id,
        person_order.person_id
    FROM person_order
        JOIN menu ON menu.pizza_name = 'pepperoni pizza'
),
pch AS (
    SELECT person_order.id,
        person_order.person_id
    FROM person_order
        JOIN menu ON menu.pizza_name = 'cheese pizza'
)
SELECT DISTINCT name
FROM person,
    (
        SELECT ppp.id,
            ppp.person_id
        FROM ppp
        INTERSECT
        SELECT pch.id,
            pch.person_id
        FROM pch
    ) AS alld
WHERE gender = 'female'
    AND person.id = alld.person_id
ORDER BY name