CREATE VIEW v_price_with_discount AS
SELECT person.name,
    pizza_name,
    price,
    ROUND(price - price * 0.1) AS discount_price
FROM menu
    JOIN person_order ON person_order.menu_id = menu.id
    JOIN person ON person.id = person_order.person_id
ORDER BY person.name,
    pizza_name