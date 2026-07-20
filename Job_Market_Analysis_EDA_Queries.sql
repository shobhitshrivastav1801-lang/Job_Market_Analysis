SHOW DATABASES;
USE project_job_market_analysis;
SHOW TABLES;
DESCRIBE Market;
SELECT * FROM Market LIMIT 9;                                              -- Inspecting Data Coulmns
SELECT COUNT(ID) AS TOTAL_JOBS FROM Market;                                -- Counting Rows

SELECT ID, COUNT(*)                                                        -- Checking Duplicate Records
FROM Market GROUP BY ID
HAVING COUNT(*) > 1;

SELECT                                                                     -- Find -1 values in numeric columns
SUM(CASE WHEN Rating = -1 THEN 1 ELSE 0 END) AS Rating_Missing,
SUM(CASE WHEN Founded = -1 THEN 1 ELSE 0 END) AS Founded_Missing,
SUM(CASE WHEN Age = -1 THEN 1 ELSE 0 END) AS Age_Missing
FROM Market;

SELECT Industry, COUNT(*)                                                  -- Checking Industry
FROM Market GROUP BY Industry
ORDER BY COUNT(*) DESC;

SELECT Revenue, COUNT(*)                                                   -- Checking Revenue
FROM Market GROUP BY Revenue
ORDER BY COUNT(*) DESC;

SELECT Competitors, COUNT(*)                                               -- Checking Competitors
FROM Market GROUP BY Competitors
ORDER BY COUNT(*) DESC;

SELECT ID, Job_Title, Company_Name, Location
FROM Market LIMIT 10;

SELECT ID, Job_Title, Company_Name, Location
FROM Market ORDER BY Job_Title DESC 
LIMIT 10;

SELECT Job_Title, COUNT(*) AS Total_Jobs
FROM Market GROUP BY Job_Title
ORDER BY Total_Jobs DESC;

SELECT Location, COUNT(*) AS Total_Jobs
FROM Market GROUP BY Location
ORDER BY Total_Jobs DESC;

SELECT Job_Title, COUNT(*) AS Total_Jobs
FROM Market GROUP BY Job_Title
ORDER BY Total_Jobs DESC;

SELECT Company_Name, COUNT(*) AS Openings
FROM Market GROUP BY Company_Name
ORDER BY Openings DESC;

SELECT * FROM Market;
SHOW GRANTS;