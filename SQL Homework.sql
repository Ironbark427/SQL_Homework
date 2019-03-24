Select first_name, last_name from actor;

Select UPPER(CONCAT(first_name, ' ', last_name)) as 'Actor Name' from actor;

Select actor_id, first_name, last_name from actor where first_name = "Joe";

select concat(first_name, ' ', last_name) as 'Actor Name' from actor where last_name like "%GEN%";

select first_name, last_name from actor where last_name LIKE "%LI%" order by last_name ASC, first_name ASC;

select country_id, country from country where country in ('Afghanistan', 'Bangladesh', 'China');

Alter Table actor ADD Description blob;

Alter Table actor DROP Description;

Select last_name, count(last_name) from actor group by last_name having count(last_name) >= 2;

Update actor Set first_name = "HARPO" where first_name = "GROUCHO" AND last_name = "WILLIAMS";

Update actor Set first_name = "GROUCHO" where first_name = "HARPO" AND last_name = "WILLIAMS";

CREATE TABLE Address (
    address_id smallint NOT NULL AUTO_INCREMENT,
    address varchar(50) NOT NULL,
    address2 varchar(50),
    district varchar(50),
    city_id smallint,
    postal_code varchar(10),
    phone varchar(20),
    location geometry,
    last_update datetime default CURRENT_TIMESTAMP,
    PRIMARY KEY (address_id)
);

Select staff.first_name, staff.last_name, address.address from staff LEFT JOIN address on staff.address_id = address.address_id;

Select staff.first_name, staff.last_name, sum(payment.amount) from staff JOIN payment on staff.staff_id = payment.staff_id group by payment.staff_id;

select film.title, count(film_actor.actor_id) from film INNER JOIN film_actor on film.film_id = film_actor.film_id group by film.title;

select film.title, count(inventory.film_id) from film join inventory on film.film_id = inventory.film_id where film.title = "Hunchback Impossible";

select customer.first_name, customer.last_name, sum(payment.amount) as 'Total Amount Paid' from customer join payment on customer.customer_id = payment.customer_id group by customer.customer_id order by customer.last_name ASC;

select title from film where title LIKE "K%" or title LIKE "Q%" and language_id in (select language_id from language where name = "English");

Select first_name, last_name from actor where actor_id in (Select actor_id from film_actor where film_id in (select film_id from film where title = "Alone Trip"));

select customer.email, country.country from customer join address on customer.address_id = address.address_id join city on address.city_id = city.city_id join country on city.country_id = country.country_id where country.country = "Canada";

select film.title from film join film_category on film.film_id = film_category.film_id join category on category.category_id = film_category.category_id where category.name = "Family";

select film.title, count(rental.rental_id) from film join inventory on inventory.film_id = film.film_id join rental on rental.inventory_id = inventory.inventory_id group by film.title order by count(rental.rental_id) desc; 

select store.store_id, sum(payment.amount) from payment join staff on payment.staff_id = staff.staff_id join store on store.store_id = staff.store_id group by store.store_id;

select store.store_id, city.city, country.country from store join address on store.address_id = address.address_id join city on address.city_id = city.city_id join country on city.country_id = country.country_id group by store.store_id;

select category.name, sum(payment.amount) from category join film_category on category.category_id = film_category.category_id join inventory on inventory.film_id = film_category.film_id join rental on rental.inventory_id = inventory.inventory_id join payment on rental.rental_id = payment.rental_id group by category.name order by sum(payment.amount) desc limit 5;

CREATE VIEW Top_Gross_Genre AS select category.name, sum(payment.amount) as 'Total_Revenue' from category join film_category on category.category_id = film_category.category_id join inventory on inventory.film_id = film_category.film_id join rental on rental.inventory_id = inventory.inventory_id join payment on rental.rental_id = payment.rental_id group by category.name order by sum(payment.amount) desc limit 5;

select * from Top_Gross_Genre;

Drop view top_gross_genre;