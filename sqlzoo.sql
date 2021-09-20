--11. Find the country where the name is the capital city.
SELECT name
  FROM world
 WHERE name = capital


--12. Find the country where the capital is the country plus "City".
SELECT name
  FROM world
 WHERE capital = concat (name, ' city')
 
 
 --13. Find the capital and the name where the capital includes the name of the country.
 SELECT capital,name FROM world WHERE capital LIKE concat('%', name, '%');
 
 
 --14. Find the capital and the name where the capital is an extension of name of the country.
SELECT capital, name 
FROM world 
WHERE capital LIKE concat(name, '_%');


--15. Show the name and the extension where the capital is an extension of name of the country.
SELECT name,  REPLACE(capital, name, '') as ext
FROM world 
WHERE capital LIKE concat(name, '_%');
