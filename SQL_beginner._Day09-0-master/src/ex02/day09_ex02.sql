CREATE FUNCTION fnc_trg_person_delete_audit() RETURNS TRIGGER LANGUAGE PLPGSQL AS $$ BEGIN
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
        'D',
        OLD.id,
        OLD.name,
        OLD.age,
        OLD.gender,
        OLD.address
    );
RETURN NEW;
END;
$$;
CREATE TRIGGER trg_person_delete_audit BEFORE DELETE ON person FOR EACH ROW EXECUTE PROCEDURE fnc_trg_person_delete_audit();
DELETE FROM person_audit
WHERE type_event = 'D';
DROP FUNCTION fnc_trg_person_audit CASCADE