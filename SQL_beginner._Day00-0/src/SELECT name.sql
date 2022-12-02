SELECT name
FROM person,
    (
        SELECT person_id
        FROM person_order
        WHERE (
                person_order.menu_id = 13
                OR person_order.menu_id = 14
                OR person_order.menu_id = 18
            )
            AND person_order.order_date = '2022-01-07'
    ) AS person_ido
WHERE person.id = person_ido.person_id