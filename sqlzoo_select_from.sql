----SELECT from WORLD Tutorial
https://sqlzoo.net/wiki/SELECT_from_WORLD_Tutorial



--5. Show the name and population for France, Germany, Italy
SELECT name, population FROM world
WHERE name = 'France' OR name = 'Germany' OR name = 'Italy'

SELECT name, population FROM world
WHERE name IN ('France', 'Germany', 'Italy')



--6. Show the countries which have a name that includes the word 'United'
SELECT name FROM world
WHERE name LIKE '%United%'
