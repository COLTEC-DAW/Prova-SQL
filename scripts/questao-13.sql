SELECT customer.first_name, customer.last_name FROM customer 
JOIN rental ren1 ON ren1.customer_id = customer.customer_id 
JOIN rental ren2 ON DATE(ren1.rental_date) = DATE(ren2.rental_date) 
GROUP BY customer.customer_id ;