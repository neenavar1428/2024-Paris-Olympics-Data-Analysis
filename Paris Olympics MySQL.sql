-- Find the average number of medals won by each country
CREATE OR REPLACE VIEW total_medals AS 
SELECT country, SUM(total_medal) AS total_medal 
FROM paris_2024.olympic 
GROUP BY country;

SELECT * FROM total_medals;
SELECT AVG(total_medal) FROM total_medals;

-- Display the countries and the number of gold medals they have won in decreasing order
CREATE OR REPLACE VIEW gold_medals AS 
SELECT country, SUM(gold_medal) AS gold_medal 
FROM paris_2024.olympic 
GROUP BY country;

SELECT * FROM gold_medals
ORDER BY gold_medal DESC;

-- Display the list of people and the medals they have won in descending order, grouped by their country
SELECT country, name, SUM(total_medal) AS total_medal 
FROM paris_2024.olympic 
GROUP BY name 
ORDER BY total_medal DESC;

-- Display the list of people with the medals they have won according to their age
SELECT name, age, SUM(total_medal) AS total_medal 
FROM paris_2024.olympic 
GROUP BY name 
ORDER BY age DESC;

-- Which country has won the most number of medals (cumulative)
SELECT country, SUM(total_medal) AS total_medal 
FROM paris_2024.olympic 
GROUP BY country 
ORDER BY total_medal DESC 
LIMIT 1;