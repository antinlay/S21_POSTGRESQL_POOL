COMMENT ON TABLE person_discounts IS 'This table describe discount all persons have visits to pizzeria';
COMMENT ON COLUMN person_discounts.id IS 'Identificator';
COMMENT ON COLUMN person_discounts.person_id IS 'id person visiting pizzeria';
COMMENT ON COLUMN person_discounts.pizzeria_id IS 'id pizzeria which visiting persons';
COMMENT ON COLUMN person_discounts.discount IS 'discount for each person visiting pizzeria';
SELECT col_description('person_discounts'::regclass, 2);
SELECT obj_description(oid)
FROM pg_class
WHERE relkind = 'r'