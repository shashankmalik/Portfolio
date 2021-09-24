---- Query the two cities in STATION with the shortest and longest CITY names, as well as their respective lengths (i.e.: number of characters in the name). If there is more than one smallest or largest city, choose the one that comes first when ordered alphabetically. The STATION table is described as follows:
select CITY, LENGTH(CITY) FROM STATION ORDER BY LENGTH(CITY) DESC, CITY LIMIT 1;
select CITY, LENGTH(CITY) FROM STATION ORDER BY LENGTH(CITY) ASC, CITY LIMIT 1;


---- Query the list of CITY names from STATION that either do not start with vowels or do not end with vowels. Your result cannot contain duplicates.
select distinct CITY FROM STATION WHERE CITY NOT IN (SELECT CITY FROM STATION WHERE CITY LIKE 'A%' OR CITY LIKE 'E%' OR CITY LIKE 'I%' OR CITY LIKE 'O%' OR CITY LIKE 'U%')
OR 
CITY NOT IN (SELECT CITY FROM STATION WHERE CITY LIKE '%a' OR CITY LIKE '%e' OR CITY LIKE '%i' OR CITY LIKE '%o' OR CITY LIKE '%u')


---- Query the list of CITY names from STATION that do not start with vowels and do not end with vowels. Your result cannot contain duplicates.
select distinct CITY FROM STATION WHERE CITY NOT IN (SELECT CITY FROM STATION WHERE CITY LIKE 'A%' OR CITY LIKE 'E%' OR CITY LIKE 'I%' OR CITY LIKE 'O%' OR CITY LIKE 'U%')
AND
CITY NOT IN (SELECT CITY FROM STATION WHERE CITY LIKE '%a' OR CITY LIKE '%e' OR CITY LIKE '%i' OR CITY LIKE '%o' OR CITY LIKE '%u')


---- Query the Name of any student in STUDENTS who scored higher than 75 Marks. Order your output by the last three characters of each name. If two or more students both have names ending in the same last three characters (i.e.: Bobby, Robby, etc.), secondary sort them by ascending ID.
SELECT NAME FROM STUDENTS
WHERE MARKS > 75
ORDER BY RIGHT(NAME,3), ID ASC


---- Samantha was tasked with calculating the average monthly salaries for all employees in the EMPLOYEES table, but did not realize her keyboard's  key was broken until after completing the calculation. She wants your help finding the difference between her miscalculation (using salaries with any zeros removed), and the actual average salary.
---- Write a query calculating the amount of error (i.e.:  average monthly salaries), and round it up to the next integer.
SELECT CEILING(AVG(SALARY)-AVG(REPLACE(SALARY, '0', ''))) FROM EMPLOYEES


---- We define an employee's total earnings to be their monthly  worked, and the maximum total earnings to be the maximum total earnings for any employee in the Employee table. Write a query to find the maximum total earnings for all employees as well as the total number of employees who have maximum total earnings. Then print these values as  space-separated integers.
SELECT MAX(SALARY*MONTHS), COUNT(NAME) FROM EMPLOYEE
GROUP BY SALARY*MONTHS
ORDER BY SALARY*MONTHS DESC LIMIT 1


---- Consider  and  to be two points on a 2D plane.
-- happens to equal the minimum value in Northern Latitude (LAT_N in STATION).
-- happens to equal the minimum value in Western Longitude (LONG_W in STATION).
-- happens to equal the maximum value in Northern Latitude (LAT_N in STATION).
-- happens to equal the maximum value in Western Longitude (LONG_W in STATION).
-- Query the Manhattan Distance between points  and  and round it to a scale of  decimal places.
SELECT ROUND(ABS(MAX(LAT_N)-MIN(LAT_N))+ABS(MIN(LONG_W)-MAX(LONG_W)),4) FROM STATION


---- Consider  and  to be two points on a 2D plane where  are the respective minimum and maximum values of Northern Latitude (LAT_N) and  are the respective minimum and maximum values of Western Longitude (LONG_W) in STATION.
SELECT ROUND(SQRT((POWER((MAX(LAT_N)-MIN(LAT_N)),2)+POWER((MAX(LONG_W)-MIN(LONG_W)),2))),4) FROM STATION


---- Write a query identifying the type of each record in the TRIANGLES table using its three side lengths. Output one of the following statements for each record in the table:
--Equilateral: It's a triangle with  sides of equal length.
--Isosceles: It's a triangle with  sides of equal length.
--Scalene: It's a triangle with  sides of differing lengths.
--Not A Triangle: The given values of A, B, and C don't form a triangle.
SELECT IF(A+B>C AND B+C>A AND A+C>B, IF(A=B AND B=C,'Equilateral',IF(A=B OR B=C OR A=C, 'Isosceles', 'Scalene')),'Not A Triangle') FROM TRIANGLES


----Pivot the Occupation column in OCCUPATIONS so that each Name is sorted alphabetically and displayed underneath its corresponding Occupation. The output column headers should be Doctor, Professor, Singer, and Actor, respectively.
SELECT [Doctor], [Professor], [Singer], [Actor]
FROM
(
  SELECT ROW_NUMBER() OVER (PARTITION BY Occupation ORDER BY Name) RN, ISNULL(NULL,Name) as Name, Occupation FROM Occupations
) AS T

PIVOT
(
    MAX(Name) FOR Occupation IN ( [Doctor], [Professor], [Singer], [Actor] )
) AS T_PIVOT
ORDER BY RN;


