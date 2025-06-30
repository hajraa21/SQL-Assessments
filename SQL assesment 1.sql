#Qustion 1
select first_name, last_name from actor;

#Question 2
select count(film_id) from film;

#Question 3
select distinct rating from film;
select * from film;

#Question 4
select first_name, last_name, store_id from customer where store_id=1;

#Question 5
select title from film order by title limit 5;

#Question 6
select title, rental_rate from film where rental_rate > 3;

#Question 7
select first_name, last_name from actor where first_name='Penelope';

#Question 8
select title , replace ('title',' ','-') as 'hyphen' from film;

#Question 9
select * from customer;
select count(first_name) from customer
group by store_id;

#Question 10
select title from film where length(title)=7;
