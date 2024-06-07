-- 1.	How many rows are in the data_analyst_jobs table?
SELECT COUNT(*) 
FROM data_analyst_jobs;

1793

-- 2.	Write a query to look at just the first 10 rows. What company is associated with the job posting on the 10th row?

SELECT *
FROM data_analyst_jobs 
LIMIT 10;

ExxonMobil

-- 3.	How many postings are in Tennessee? How many are there in either Tennessee or Kentucky?

SELECT count (location)
FROM data_analyst_jobs
 WHERE location = 'TN';

21 postings in TN 

SELECT COUNT (location)
FROM data_analyst_jobs 
 WHERE location = 'TN'
 OR location = 'KY';

27 postings in either TN or KY 

-- 4.	How many postings in Tennessee have a star rating above 4?

SELECT location, COUNT(star_rating)
FROM data_analyst_jobs
	WHERE location = 'TN'
	AND star_rating > 4
	GROUP BY(location);

3 ratings above 4 

-- 5.	How many postings in the dataset have a review count between 500 and 1000?

SELECT COUNT (review_count)
FROM data_analyst_jobs 
	WHERE review_count between 500 AND 1000; 

151 postings 


-- 6.	Show the average star rating for companies in each state. The output should show the state as `state` and the average rating for the state as `avg_rating`. Which state shows the highest average rating?



SELECT location AS state, AVG(star_rating) AS avg_rating
FROM data_analyst_jobs 
	GROUP BY location
	ORDER BY avg_rating DESC;

NE shows the highest average rating
	
-- 7.	Select unique job titles from the data_analyst_jobs table. How many are there?
SELECT count(DISTINCT title)
FROM data_analyst_jobs;

881 unique job titles

-- 8.	How many unique job titles are there for California companies?

SELECT COUNT(DISTINCT title)
FROM data_analyst_jobs
	WHERE location = 'CA';

230 unique job titles are there for California companies

-- 9.	Find the name of each company and its average star rating for all companies that have more than 5000 reviews across all locations. How many companies are there with more that 5000 reviews across all locations?

SELECT company, 
	AVG(star_rating) AS avg_star_rating
FROM data_analyst_jobs 
GROUP BY company
HAVING SUM(review_count) > 5000;
	

-- 10.	Add the code to order the query in #9 from highest to lowest average star rating. Which company with more than 5000 reviews across all locations in the dataset has the highest star rating? What is that rating?

SELECT company, 
	AVG(star_rating) AS avg_star_rating
FROM data_analyst_jobs 
GROUP BY company
HAVING SUM(review_count) > 5000
ORDER BY (avg_star_rating) DESC;

Google 4.30
	
-- 11.	Find all the job titles that contain the word ‘Analyst’. How many different job titles are there? 
SELECT COUNT(title)
FROM data_analyst_jobs 
WHERE title LIKE '%Analyst%'

1636 Job Titles 

-- 12.	How many different job titles do not contain either the word ‘Analyst’ or the word ‘Analytics’? What word do these positions have in common?

SELECT title
FROM data_analyst_jobs
WHERE title NOT ILIKE '%Analyst%'
	AND title NOT ILIKE '%Analytics%';

--BONUS----------------------------------------------

SELECT title, skill, days_since_posting, domain
FROM data_analyst_jobs 
WHERE skill LIKE 'SQL'
AND days_since_posting > (3*7)
ORDER BY domain DESC

"Transport and Freight"
"Real Estate"
"Internet and Software"
"Consumer Goods and Services"

ALL 4 