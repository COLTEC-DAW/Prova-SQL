SELECT actor.first_name, actor.last_name ,  count(film_id) FROM film_actor 
JOIN actor ON actor.actor_id = film_actor.actor_id 
GROUP BY film_actor.actor_id 
HAVING count(film_id) > 10;