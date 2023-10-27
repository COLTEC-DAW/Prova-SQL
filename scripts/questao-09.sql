SELECT * FROM category;

SELECT category.name, count(film_category.category_id) FROM category 
JOIN film_category ON film_category.category_id = category.category_id 
GROUP BY film_category.category_id ;