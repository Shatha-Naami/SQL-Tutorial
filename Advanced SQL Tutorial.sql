-- CTE (Common Table Expression)

-- WITH
--     CTE_Emplyee
--     AS
--     (
--         SELECT FirstName, LastName, JobTitle, Salary,
--             AVG(Salary) OVER (PARTITION BY Salary) AS AvgSalary,
--             COUNT(Gender) OVER (PARTITION BY Gender) AS CountGender
--         FROM EmployeeDemographics emp
--             JOIN EmployeeSalary sal
--             ON emp.EmployeeID = sal.EmployeeID
--         WHERE Salary >30000
--     )

-- SELECT AvgSalary
-- FROM CTE_Emplyee

-- Temp Tables

-- DROP TABLE IF EXISTS #temp_Employee
-- CREATE TABLE #temp_Employee
-- (
--     EmplyeeID INT,
--     JobTitle VARCHAR(50),
--     Salary INT,
-- )

-- INSERT INTO #temp_Employee
-- VALUES
--     (
--         10001, 'HR', 3000
-- )

-- INSERT INTO #temp_Employee
-- SELECT *
-- FROM EmployeeSalary


-- SELECT *
-- FROM #temp_Employee

-- String Functions + Use Cases
/*

Today's Topic: String Functions - TRIM, LTRIM, RTRIM, Replace, Substring, Upper, Lower

*/

--Drop Table EmployeeErrors;


-- CREATE TABLE EmployeeErrors
-- (
--     EmployeeID varchar(50)
-- ,
--     FirstName varchar(50)
-- ,
--     LastName varchar(50)
-- )

-- Insert into EmployeeErrors
-- Values
--     ('1001  ', 'Jimbo', 'Halbert')
-- ,
--     ('  1002', 'Pamela', 'Beasely')
-- ,
--     ('1005', 'TOby', 'Flenderson - Fired')

-- Select *
-- From EmployeeErrors

-- Using Trim, LTRIM, RTRIM

-- Select EmployeeID, TRIM(employeeID) AS IDTRIM
-- FROM EmployeeErrors

-- Select EmployeeID, RTRIM(employeeID) as IDRTRIM
-- FROM EmployeeErrors

-- Select EmployeeID, LTRIM(employeeID) as IDLTRIM
-- FROM EmployeeErrors





-- Using Replace

-- Select LastName, REPLACE(LastName, '- Fired', '') as LastNameFixed
-- FROM EmployeeErrors


-- Using Substring

-- Select Substring(err.FirstName,1,3), Substring(dem.FirstName,1,3), Substring(err.LastName,1,3), Substring(dem.LastName,1,3)
-- FROM EmployeeErrors err
--     JOIN EmployeeDemographics dem
--     on Substring(err.FirstName,1,3) = Substring(dem.FirstName,1,3)
--         and Substring(err.LastName,1,3) = Substring(dem.LastName,1,3)



-- Using UPPER and lower

-- Select firstname, LOWER(firstname)
-- from EmployeeErrors

-- Select Firstname, UPPER(FirstName)
-- from EmployeeErrors

-- Stored Procedures + Use Cases

-- CREATE PROCEDURE TEST
-- AS
-- SELECT *
-- FROM EmployeeDemographics

-- EXEC TEST

-- Subqueries
/*
Today's Topic: Subqueries (in the Select, From, and Where Statement)
*/

Select EmployeeID, JobTitle, Salary
From EmployeeSalary

-- Subquery in Select

Select EmployeeID, Salary, (Select AVG(Salary)
    From EmployeeSalary) as AllAvgSalary
From EmployeeSalary

-- How to do it with Partition By
Select EmployeeID, Salary, AVG(Salary) over () as AllAvgSalary
From EmployeeSalary

-- Why Group By doesn't work
Select EmployeeID, Salary, AVG(Salary) as AllAvgSalary
From EmployeeSalary
Group By EmployeeID, Salary
order by EmployeeID


-- Subquery in From

Select a.EmployeeID, AllAvgSalary
From
    (Select EmployeeID, Salary, AVG(Salary) over () as AllAvgSalary
    From EmployeeSalary) a
Order by a.EmployeeID


-- Subquery in Where


Select EmployeeID, JobTitle, Salary
From EmployeeSalary
where EmployeeID in (
	Select EmployeeID
From EmployeeDemographics
where Age > 30)