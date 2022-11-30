-- Inner/Outer Joins | Use Cases

SELECT *
FROM EmployeeDemographics


SELECT *
FROM EmployeeSalary


SELECT *
FROM EmployeeDemographics
    INNER JOIN EmployeeSalary
    ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID


SELECT *
FROM EmployeeDemographics
    FULL OUTER JOIN EmployeeSalary
    ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

SELECT *
FROM EmployeeDemographics
    LEFT OUTER JOIN EmployeeSalary
    ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

SELECT *
FROM EmployeeDemographics
    RIGHT OUTER JOIN EmployeeSalary
    ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID


SELECT EmployeeDemographics.EmployeeID, FirstName, LastName, JobTitle, Salary
-- we need spcify what is EmployeeID and from where???
FROM EmployeeDemographics
    INNER JOIN EmployeeSalary
    ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
WHERE FirstName <> 'Shatha'
ORDER BY Salary DESC


SELECT JobTitle, AVG(Salary) AS AVGSALARY
FROM EmployeeDemographics
    INNER JOIN EmployeeSalary
    ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
WHERE JobTitle = 'HR'
GROUP BY JobTitle


-- Unions | Union Operator

    SELECT *
    FROM EmployeeDemographics
UNION
    SELECT *
    FROM WareHouseEmployeeDemographics


    SELECT *
    FROM EmployeeDemographics
UNION ALL
    SELECT *
    FROM WareHouseEmployeeDemographics
ORDER BY EmployeeID


    SELECT EmployeeID, FirstName, Age
    -- That's why dataType from tables is same 
    FROM EmployeeDemographics
UNION ALL
    SELECT EmployeeID, JobTitle, Salary
    FROM EmployeeSalary

-- Case Statement | Use Cases

SELECT EmployeeID, FirstName, Age,
    CASE 
    WHEN Age > 30 THEN 'Old'
    WHEN Age BETWEEN 20 AND 30 THEN 'Young'
    ELSE 'Baby'
END
FROM EmployeeDemographics
WHERE Age IS NOT NULL
ORDER BY Age

SELECT FirstName, LastName, JobTitle, Salary,
    CASE
WHEN JobTitle = 'HR' THEN Salary +(Salary *0.001)
WHEN JobTitle = 'SalesMan' THEN Salary +(Salary *0.02)
WHEN JobTitle = 'Manger' THEN Salary +(Salary *0.04)
ELSE Salary+(Salary*0.03)
END AS SalaryAfterRais

FROM EmployeeDemographics
    JOIN EmployeeSalary
    ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

-- Having Clause
SELECT JobTitle, COUNT(JobTitle)
FROM EmployeeSalary
WHERE JobTitle IS NOT NULL
GROUP BY JobTitle
HAVING COUNT(JobTitle) >1


-- Updating/Deleting Data
SELECT *
FROM EmployeeDemographics

UPDATE EmployeeDemographics
SET  FirstName = 'DevShatha'
WHERE EmployeeID = 1001


DELETE FROM EmployeeDemographics
WHERE EmployeeID IS NULL

-- Aliasing
SELECT Demo.EmployeeID, Demo.FirstName, Sal.JobTitle, Ware.Age
FROM EmployeeDemographics Demo
    LEFT JOIN EmployeeSalary Sal
    ON Demo.EmployeeID = Sal.EmployeeID
    LEFT JOIN WareHouseEmployeeDemographics Ware
    ON Demo.EmployeeID = Ware.EmployeeID

-- Partition By
SELECT FirstName, LastName, Gender, Salary,
    COUNT(Gender) OVER (PARTITION By Gender) AS TotalGender
FROM EmployeeDemographics demo
    JOIN EmployeeSalary sal
    ON demo.EmployeeID = sal.EmployeeID
-- The prevoius code is same next :) 
SELECT Gender, COUNT(Gender)
FROM EmployeeDemographics demo
    JOIN EmployeeSalary sal
    ON demo.EmployeeID = sal.EmployeeID
GROUP BY Gender  