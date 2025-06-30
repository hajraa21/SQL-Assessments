select * from film;
select *from actor;
select * from customer;
select * from rental;
select * from inventory;
select * from store;
select * from address;
select * from city;
select* from payment;

#Question 1
select distinct release_year from film;

#Question 2
select first_name from customer where first_name like'A%';

#Question 3
SELECT title, rating from film where rating in ('PG','PG-13');

#Question 4
select first_name, last_name, city_id from customer as c join city as ci on address_id where city_id in (300);

#Question 5
select first_name,last_name from customer where last_name like ('%son');

#Question 6
select last_name, first_name from customer limit 10;

#Question 7
select count(*) from rental inner join inventory on rental.inventory_id = inventory.inventory_id where inventory.store_id = 1;

#Question 8
select store_id, count(distinct film_id) from inventory group by store_id;

#Question 9
select customer_id, count(*) from rental group by customer_id;

#Question 10
select title,rental_duration from film where rental_duration between 5 and 7;

#Question 11
select * from customer as c 
left join rental as r on c.customer_id= r.customer_id 
where r.rental_id is null;

#Question 12
select customer_id, sum(amount) from payment group by customer_id;

#Question 13
select * from film;
select * from film_actor;

select f.title, count(fa.actor_id) as actor from film as f
join film_actor as fa on f.film_id=fa.film_id
group by f.film_id,f.title
having count(fa.actor_id) >5;

#Question 14
select * from payment;

select customer_id, sum(amount) as total from payment group by customer_id order by total desc limit 5 ;

#Question 15
show tables;
select * from customer;
select * from city;
select * from address;

select cu.customer_id,ci.city_id from customer as cu
join address as a on cu.address_id=a.address_id
join city as ci on ci.city_id=a.city_id
group by cu.customer_id,ci.city_id
having count(cu.customer_id)>20;

#Question 16
select * from films_rented;

#Question 17
select c.customer_id,c.first_name,c.last_name,max(rental_date) as recent_rental from customer as c
join rental as r on r.customer_id=c.customer_id
group by c.customer_id,c.first_name,c.last_name order by recent_rental desc;

#Question 18
select c.customer_id,c.first_name,c.last_name, avg(p.amount) as average_payment from customer as c
join payment as p on p.customer_id=c.customer_id
group by  c.customer_id,c.first_name,c.last_name;

#Question 19
select * from film; select*from rental; select* from customer;select*from inventory;
select c.customer_id,c.first_name,c.last_name,f.title from customer as c
join rental as r on c.customer_id=r.customer_id
join inventory as i on i.inventory_id=r.inventory_id
join film as f on f.film_id=i.film_id
where title='ACADEMY DINOSAUR'
group by c.customer_id,c.first_name,c.last_name;

#Question 20
select customer_id, sum(amount) as payment, 
case
when sum(amount)  > 100 then 'high'
when sum(amount) between 50 and 100 then 'medium'
else 'low'
end as payment_type from payment
group by customer_id
order by sum(amount) desc;



