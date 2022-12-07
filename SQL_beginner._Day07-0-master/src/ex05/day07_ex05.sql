SELECT DISTINCT person.name
FROM person
    RIGHT JOIN person_order ON person_id = person.id
ORDER BY 1