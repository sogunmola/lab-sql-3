USE sakila;
/* 1) How many distinct (different) actors' last names are there?
*/
SELECT COUNT(DISTINCT last_name) fROM sakila.actor;

/* 2) In how many different languages where the films originally produced?
*/
SELECT COUNT(distinct original_language_id) FROM sakila.film;

/* 3) How many movies were not originally filmed in English?
 -- Where English = 1 as language_id
*/
SELECT COUNT(original_language_id) FROM sakila.film
WHERE original_language_id <> 1;

/* 4) Get 10 the longest movies from 2006.
*/
SELECT * FROM sakila.film
ORDER BY length DESC
LIMIT 10;

/* 5) How many days has been the company operating (check DATEDIFF() function)
*/
SELECT DATEDIFF(max(payment_date), min(payment_date)) AS 'Days of operating' FROM sakila.payment;

/* 6) Show rental info with additional columns month and weekday. Get 20.
*/
SELECT *, DATE_FORMAT(rental_date, '%M') AS rental_month, DATE_FORMAT(rental_date, '%w') AS rental_weekday FROM sakila.rental
LIMIT 20;

/* 7)Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
*/
SELECT *,
CASE
	WHEN date_format(rental_date, '%w') BETWEEN 1 AND 5 THEN 'weekday'
    ELSE 'weekend'
END AS 'day_type'
FROM sakila.rental;

/* 8) How many rentals were in the last month of activity?
*/
SELECT rental_date FROM sakila.rental;

SELECT COUNT(*)
FROM sakila.rental
WHERE  rental_date BETWEEN (SELECT DATE_SUB(MAX(rental_date), INTERVAL 1 MONTH) FROM sakila.rental) AND (SELECT max(rental_date) FROM sakila.rental);

