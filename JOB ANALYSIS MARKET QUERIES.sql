SHOW DATABASES;
USE project_job_market_analysis;

-- STATES WITH MOST NUMBER OF JOBS
SELECT 
    RIGHT(Location, 2) AS State,
    COUNT(*) AS Total_Jobs
FROM Market GROUP BY State
ORDER BY Total_Jobs DESC LIMIT 10;

-- AVERAGE MINIMAL AND MAXIMAL SALARIES IN DIFFERENT STATES
SELECT Location,
       ROUND(AVG(Lower_Salary),2) AS Avg_Min_Salary,
       ROUND(AVG(Upper_Salary),2) AS Avg_Max_Salary
FROM Market GROUP BY Location
ORDER BY Avg_Max_Salary DESC LIMIT 10;

-- AVERAGE SALARY IN DIFFERENT STATES
SELECT Location,
       ROUND(AVG(Avg_SalaryK),2) AS Avg_Salary
FROM Market GROUP BY Location
ORDER BY Avg_Salary DESC LIMIT 10;

-- TOP 5 INDUSTRIES WITH MAXIMUM NUMBER OF DATA SCIENCE RELATED JOB POSTINGS
SELECT Industry, COUNT(*) AS Total_Jobs
FROM Market WHERE Industry <> '-1' GROUP BY Industry
ORDER BY Total_Jobs DESC LIMIT 5;

-- COMPANIES WITH MAXIMUM NUMBER OF JOB OPENINGS

SELECT Company_Name, COUNT(*) AS Total_Openings
FROM Market GROUP BY Company_Name
ORDER BY Total_Openings DESC LIMIT 10;

-- JOB TITLES WITH MOST NUMBER OF JOBS
SELECT Job_Title, COUNT(*) AS Total_Jobs
FROM Market GROUP BY Job_Title
ORDER BY Total_Jobs DESC LIMIT 10;

-- AVERAGE SALARY OF JOB TITLES WITH MOST NUMBER OF JOBS
SELECT Job_Title, COUNT(*) AS Total_Jobs,
       ROUND(AVG(Avg_SalaryK),2) AS Avg_Salary
FROM Market GROUP BY Job_Title
ORDER BY Total_Jobs DESC LIMIT 10;

-- SKILLS REQUIRED BY COMPANIES FOR EACH JOB TITLE
SELECT job_title_sim,
       SUM(Python) AS Python, SUM(sql_) AS SQL_Skill,
       SUM(excel) AS Excel, SUM(tableau) AS Tableau,
       SUM(aws) AS AWS, SUM(spark) AS Spark, SUM(hadoop) AS Hadoop,
       SUM(sas) AS SAS, SUM(scikit) AS Scikit,
       SUM(pytorch) AS PyTorch, SUM(keras) AS Keras,
       SUM(mongo) AS MongoDB
FROM Market GROUP BY job_title_sim
ORDER BY job_title_sim;

-- RELATION BETWEEN AVERAGE SALARY AND EDUCATION
SELECT Degree,
       ROUND(AVG(Avg_SalaryK),2) AS Average_Salary,
       COUNT(*) AS Total_Jobs
FROM Market WHERE Degree <> '-1' GROUP BY Degree
ORDER BY Average_Salary DESC;
/* 
M = Master's degree mentioned
P = PhD degree mentioned 
na = None
*/