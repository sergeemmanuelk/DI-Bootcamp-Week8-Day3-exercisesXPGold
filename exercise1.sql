--Get a list of all rentals which are out (have not been returned). How do we identify these films in the database?
SELECT f.*
FROM film f
INNER JOIN inventory i ON i.film_id = f.film_id
INNER JOIN rental r ON r.inventory_id = i.inventory_id
WHERE r.return_date IS NULL;

--Get a list of all customers who have not returned their rentals. Make sure to group your results.
SELECT c.*, f.title
FROM customer c
INNER JOIN rental r ON r.customer_id = c.customer_id
INNER JOIN inventory i ON i.inventory_id = r.inventory_id
INNER JOIN film f ON f.film_id = i.film_id
WHERE r.return_date IS NULL;

--Get a list of all the Action films with Joe Swank.
--Before you start, could there be a shortcut to getting this information? Maybe a view?
SELECT f.*
FROM film f
INNER JOIN film_category fc ON fc.film_id = f.film_id
INNER JOIN category c ON c.category_id = fc.category_id
INNER JOIN film_actor fa ON fa.film_id = f.film_id
INNER JOIN actor ac ON ac.actor_id = fa.actor_id
WHERE c.name = 'Action' AND ac.first_name || ' ' || actor.last_name = 'Joe Swank';