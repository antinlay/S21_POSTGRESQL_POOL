WITH L_RATE AS (
    SELECT id,
        name,
        rate_to_usd
    FROM currency,
        (
            SELECT MAX(updated) AS md
            FROM currency
        ) AS mdate
    WHERE updated = mdate.md
)
SELECT COALESCE(pu.name, 'not defined') AS name,
    COALESCE(pu.lastname, 'not defined') AS lastname,
    pb.type,
    SUM(pb.money) AS volume,
    COALESCE(L_RATE.name, 'not defined') AS currency_name,
    COALESCE(L_RATE.rate_to_usd, 1) AS last_rate_to_usd,
    (SUM(pb.money) * COALESCE(L_RATE.rate_to_usd, 1))::real AS total_volume_in_usd
FROM public.balance pb
    LEFT JOIN public.user pu ON pb.user_id = pu.id
    LEFT JOIN L_RATE ON pb.currency_id = L_RATE.id
GROUP BY pu.name,
    pu.lastname,
    pb.type,
    L_RATE.name,
    L_RATE.rate_to_usd
ORDER BY pu.name DESC,
    pu.lastname ASC,
    pb.type ASC