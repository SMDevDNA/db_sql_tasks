SELECT category.name AS category_name, COUNT(film.film_id) AS total_films
FROM film
JOIN film_category ON film.film_id = film_category.film_id
JOIN category ON film_category.category_id = category.category_id
GROUP BY category.name;

SELECT category.name AS category_name, AVG(film.length) AS average_length
FROM film
JOIN film_category ON film.film_id = film_category.film_id
JOIN category ON film_category.category_id = category.category_id
GROUP BY category.name;

SELECT MIN(film.length) AS min_length, MAX(film.length) AS max_length
FROM film;

SELECT COUNT(*) AS total_customers
FROM customer;

SELECT customer.first_name, customer.last_name, SUM(payment.amount) AS total_payment
FROM customer
JOIN payment ON customer.customer_id = payment.customer_id
GROUP BY customer.first_name, customer.last_name;

SELECT customer.first_name, customer.last_name, SUM(payment.amount) AS total_payment
FROM customer
JOIN payment ON customer.customer_id = payment.customer_id
GROUP BY customer.first_name, customer.last_name
ORDER BY total_payment DESC
LIMIT 5;

SELECT customer.first_name, customer.last_name, COUNT(rental.rental_id) AS total_rentals
FROM customer
JOIN rental ON customer.customer_id = rental.customer_id
GROUP BY customer.first_name, customer.last_name;

SELECT AVG(EXTRACT(YEAR FROM CURRENT_DATE) - film.release_year) AS average_age
FROM film;

SELECT COUNT(DISTINCT rental.rental_id) AS total_films_rented
FROM rental
WHERE rental.rental_period && tsrange('2005-05-20 08:00:00', '2005-05-25 08:00:0', '[]');

SELECT EXTRACT(YEAR FROM payment.payment_date) AS year,
       EXTRACT(MONTH FROM payment.payment_date) AS month,
       SUM(payment.amount) AS total_payment
FROM payment
GROUP BY year, month
ORDER BY year, month;

SELECT customer.first_name, customer.last_name, MAX(payment.amount) AS max_payment
FROM customer
JOIN payment ON customer.customer_id = payment.customer_id
GROUP BY customer.first_name, customer.last_name;

SELECT customer.first_name, customer.last_name, AVG(payment.amount) AS avg_payment
FROM customer
JOIN payment ON customer.customer_id = payment.customer_id
GROUP BY customer.first_name, customer.last_name;

SELECT film.rating, COUNT(film.film_id) AS total_films
FROM film
GROUP BY film.rating;

SELECT store.store_id, AVG(payment.amount) AS avg_payment
FROM store
JOIN payment ON store.store_id = payment.staff_id 
GROUP BY store.store_id;