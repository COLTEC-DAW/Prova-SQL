SELECT customer.first_name, customer.last_name, film.title  FROM rental 
JOIN customer ON customer.customer_id = 273 
JOIN inventory ON inventory.inventory_id = rental.inventory_id  
JOIN film ON inventory.film_id = film.film_id 
GROUP BY film.title;