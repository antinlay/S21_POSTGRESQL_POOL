CREATE FUNCTION fnc_person_visits_and_eats_on_date(
    pperson varchar default 'Dmitriy',
    pprice numeric default 500,
    pdate date default '2022-01-08'
) RETURNS TABLE (name varchar) LANGUAGE PLPGSQL AS $$ BEGIN RETURN QUERY
SELECT DISTINCT pizzeria.name
FROM person_visits
    JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
    AND visit_date = pdate
    JOIN person ON person_visits.person_id = person.id
    AND person.name = pperson
    JOIN menu ON menu.pizzeria_id = pizzeria.id
    AND menu.price < pprice;
END;
$$;
select *
from fnc_person_visits_and_eats_on_date(pprice := 800);
select *
from fnc_person_visits_and_eats_on_date(
        pperson := 'Anna',
        pprice := 1300,
        pdate := '2022-01-01'
    );
-- DROP FUNCTION fnc_person_visits_and_eats_on_date