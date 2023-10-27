SELECT customer.store_id , SUM(payment.amount) FROM customer 
JOIN rental ON customer.customer_id = rental.customer_id 
JOIN payment ON payment.rental_id = rental.rental_id 
GROUP BY customer.store_id;
