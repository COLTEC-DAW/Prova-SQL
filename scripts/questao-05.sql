SELECT customer.first_name, customer.last_name, COUNT(customer.customer_id) FROM rental  
JOIN customer ON rental.customer_id = customer.customer_id 
GROUP BY customer.customer_id 
ORDER BY COUNT(customer.customer_id) 
DESC LIMIT 5;