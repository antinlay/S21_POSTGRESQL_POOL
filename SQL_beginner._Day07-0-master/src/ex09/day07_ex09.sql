SELECT person.address,
    round(
        round(MAX(person.age), 4) - (round(MIN(age), 4) / round(MAX(age), 4)),
        2
    )::real AS formula,
    round(AVG(age), 2)::real AS average,
    round(
        round(MAX(person.age), 4) - (round(MIN(age), 4) / round(MAX(age), 4)),
        2
    ) > round(AVG(age), 2) AS comparison
FROM person
GROUP BY person.address
ORDER BY 1