#question 1
select concat(first_name,' ',last_name) as full_name from customer;

#question 2
select month(rental_date) as month, year(rental_date)as year from rental group by month(rental_date), year(rental_date) ;
select concat(month(rental_date),'/', year(rental_date)) as 'month/year' from rental;

#question 3
select * from customer;
select customer_id,first_name,last_name from customer where email is null;

#question 4
select * from address;
select replace (address,'null','not_available') as not_availabe from address;

#question 5
select*from rental;

select rental_date,return_date,datediff(return_date,rental_date) as 'returned in (days):' from rental;

#question 6
select month(rental_date) as 'rental month' from rental group by month(rental_date);

#question 7
select*from film;
select length,
case
when length<60 then 'short'
when length between 60 and 120 then 'medium'
else 'long'
end as 'classified length'
from film;

#question 8
select* from city;
select * from country;

select ci.city from city as ci
join country as co on co.country_id=ci.country_id
where co.country='india'
union
select ci.city from city as ci
join country as co on co.country_id=ci.country_id
where co.country='canada';

#question 9
select *  from customer;
select * from rental;
select * from payment;

select c.customer_id,c.first_name,c.last_name,count(r.rental_id) as 'rented', sum(p.amount) as 'total payment'
from customer as c
join payment as p on p.customer_id=c.customer_id 
join rental as r on r.customer_id=c.customer_id 
group by  c.customer_id,c.first_name,c.last_name
having 'total payment' > (select avg(amount)) and (select count(r.rental_id)) > 20;

#question 10
select title,
coalesce (replacement_cost,'none') as replacement_cost from film;

select title,
coalesce (original_language_id,'none') as original_language_id from film;

#question 11
select c.first_name,c.last_name,r.rental_count
from customer as c
join ( select customer_id,count(*) as 'rental_count'
from rental
group by customer_id) as r on r.customer_id=c.customer_id;

#question 12
select * from rental;
select* from store;

#question 13
select first_name,last_name from customer as c
join payment as p on p.customer_id=c.customer_id
where p.amount in (5,8,10);

#Question 14
show tables;
select * from film_category;
select * from rental;
select * from payment;





