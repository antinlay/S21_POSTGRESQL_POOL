CREATE TABLE person_audit (
    created TIMESTAMP WITH TIME ZONE NOT NULL,
    type_event CHAR(1) default 'I' NOT NULL,
    row_id BIGINT NOT NULL,
    name VARCHAR NOT NULL,
    age INTEGER NOT NULL default 10,
    gender VARCHAR default 'female' NOT NULL,
    address VARCHAR
);
ALTER TABLE person_audit
ADD CONSTRAINT ch_type_event CHECK(
        type_event = 'I'
        OR type_event = 'D'
        OR type_event = 'U'
    );
CREATE FUNCTION fnc_trg_person_insert_audit() RETURNS TRIGGER LANGUAGE PLPGSQL AS $$ BEGIN
INSERT INTO person_audit(
        created,
        type_event,
        row_id,
        name,
        age,
        gender,
        address
    )
VALUES (
        current_timestamp,
        'I',
        NEW.id,
        NEW.name,
        NEW.age,
        NEW.gender,
        NEW.address
    );
RETURN NEW;
END;
$$;
CREATE TRIGGER trg_person_insert_audit
AFTER
INSERT ON person FOR EACH ROW EXECUTE PROCEDURE fnc_trg_person_insert_audit();
-- DELETE FROM person
-- WHERE id = 10
INSERT INTO person(id, name, age, gender, address)
VALUES (10, 'Damir', 22, 'male', 'Irkutsk');