WITH R AS (
    SELECT person_id
    FROM person_visits
    WHERE visit_date = '2022-01-02'
),
S AS (
    SELECT person_id
    FROM person_visits
    WHERE visit_date = '2022-01-06'
) (
    SELECT person_id
    FROM R
    EXCEPT ALL
    SELECT person_id
    FROM S
)
UNION ALL
(
    SELECT person_id
    FROM S
    EXCEPT ALL
    SELECT person_id
    FROM R
)