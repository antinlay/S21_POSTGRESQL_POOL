SELECT v_persons_female.name
FROM v_persons_female
UNION ALL
SELECT v_persons_male.name
FROM v_persons_male
ORDER BY 1