SELECT f.title AS film_title, f.length AS film_duration, c.name AS category_name
FROM film f
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id;

SELECT f.title AS film_title, r.rental_period AS rental_date
FROM film f
JOIN rental r ON f.film_id = r.inventory_id
JOIN customer c ON r.customer_id = c.customer_id
WHERE c.customer_id = 1;

SELECT f.title AS film_title, COUNT(r.rental_id) AS rental_count
FROM film f
JOIN rental r ON f.film_id = r.inventory_id
GROUP BY f.film_id
ORDER BY rental_count DESC
LIMIT 5;

INSERT INTO city (city, country_id)
SELECT 'San Francisco', c.country_id
FROM country c
WHERE c.country = 'United States'
  AND NOT EXISTS (SELECT 1 FROM city WHERE city = 'San Francisco' AND country_id = c.country_id);
  
INSERT INTO address (address, district, city_id, phone) 
SELECT '123 Main St','Main St', city_id, 380478512555
FROM city
WHERE city = 'San Francisco'; 

INSERT INTO customer (store_id, first_name, last_name, address_id)
SELECT 1, 'Alice', 'Cooper', address_id
FROM address
WHERE address = '123 Main St' AND city_id = (SELECT city_id FROM city WHERE city = 'San Francisco');

INSERT INTO address (address, district, city_id, phone) 
SELECT '456 Elm St','Elm St', city_id, 380478512555
FROM city
WHERE city = 'San Francisco'; 

UPDATE customer
SET address_id = (
    SELECT address_id
    FROM address
    WHERE address = '456 Elm St'
    LIMIT 1
)
WHERE first_name = 'Alice' AND last_name = 'Cooper';

DELETE FROM customer
WHERE first_name = 'Alice' AND last_name = 'Cooper';