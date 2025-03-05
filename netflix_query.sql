--count total movies list
select count(show_id) from netflix_data
--how many count of tv show and movies


select type,count (type)  from netflix_data
group by type


--2. Find the most common rating for movies and TV shows
select rating, type, count(rating) as counts 
from netflix_data
group by rating,type
order by counts desc

--3. List all movies released in a specific year (e.g., 2020)
select type,release_year,title from netflix_data
where type='Movie' and release_year=2020;
 

--4. Find the top 5 countries with the most content on Netflix
SELECT country, COUNT(*) AS content_count
FROM netflix_data
WHERE country IS NOT NULL
GROUP BY country
ORDER BY content_count DESC
LIMIT 5;

--5. Identify the longest movie or TV show duration
SELECT type ,duration
FROM netflix_data
WHERE type = 'TV Show' 
ORDER BY CAST(SPLIT_PART(duration, ' ', 1) AS INTEGER) DESC
LIMIT 1;

--6. Find content added in the last 5 years
select release_year,type,title,date_added from netflix_data
order by release_year desc
limit 5

--7. Find all the movies/TV shows by director 'Rajiv Chilaka'!
select director,type from netflix_data
where director='Rajiv Chilaka'

--8. List all TV shows with more than 5 seasons
SELECT duration,type,title
FROM netflix_data
WHERE type = 'TV Show' 
AND CAST(SPLIT_PART(duration, ' ', 1) AS INTEGER) > 5

--10. List all movies that are documentaries
select listed_in ,type from netflix_data
where listed_in='Documentaries' and type='Movie'

--11. Find all content without a director
SELECT * 
FROM netflix_data
WHERE director IS NULL OR director = '';

--12. Find how many movies actor 'Salman Khan' appeared in last 10 years!
SELECT  title ,release_year FROM netflix_data
WHERE type = 'Movie' 
AND casts like '%Salman Khan%'
and release_year between 2011 and 2021
group by title,release_year


--13. Find the top 10 actors who have appeared in the highest number of movies produced in India.
SELECT UNNEST(STRING_TO_ARRAY(casts, ', ')) AS actor, COUNT(*) AS movie_count
FROM netflix_data
WHERE type = 'Movie' 
AND country LIKE '%India%'
GROUP BY actor
ORDER BY movie_count DESC
LIMIT 10;

--14.Categorize the content based on the presence of the keywords 'kill' and 'violence' in 
--the description field. Label content containing these keywords as 'Bad' and all other 
--content as 'Good'. Count how many items fall into each category.
select 
case 
when description Ilike '%Kill%' or description Ilike '%Violence%' then 'Bad'
else 'Good' 
end as category ,count(*) total_count
from netflix_data
group by category



































