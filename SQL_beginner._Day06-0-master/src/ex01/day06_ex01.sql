WITH per_piz AS (
    SELECT person_order.person_id,
        menu.pizzeria_id
    FROM person_order,
        menu
    WHERE person_order.menu_id = menu.id
),
amount_orders AS (
    SELECT COUNT(*) AS amount,
        per_piz.person_id,
        per_piz.pizzeria_id
    FROM per_piz
    GROUP BY per_piz.person_id,
        per_piz.pizzeria_id
    ORDER BY 1
)
INSERT INTO person_discounts (id, person_id, pizzeria_id, discount) (
        SELECT ROW_NUMBER() OVER () AS id,
            person_id,
            pizzeria_id,
            CASE
                WHEN amount = 1 THEN 10.5
                WHEN amount = 2 THEN 22
                ELSE 30
            END AS discount
        FROM amount_orders
        ORDER BY 1
    )