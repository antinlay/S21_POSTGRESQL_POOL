SELECT DISTINCT name
FROM person,
    (
        SELECT menu.id
        FROM menu
        WHERE menu.pizza_name = 'pepperoni pizza'
            OR menu.pizza_name = 'mushroom pizza'
    ) AS id_menu
    JOIN person_order ON menu_id = id_menu.id
WHERE gender = 'male'
    AND address = 'Moscow'
    OR address = 'Samara'
ORDER BY name DESC