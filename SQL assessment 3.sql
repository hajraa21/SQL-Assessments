#Question 1
select*from customer;select*from city;select*from country;select*from address;

select concat(c.first_name,' ',c.last_name)as full_name,ci.city,co.country from customer as c
join address a on a.address_id=c.address_id
join city as ci on ci.city_id=a.city_id
join country as co on co.country_id=ci.country_id
group by  full_name,ci.city,co.country;

#Question 2
select * from rental;select * from film; select * from inventory;
select f.film_id,f.title from film as f
 left join inventory i on i.film_id=f.film_id
 left join rental r on r.inventory_id=i.inventory_id
where r.rental_id is null;

#Question 3
select*from film;select*from rental;select*from inventory;

select f.film_id,f.title,count(r.rental_id) as times_rented from film as f
join inventory as i on f.film_id=i.film_id
join rental as r on r.inventory_id=i.inventory_id
group by f.film_id,f.title
order by times_rented desc
limit 5;

#Question 4
select*from actor;select*from film_actor;

select a.actor_id,concat(a.first_name,' ',a.last_name)as full_name, count(fa.film_id) as film from actor as a
join film_actor as fa on a.actor_id=fa.actor_id
group by a.actor_id,full_name
having count(fa.film_id) >=10
order by film desc;

#question 5
show tables;
select * from rental;select*from customer;select*from film_category;select*from inventory;select * from category;

select c.customer_id,concat(c.first_name,' ',c.last_name) as full_name,cat.name from customer as c
join inventory as i on i.store_id=c.store_id
join film_category as fc on fc.film_id=i.film_id
join category as cat on cat.category_id=fc.category_id
where cat.name='comedy'
group by c.customer_id,full_name;

#Question 6
select*from store;select*from payment;select*from inventory;select* from rental;

select s.store_id,sum(p.amount) as total_revenue from store as s
join inventory as i on i.store_id=s.store_id
join rental as r on r.inventory_id=i.inventory_id
join payment as p on p.rental_id=r.rental_id
group by s.store_id order by total_revenue;

#Question 7
select*from film;select*from category;select*from film_category;

select f.film_id,f.title,cat.name as category from film as f
join film_category as fc on f.film_id=fc.film_id
join category as cat on cat.category_id=fc.category_id;

#Question 8
select*from customer;select*from rental;

select c.customer_id,concat(c.first_name,' ',c.last_name) as full_name, month(r.rental_date) as month, year(r.rental_date) as year, count(r.rental_id) as rental
from customer as c
join rental as r on r.customer_id=c.customer_id
group by c.customer_id,month,year
having count(r.rental_id) > 10;

#Question 9
select month(rental_date) as month, year(rental_date) as year, max(rental_id) as max_rental from rental 
group by month, year
order by max_rental desc;

#Question 10
select * from customer; select * from payment;

select c.customer_id,concat(c.first_name,c.last_name)as full_name, sum(p.amount) as total_payment from customer as c
join payment as p on p.customer_id=c.customer_id
group by c.customer_id,full_name
order by total_payment desc;

#Question 11
select*from film;select*from film_actor;

select f.title,count(fa.actor_id)as actor from film as f
join film_actor as fa on fa.film_id=f.film_id
group by f.title,fa.actor_id
order by actor desc;

#Question 13
select *from film;select*from category;select*from film_category;

select f.film_id,f.title,cat.name from film as f
join film_category as fc on fc.film_id=f.film_id
join category as cat on cat.category_id=fc.category_id
where cat.name='comedy' and 'action';

#Question 14
select customer_id,sum(amount) as total from payment
group by customer_id
order by total desc
limit 2 ;

#Question 16







