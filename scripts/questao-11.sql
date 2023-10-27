SELECT customer.store_id , COUNT(customer.store_id) FROM customer 
GROUP BY customer.store_id ;