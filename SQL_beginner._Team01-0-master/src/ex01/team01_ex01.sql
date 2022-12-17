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
SELECT COALESCE(pu.name, 'not defined'),
    COALESCE(pu.lastname, 'not defined'),
    pc.name,
    pc.rate_to_usd * pb.money AS currency_in_usd
FROM public.balance pb
    JOIN public.currency pc ON pb.currency_id = pc.id
    JOIN public.user pu ON pu.id = pb.user_id
WHERE fnc_nearest_rate(
        pc.id,
        pb.updated,
        fnc_aft_date(pb.updated),
        fnc_bef_date(pb.updated)
    ) = pc.updated
ORDER BY 1 DESC,
    2,
    3;
CREATE FUNCTION fnc_nearest_rate(
    cur_id bigint,
    balance_date timestamp without time zone,
    aft_date timestamp without time zone,
    bef_date timestamp without time zone
) RETURNS timestamp without time zone LANGUAGE PLPGSQL AS $$
DECLARE t1 numeric;
t2 numeric;
BEGIN t1 = EXTRACT(
    EPOCH
    FROM (bef_date - balance_date)
);
t2 = EXTRACT(
    EPOCH
    FROM (balance_date - aft_date)
);
IF (t1 > t2) THEN RETURN aft_date;
ELSE RETURN bef_date;
END IF;
END;
$$;