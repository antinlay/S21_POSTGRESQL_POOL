-- SESSION 1
-- pizzeriadb=# begin;
-- BEGIN
-- pizzeriadb=*# select * from pizzeria where name = 'Pizza Hut'
-- ;
--  id |   name    | rating 
-- ----+-----------+--------
--   1 | Pizza Hut |      5
-- (1 row)
-- pizzeriadb=*# update pizzeria                                
-- set rating = 4
-- where name = 'Pizza Hut';
-- UPDATE 1
-- pizzeriadb=*# commit;
-- COMMIT
-- pizzeriadb=# select * from pizzeria where name = 'Pizza Hut'
-- ;
--  id |   name    | rating 
-- ----+-----------+--------
--   1 | Pizza Hut |    3.6
-- (1 row)
-- SESSION 2
-- pizzeriadb=# begin;
-- BEGIN
-- pizzeriadb=*# select * from pizzeria where name = 'Pizza Hut'
-- ;
--  id |   name    | rating 
-- ----+-----------+--------
--   1 | Pizza Hut |      5
-- (1 row)
-- pizzeriadb=*# update pizzeria                                
-- set rating = 3.6
-- where name = 'Pizza Hut';
-- UPDATE 1
-- pizzeriadb=*# commit;
-- COMMIT
-- pizzeriadb=# select * from pizzeria where name = 'Pizza Hut'
-- ;
--  id |   name    | rating 
-- ----+-----------+--------
--   1 | Pizza Hut |    3.6
-- (1 row)