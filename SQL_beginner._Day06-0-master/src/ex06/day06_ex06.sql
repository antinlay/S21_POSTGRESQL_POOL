CREATE SEQUENCE seq_person_discounts AS bigint START WITH 1 MINVALUE 1 INCREMENT BY 1;
ALTER SEQUENCE seq_person_discounts OWNED BY person_discounts.id;
ALTER TABLE person_discounts
ALTER COLUMN id
SET DEFAULT nextval('seq_person_discounts');
-- ALTER SEQUENCE serial RESTART WITH 105;
SELECT setval(
        'seq_person_discounts',
        (
            SELECT COUNT(*)
            FROM person_discounts
        )
    );
SELECT nextval('seq_person_discounts');
INSERT INTO person_discounts (person_id, pizzeria_id, discount)
VALUES (1, 2, 3);
-- DELETE FROM person_discounts
-- WHERE id = 18