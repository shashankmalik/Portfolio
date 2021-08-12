-- ESSENTIAL DATA = CONTINENT, LOCATION, DATE, POPULATION, TOTAL_CASES, NEW_CASES, TOTAL_DEATHS, NEW_DEATHS--
SELECT CONTINENT, LOCATION, DATE, POPULATION, TOTAL_CASES, NEW_CASES, TOTAL_DEATHS, NEW_DEATHS
FROM [dbo].[Deaths]
WHERE CONTINENT IS NOT NULL
GROUP BY CONTINENT, LOCATION, DATE, POPULATION, TOTAL_CASES, NEW_CASES, TOTAL_DEATHS, NEW_DEATHS

-- COUNTRIES WITH INFECTION RATE IN 2020. SHOWN DESCENDING ORDER--
SELECT LOCATION, MAX(YEAR(DATE)) AS "YEAR", MAX((TOTAL_CASES/POPULATION)*100) AS PERCENTAGE_POPULATION_INFECTED
FROM [dbo].[Deaths]
WHERE CONTINENT IS NOT NULL
AND YEAR(DATE) = 2020
GROUP BY LOCATION
ORDER BY 3 DESC

-- SELECTING THE LOCATION = CANADA --
SELECT LOCATION, POPULATION
FROM [dbo].[Deaths]
WHERE LOCATION = 'CANADA'
GROUP BY LOCATION, POPULATION

-- DATE OF THE FIRST DEATH IN CANADA= 2020-03-09--
SELECT LOCATION, DATE, POPULATION, TOTAL_CASES, NEW_CASES, TOTAL_DEATHS, NEW_DEATHS
FROM [dbo].[Deaths]
WHERE LOCATION = 'CANADA'
AND TOTAL_DEATHS IS NOT NULL
GROUP BY LOCATION, DATE, POPULATION, TOTAL_CASES, NEW_CASES, TOTAL_DEATHS, NEW_DEATHS
ORDER BY 2

-- PERCENTAGE OF TOTAL POPULATION INFECTED --
SELECT LOCATION, DATE, POPULATION, TOTAL_CASES, NEW_CASES, TOTAL_DEATHS, NEW_DEATHS, (TOTAL_CASES/POPULATION)*100 AS PERCENTAGE_POPULATION_INFECTED
FROM [dbo].[Deaths]
WHERE LOCATION = 'CANADA'
GROUP BY LOCATION, DATE, POPULATION, TOTAL_CASES, NEW_CASES, TOTAL_DEATHS, NEW_DEATHS
ORDER BY 8

-- PERCENTAGE OF TOTAL DEATHS OUT OF POPULATION --
SELECT LOCATION, DATE, POPULATION, TOTAL_CASES, NEW_CASES, TOTAL_DEATHS, NEW_DEATHS, (TOTAL_CASES/POPULATION)*100 AS PERCENTAGE_POPULATION_INFECTED, (TOTAL_DEATHS/POPULATION)*100 AS PERCENTAGE_DEATHS_FROM_POPULATION
FROM [dbo].[Deaths]
WHERE LOCATION = 'CANADA'
GROUP BY LOCATION, DATE, POPULATION, TOTAL_CASES, NEW_CASES, TOTAL_DEATHS, NEW_DEATHS
ORDER BY 9

-- PERCENTAGE OF TOTAL DEATHS OUT OF TOTAL CASES --
SELECT LOCATION, DATE, POPULATION, TOTAL_CASES, NEW_CASES, TOTAL_DEATHS, NEW_DEATHS, (TOTAL_CASES/POPULATION)*100 AS PERCENTAGE_POPULATION_INFECTED, (TOTAL_DEATHS/POPULATION)*100 AS PERCENTAGE_DEATHS_FROM_POPULATION, (TOTAL_DEATHS/TOTAL_CASES)*100 AS PERCENTAGE_DEATHS_FROM_TOTALCASES
FROM [dbo].[Deaths]
WHERE LOCATION = 'CANADA'
GROUP BY LOCATION, DATE, POPULATION, TOTAL_CASES, NEW_CASES, TOTAL_DEATHS, NEW_DEATHS
ORDER BY 10

-- WORLDWIDE CASES, DEATHS, DEATH PERCENTAGE --
SELECT SUM(NEW_CASES) AS TOTAL_CASES_WORLDWIDE, SUM(CAST(NEW_DEATHS AS INT)) AS TOTAL_DEATHS_WORLDWIDE, SUM(CAST(NEW_DEATHS AS INT))/SUM(NEW_CASES)*100 AS DEATH_PERCENTAGE
FROM [dbo].[Deaths]
WHERE CONTINENT IS NOT NULL