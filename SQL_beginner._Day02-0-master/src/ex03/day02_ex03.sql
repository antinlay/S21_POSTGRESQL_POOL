WITH cte_date AS (
    SELECT gs::date AS missing_date
    FROM generate_series('2022-01-01', '2022-01-10', interval '1 day') AS gs(day)
)
SELECT missing_date
FROM cte_date
    LEFT JOIN person_visits ON (
        cte_date.missing_date = visit_date
        AND (
            person_id = 1
            OR person_id = 2
        )
    )
WHERE person_id IS NULL
ORDER BY missing_date