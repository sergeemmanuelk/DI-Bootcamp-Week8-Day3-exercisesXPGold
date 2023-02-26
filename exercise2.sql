--How many stores there are, and in which city and country they are located.
SELECT st.*, c.city, co.country
FROM store st
INNER JOIN address ad ON ad.address_id = st.address_id
INNER JOIN city c ON c.city_id = ad.city_id
INNER JOIN country co ON co.country_id = c.country_id
GROUP BY (st.store_id, c.city, co.country);

--How many hours of viewing time there are in total in each store – in other words, the sum of the length of every inventory item in each store.
SELECT st.store_id, SUM(film.length) AS total_viewing
FROM film f
INNER JOIN inventory i ON i.film_id = f.film_id
INNER JOIN store st ON st.store_id = i.store_id
GROUP BY(st.store_id);

--Make sure to exclude any inventory items which are not yet returned. (Yes, even in the time of zombies there are people who do not return their DVDs)
SELECT st.store_id, SUM(f.length) AS total_viewing
FROM film f
INNER JOIN inventory i ON i.film_id = f.film_id
INNER JOIN store st ON st.store_id = i.store_id
INNER JOIN rental r ON r.inventory_id = i.inventory_id
WHERE r.return_date IS NULL 
GROUP BY(st.store_id); 

--A list of all customers in the cities where the stores are located.
SELECT st.store_id, c.city, cu.first_name || ' ' || cu.last_name AS "customer"
FROM customer cu
INNER JOIN store st ON st.store_id = cu.store_id
INNER JOIN address ad ON ad.address_id = st.address_id
INNER JOIN city c ON c.city_id = ad.city_id
ORDER BY st.store_id;

--A list of all customers in the countries where the stores are located.

--Some people will be frightened by watching scary movies while zombies walk the streets. Create a ‘safe list’ of all movies which do not include the ‘Horror’ category, or contain the words ‘beast’, ‘monster’, ‘ghost’, ‘dead’, ‘zombie’, or ‘undead’ in their titles or descriptions… Get the sum of their viewing time (length).
--Hint : use the CHECK contraint

--For both the ‘general’ and the ‘safe’ lists above, also calculate the time in hours and days (not just minutes).