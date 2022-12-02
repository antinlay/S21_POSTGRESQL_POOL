SELECT wwd.order_date,
    CONCAT(person.name, '(age:', person.age, ')') AS person_information
FROM person
    NATURAL JOIN (
        SELECT person_order.order_date,
            person_order.person_id AS id
        FROM person_order
    ) AS wwd
ORDER BY order_date,
    person.name