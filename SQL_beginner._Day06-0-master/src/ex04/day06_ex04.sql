ALTER TABLE person_discounts
ADD CONSTRAINT ch_nn_person_id CHECK (NOT (person_id IS NULL));
ALTER TABLE person_discounts
ADD CONSTRAINT ch_nn_pizzeria_id CHECK (NOT (pizzeria_id IS NULL));
ALTER TABLE person_discounts
ADD CONSTRAINT ch_nn_discount CHECK (NOT (discount IS NULL));
ALTER TABLE person_discounts
ALTER COLUMN discount
SET DEFAULT 0;
ALTER TABLE person_discounts
ADD CONSTRAINT ch_range_discount CHECK (
        discount BETWEEN 0 AND 100
    );
-- INSERT INTO person_discounts (id, person_id, pizzeria_id, discount)
-- VALUES (22, NULL, NULL, NULL)