-- insert into currency
-- values (100, 'EUR', 0.85, '2022-01-01 13:29');
-- insert into currency
-- values (100, 'EUR', 0.79, '2022-01-08 13:29');
CREATE FUNCTION fnc_bef_date(balance_date timestamp without time zone) RETURNS timestamp without time zone AS $$
SELECT updated
FROM currency
WHERE updated <= balance_date
ORDER BY updated DESC
LIMIT 1;
$$ LANGUAGE SQL;
-- DROP FUNCTION fnc_nearest_rate
-- SELECT fnc_bef_date('2022-01-08 13:29')
CREATE FUNCTION fnc_aft_date(balance_date timestamp without time zone) RETURNS timestamp without time zone AS $$
SELECT updated
FROM currency
WHERE updated >= balance_date
ORDER BY updated ASC
LIMIT 1 $$ LANGUAGE SQL;
-- SELECT fnc_aft_date('2022-01-08 13:29')
SELECT fnc_nearest_rate(
        currency.id,
        '2022-01-08 13:29'::timestamp without time zone,
        fnc_aft_date(balance.updated)::timestamp without time zone,
        fnc_bef_date(balance.updated)::timestamp without time zone
    )
FROM currency,
    balance;
CREATE FUNCTION fnc_nearest_rate(
    cur_id integer,
    balance_date timestamp without time zone,
    aft_date timestamp without time zone,
    bef_date timestamp without time zone
) RETURNS timestamp without time zone LANGUAGE PLPGSQL AS $$
DECLARE t1 timestamp without time zone;
t2 timestamp without time zone;
BEGIN t1 = bef_date - balance_date;
t2 = balance_date - aft_date;
IF (t1 > t2) THEN RETURN aft_date;
ELSE RETURN bef_date;
END IF;
END;
$$;