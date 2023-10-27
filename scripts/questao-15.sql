SELECT film.film_id, film.title, SUM(payment.amount) FROM film 
JOIN inventory ON inventory.film_id = film.film_id  
JOIN rental ON rental.inventory_id = inventory.inventory_id  
JOIN payment ON payment.rental_id = rental.rental_id 
GROUP BY film.film_id 
ORDER BY SUM(payment.amount) DESC LIMIT 3;
