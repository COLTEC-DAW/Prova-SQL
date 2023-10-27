SELECT film.film_id, film.title FROM inventory 
RIGHT JOIN film ON inventory.film_id = film.film_id 
WHERE inventory.film_id IS NULL;