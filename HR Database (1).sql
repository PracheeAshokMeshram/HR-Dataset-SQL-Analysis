-- CREATE DATABASE hrdata;
USE hrdata;
SELECT * FROM employees;
SELECT COUNT(*) AS Total_Employees
FROM employees;
SELECT COUNT(*) AS Total_Old_Employees
FROM employees
WHERE DateofTermination != '';
SELECT COUNT(*) AS Total_Current_Employees
FROM employees
WHERE DateofTermination = '';
SELECT AVG(Salary) AS Avg_Salary
FROM employees;
SELECT AVG(TIMESTAMPDIFF(YEAR, STR_TO_DATE(DOB, '%d-%m-%Y'), CURDATE()))
AS Avg_Age
FROM employees;
SELECT AVG(TIMESTAMPDIFF(YEAR, STR_TO_DATE(DateofHire, '%d-%m-%Y'),
CURDATE())) AS Avg_Years_in_Company
FROM employees;
ALTER TABLE employees
ADD EmployeesCurrentStatus INT;
SET SQL_SAFE_UPDATES=0;
UPDATE employees
SET EmployeesCurrentStatus = CASE
WHEN DateofTermination= ''THEN 1
ELSE 0
END;
SELECT
(CAST(COUNT(CASE WHEN EmployeesCurrentStatus = 0 THEN 1 END)
AS FLOAT) / COUNT(*)) * 100 AS Attrition_Rate
FROM employees;
DESCRIBE employees;
SELECT * FROM employees
LIMIT 5;
SELECT * FROM employees
ORDER BY EmpID DESC
LIMIT 5;
ALTER TABLE employees
MODIFY COLUMN Salary DECIMAL(10, 2);
UPDATE employees
SET DOB = STR_TO_DATE(DOB, '%Y-%m-%d');
UPDATE employees
SET DateofHire = STR_TO_DATE(DateofHire, '%Y-%m-%d');
UPDATE employees
SET LastPerformanceReview_Date = STR_TO_DATE(LastPerformanceReview_Date, '%Y-%m-%d');
ALTER TABLE employees
MODIFY COLUMN DOB DATE,
MODIFY COLUMN DateofHire DATE,
MODIFY COLUMN LastPerformanceReview_Date DATE;
SELECT DOB,DateofHire,DateofTermination,LastPerformanceReview_Date
FROM employees;
DESCRIBE employees; 
UPDATE employees
SET DateofTermination = 'CurrentlyWorking'
WHERE DateofTermination IS NULL OR DateofTermination ='';
SELECT MaritalDesc, COUNT(*) AS Count
FROM employees
GROUP BY MaritalDesc
ORDER BY Count DESC;
SELECT Department, COUNT(*) AS Count
FROM employees
GROUP BY Department;
SELECT Position, COUNT(*) AS Count
FROM employees
GROUP BY Position
ORDER BY Count DESC;
SELECT ManagerName, COUNT(*) AS Count
FROM employees
GROUP BY ManagerName
ORDER BY Count DESC;
SELECT CASE
WHEN Salary < 30000 THEN '< 30K'
WHEN Salary BETWEEN 30000 AND 49999 THEN '30K - 49K'
WHEN Salary BETWEEN 50000 AND 69999 THEN '50K - 69K'
WHEN Salary BETWEEN 70000 AND 89999 THEN '70K - 89K'
WHEN Salary >= 90000 THEN '90K and above'
END AS Salary_Range,
COUNT(*) AS Frequency
FROM employees GROUP BY Salary_Range ORDER BY Salary_Range;
SELECT PerformanceScore, COUNT(*) AS Count
FROM employees
GROUP BY PerformanceScore
ORDER BY PerformanceScore;
SELECT Department,
AVG(Salary) AS AverageSalary
FROM employees
GROUP BY Department
ORDER BY Department;
SELECT TermReason,
COUNT(*) AS Count
FROM employees
WHERE TermReason IS NOT NULL
GROUP BY TermReason
ORDER BY Count DESC;
SELECT State,
COUNT(*) AS Count
FROM employees
GROUP BY State
ORDER BY Count DESC;
SELECT Gender,
COUNT(*) AS Count
FROM employees
GROUP BY Gender
ORDER BY Count DESC;
ALTER TABLE employees
ADD COLUMN Age INT;
UPDATE employees
SET Age = TIMESTAMPDIFF(YEAR, DOB, CURDATE());
SELECT CASE
WHEN Age < 20  THEN '< 20'
WHEN Age BETWEEN 20 AND 29 THEN '20-29'
WHEN Age BETWEEN 30 AND 39 THEN '30-39'
WHEN Age BETWEEN 40 AND 49 THEN '40-49'
WHEN Age BETWEEN 50 AND 59 THEN '50-59'
WHEN Age >= 60 THEN '60 and above'
END AS Age_Range,
COUNT(*) AS Count
FROM employees
GROUP BY Age_Range;
SELECT Department,
SUM(Absences) AS TotalAbsences
FROM employees
GROUP BY Department
ORDER BY TotalAbsences DESC;
SELECT Gender,
SUM(Salary) AS TotalSalary
FROM employees
GROUP BY Gender
ORDER BY TotalSalary DESC;
SELECT MaritalDesc,
Count(*) AS TerminatedCount
FROM employees
WHERE Termd = 1
GROUP BY MaritalDesc
ORDER BY TerminatedCount DESC;
SELECT PerformanceScore,
AVG(Absences) AS AverageAbsences
FROM employees
GROUP BY PerformanceScore
ORDER BY PerformanceScore;
SELECT RecruitmentSource,
COUNT(*) AS EmployeeCount
FROM employees
GROUP BY RecruitmentSource
ORDER BY EmployeeCount DESC;

