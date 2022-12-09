CREATE FUNCTION fnc_fibonacci(pstop integer default 10) RETURNS SETOF integer LANGUAGE SQL AS $$ WITH RECURSIVE t(a, b) AS (
    VALUES(0, 1)
    UNION ALL
    SELECT greatest(a, b),
        a + b as a
    from t
    WHERE b < $1
)
SELECT a
FROM t;
$$;
select *
from fnc_fibonacci(100);
select *
from fnc_fibonacci();
-- DROP FUNCTION fnc_fibonacci