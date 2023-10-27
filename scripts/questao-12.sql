SELECT customer.first_name, customer.last_name FROM rental 
RIGHT JOIN customer ON rental.customer_id = customer.customer_id  
WHERE rental.customer_id IS NULL;

-- Todos os clientes alugaram pelo menos um filme --
