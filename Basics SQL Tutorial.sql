-- SQL Basics Tutorial For Beginners
-- TO Create New Table in SQL:
CREATE TABLE EmployeeDemographics
(
    EmployeeID INT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Age INT,
    Gender VARCHAR(50),
)


-- TO Insert Values Into Table in SQL:

INSERT INTO EmployeeDemographics
VALUES
    (1001, 'Shatha', 'Naami', 23, 'Female')


INSERT INTO EmployeeDemographics
VALUES
    (1002, 'Ali', 'Mohammed', 35, 'Male')


INSERT INTO EmployeeDemographics
VALUES
    (1003, 'Maha', 'Ali', 22, 'Female')



INSERT INTO EmployeeDemographics
VALUES
    (1004, 'Yaser', 'Mohammed', 60, 'Male')


-- Select + From Statements 

SELECT *
FROM EmployeeDemographics

SELECT FirstName, LastName
FROM EmployeeDemographics

SELECT TOP 2
    *
FROM EmployeeDemographics

SELECT DISTINCT(Gender)
FROM EmployeeDemographics

SELECT COUNT(LastName) AS LAstNameCount
FROM EmployeeDemographics


INSERT INTO EmployeeSalary
Values(
        1001, 'SalesMan', 4000)

INSERT INTO EmployeeSalary
Values(
        1002, 'Developer', 5000)

INSERT INTO EmployeeSalary
Values(
        1003, 'Marketing', 5500)

INSERT INTO EmployeeSalary
Values(
        1004, 'Manger', 7000)



SELECT *
FROM EmployeeSalary

SELECT MAX(Salary)
FROM EmployeeSalary

SELECT MIN(Salary)
FROM EmployeeSalary

SELECT AVG(Salary)
FROM EmployeeSalary

-- If I change sql to master then I want to select some data
SELECT *
FROM SQLTutorial.dbo.EmployeeDemographics

--  Where Statement | 3/4
SELECT *
FROM EmployeeDemographics
WHERE FirstName = 'Shatha'

SELECT *
FROM EmployeeDemographics
-- WHERE FirstName != 'Shatha'
WHERE FirstName <> 'Shatha'

SELECT *
FROM EmployeeDemographics
WHERE Age > 30 AND Gender = 'Female'


SELECT *
FROM EmployeeDemographics
-- WHERE FirstName LIKE 'S%' -- Start with s
-- WHERE FirstName LIKE '%h%' -- containe  h
WHERE FirstName LIKE '%a%i%'
-- containe  s

SELECT *
FROM EmployeeDemographics
WHERE FirstName IS NOT NULL


SELECT *
FROM EmployeeDemographics
WHERE FirstName IN('Ali', 'maha')

-- Group By + Order By Statements | 4/4

SELECT Gender, COUNT(Gender) AS GenderCount
FROM EmployeeDemographics
GROUP BY Gender


SELECT Gender, Age, COUNT(Gender) AS GenderCount
FROM EmployeeDemographics
GROUP BY Gender, Age

SELECT Gender, COUNT(Gender) AS GenderCount
FROM EmployeeDemographics
WHERE Age >= 23
GROUP BY Gender

SELECT Gender, COUNT(Gender) AS GenderCount
FROM EmployeeDemographics
WHERE Age >= 23
GROUP BY Gender
-- ORDER BY GenderCount ASC 
ORDER BY GenderCount DESC  