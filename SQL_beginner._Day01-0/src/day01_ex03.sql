SELECT order_date AS action_date,
    person_order.person_id
FROM person_order,
    person_visits
WHERE visit_date = order_date
INTERSECT
SELECT visit_date AS action_date,
    person_visits.person_id
FROM person_visits,
    person_order
WHERE order_date = visit_date
ORDER BY action_date ASC,
    person_id DESC