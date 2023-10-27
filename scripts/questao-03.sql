SELECT rental.rental_id, customer.first_name, customer.last_name, rental.rental_date, rental.return_date  
FROM rental 
JOIN customer ON rental.customer_id = customer.customer_id;