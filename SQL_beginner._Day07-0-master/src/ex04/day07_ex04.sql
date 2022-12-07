WITH COV AS (
    SELECT person.name,
        COUNT(person_visits.id) AS count_of_visits
    FROM person_visits
        JOIN person ON person_id = person.id
    GROUP BY person.name
    ORDER BY count_of_visits DESC,
        person.name ASC
),
BOOL AS (
    SELECT COV.name,
        COV.count_of_visits
    FROM COV
)
SELECT COV.name,
    COV.count_of_visits
FROM COV
    JOIN BOOL ON COV.name = BOOL.name
    AND BOOL.count_of_visits > 3