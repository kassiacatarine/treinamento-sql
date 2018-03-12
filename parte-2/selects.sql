SELECT * FROM logins;

SELECT 
  SUM(CASE datepart(month, login_date) WHEN 1 THEN 1 ELSE 0 END) AS 'January',
  SUM(CASE datepart(month, login_date) WHEN 2 THEN 1 ELSE 0 END) AS 'February',
  SUM(CASE datepart(month, login_date) WHEN 3 THEN 1 ELSE 0 END) AS 'March',
  SUM(CASE datepart(month, login_date) WHEN 4 THEN 1 ELSE 0 END) AS 'April',
  SUM(CASE datepart(month, login_date) WHEN 5 THEN 1 ELSE 0 END) AS 'May',
  SUM(CASE datepart(month, login_date) WHEN 6 THEN 1 ELSE 0 END) AS 'June',
  SUM(CASE datepart(month, login_date) WHEN 7 THEN 1 ELSE 0 END) AS 'July',
  SUM(CASE datepart(month, login_date) WHEN 8 THEN 1 ELSE 0 END) AS 'August',
  SUM(CASE datepart(month, login_date) WHEN 9 THEN 1 ELSE 0 END) AS 'September',
  SUM(CASE datepart(month, login_date) WHEN 10 THEN 1 ELSE 0 END) AS 'October',
  SUM(CASE datepart(month, login_date) WHEN 11 THEN 1 ELSE 0 END) AS 'November',
  SUM(CASE datepart(month, login_date) WHEN 12 THEN 1 ELSE 0 END) AS 'December',
  SUM(CASE datepart(year, login_date) WHEN 2016 THEN 1 ELSE 0 END) AS 'TOTAL'
FROM
    logins
WHERE
   login_date BETWEEN '2016/01/01' AND '2016/12/31';


SELECT ROUND(count(*)/30, 0) Media
FROM 
    logins 
WHERE 
    login_date BETWEEN '2016/10/01' AND '2016/10/30';


SELECT top 10 * 
FROM 
	stored_files
ORDER BY length DESC;


SELECT s.name, COUNT(ci.name) citycount 
FROM states s
     JOIN cities ci
        ON s.id = ci.id_state
GROUP BY s.name HAVING (COUNT(ci.name) < 20) OR (COUNT(ci.name) > 100);