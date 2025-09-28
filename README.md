HR Employee Database Analysis:
This project demonstrates SQL-based Exploratory Data Analysis (EDA) on an HR dataset using MySQL Workbench. The goal is to analyze employee records and provide insights into workforce distribution, marital status, and employment status.

📌 Project Overview :

Count total employees.

Differentiate current vs. old (terminated) employees.

Analyze department-wise distribution.

Group employees by marital status.

🛠️ Tech Stack :

Database: MySQL

Tool: MySQL Workbench

Language: SQL

📊 Dataset Information :

Table: employees

EmpID, Employee_Name, MaritalStatusID, GenderID, DeptID, DateOfTermination

🔍 Key SQL Queries :

-- Total Employees
SELECT COUNT(*) AS Total_Employees FROM employees;

-- Current Employees
SELECT COUNT(*) AS Total_Current_Employees 
FROM employees 
WHERE DateOfTermination = '' OR DateOfTermination IS NULL;

-- Employee count by Department
SELECT Department, COUNT(*) AS Count
FROM employees
GROUP BY Department;

📊 Results Preview :
Department-Wise Employee Count
Department	Count
Production	201
IT/IS	50
Software Engineering	11
Admin Offices	9
Sales	31
Others	1
Current vs. Old Employees
Category	Count
Total Employees	303
Current Employees	302
Old Employees	1

🚀 How to Run (Brief) :

Install MySQL Workbench.

Import/load the HR dataset into MySQL.

Open the SQL script file from this repo.

Run queries step by step to generate insights.

📈 Insights Generated :

Production department has the highest workforce.

Clear view of active vs. terminated employees.

HR analytics simplified through SQL queries.

🔮 Future Scope :

Create interactive dashboards in Power BI / Tableau for better visualization.

Automate queries for real-time employee insights.

Integrate with Python (Pandas, Matplotlib, Seaborn) for advanced analytics.

Build HR KPIs dashboards (attrition rate, gender diversity, employee turnover).

👩‍💻 Author :

 Prachee A. Meshram
📧 prachee.ajm20@gmail.com

🔗 GitHub Profile -  https://github.com/PracheeAshokMeshram

🔗 LinkedIn Profile- www.linkedin.com/in/prachee-a-meshram-975766296
