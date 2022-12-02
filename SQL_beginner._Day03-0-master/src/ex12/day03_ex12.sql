INSERT INTO person_order(id, person_id, menu_id, order_date)
SELECT (
        SELECT max(id) + person.id
        FROM person_order
    ),
    person.id,
    19,
    '2022-02-25'
FROM person