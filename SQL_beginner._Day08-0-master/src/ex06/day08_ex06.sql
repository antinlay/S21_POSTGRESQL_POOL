-- SESSION 1:
-- pizzeriadb=# begin transaction isolation level repeatable read;
-- BEGIN
-- pizzeriadb=*# SELECT SUM(rating) FROM pizzeria
-- ;
--  sum  
-- ------
--  19.9
-- (1 row)
-- pizzeriadb=*# SELECT SUM(rating) FROM pizzeria
-- ;
--  sum  
-- ------
--  19.9
-- (1 row)
-- pizzeriadb=*# commit;
-- COMMIT
-- pizzeriadb=# SELECT SUM(rating) FROM pizzeria
-- ;
--  sum  
-- ------
--  23.9
-- (1 row)
-- SESSION 2:
-- pizzeriadb=# begin transaction isolation level repeatable read;
-- BEGIN
-- pizzeriadb=*# update pizzeria
-- set rating = 5
-- where name = 'Pizza Hut'
-- ;
-- UPDATE 1
-- pizzeriadb=*# commit;
-- COMMIT
-- pizzeriadb=# SELECT SUM(rating) FROM pizzeria
-- ;
--  sum  
-- ------
--  23.9
-- (1 row)