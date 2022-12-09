CREATE FUNCTION fnc_persons_female() RETURNS SETOF text AS $$
SELECT name
FROM person
WHERE gender = 'female';
$$ LANGUAGE SQL;
CREATE FUNCTION fnc_persons_male() RETURNS SETOF text AS $$
SELECT name
FROM person
WHERE gender = 'male';
$$ LANGUAGE SQL;
SELECT *
FROM fnc_persons_male();
SELECT *
FROM fnc_persons_female();
-- CREATE FUNCTION one() RETURNS integer AS $$
-- SELECT 1 AS result;
-- $$ LANGUAGE SQL;
-- -- Alternative syntax for string literal:
-- CREATE FUNCTION one() RETURNS integer AS '
--     SELECT 1 AS result;
-- ' LANGUAGE SQL;
-- SELECT one();
-- DROP FUNCTION fnc_persons_female, fnc_persons_male