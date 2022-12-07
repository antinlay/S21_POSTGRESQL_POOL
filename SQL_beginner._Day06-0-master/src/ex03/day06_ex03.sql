CREATE unique INDEX idx_person_discounts_unique ON person_discounts(person_id, pizzeria_id, discount);
SET enable_seqscan = false;
EXPLAIN ANALYZE
SELECT *
FROM person_discounts
WHERE person_id = 2