/*INtroduction of SQL */

proc sql;
select *
from sashelp.class;
quit;

/* We can select columns as per requirement */

proc sql;
select Name,  age, sex
from sashelp.class;
quit;

/*We use "WHERE CLAUSE" to put condition */
proc sql;
select Name,  age, sex
from sashelp.class
where sex = 'F' and age > 13;
quit;

/*Use of function */
proc sql;
select avg(age) as avg_age
from sashelp.class;
quit;

proc sql;
select min(age) as avg_age
from sashelp.class;
quit;

proc sql;
select max(age) as avg_age
from sashelp.class;
quit;

proc sql;
select count(distinct sex) as count_sex
from sashelp.class;
quit;

proc sql;
select sum(age) as sum_age
from sashelp.class;
quit;


proc sql;
select std(age) as std_age
from sashelp.class;
quit;

proc sql;
select *
from sashelp.cars
having msrp = max(msrp);
quit;

proc sql;
select make, msrp, uppercase(model) as model
from sashelp.cars
where make = 'Acura';
quit;

/* order by */
proc sql;
select *
from sashelp.class
order by age desc, sex;
quit;

/* Use of group by */
proc sql;
select make, max(msrp) as max_msrp
from sashelp.cars
group by make;
quit;

/*Having by */
proc sql;
select make, max(msrp) as max_msrp
from sashelp.cars
group by make
having max(msrp) > 80000;
quit;

/* Two functions in single query */
proc sql;
select max(age) as max_age, min(weight) as min_weight
from sashelp.class;
quit;


proc sql;
select  make, avg(msrp) as avg_msrp
from sashelp.cars
where make in ('Acura', 'Honda', 'Ford')
group by make
having avg_msrp > 10000
order by make desc;
quit;

/*Describing table */

proc sql;
select name,age
from sashelp.class;
describe table sashelp.class;
quit;


/* Creating table */
proc sql;
create table Hitesh (
Id num,
name char(20),
last_name char(30),
sex char(10)
);
quit;


/*Creating table within query */

proc sql;
create table Hit
as select name, age, sex
from sashelp.class
where age > 13;
select *
from hit;
quit;


/*saving table permanently */
libname sql1 '/home/u63059416/Hitesh';
proc sql;
create table sql1.Hit
as select name, age, sex
from sashelp.class
where age > 13;
select *
from sql1.hit;
quit;

/* To create table using existing table */
/* It will create an empty table */
proc sql;
create table sql1.hit2 like  sql1.hit;
quit;

proc sql;
create table sql1.hit2 like  sql1.hit;
quit;


/* Creating table using as 'selecting particular columns' */
proc sql;
	create table class2 as 
	select age, weight
	from sashelp.class
	where age < 14;
quit;


proc print data = class2;
run;

/*we can drop certain column as well */
proc sql;
	create table class3 as
	select *
	from sashelp.class(drop = age);
quit;



/*Specifying certain attributes*/
proc format;
value $gender
'M' = 'Male'
'F' = 'Female';
run;

 
proc format lib=work fmtlib;
run;

 
proc sql;
select name label='Student Name',
       age,
       sex format=$gender.,
       height label='Height of Student'
from sashelp.class;
quit;


proc sql;
create table  class as
	select *
    from sashelp.class;
    select * from sashelp.class;
quit;

proc sql;
	insert into class (name, age, sex, height, weight)
	values ('Brown', 45, 'M', 14, 15);
quit;

proc sql;
	insert into class
	set name = 'Bill', age = 99, sex = 'F', height = 55.5, weight = 90.0;	
quit;


proc sql;
	select *
	from class;
quit;


/* update */
proc sql;
update class
	set 
	name = upcase(name),
	age = age + 10;	
 select *
 from class;
quit;


/*Updating rows */
proc sql;
create table  class as
	select *
    from sashelp.class;
    select * from sashelp.class;
quit;


proc sql;
select name, age, weight
from sashelp.class
where name like 'A%';
quit;

/*Updating rows whose name start with B and assigning value less than 10 in usual */
proc sql;
	Update class
	set height = weight - 10
	where name like 'B%';
quit;

proc sql;
	select *
	from class;
quit;


/*Delete statement */
/* it is use for deleting table, rows, column using condition like where */
/*without where clause all the rows will be deleted */

proc sql;
	select *
	from class;
quit;

/*Delete certain rows */
/* Here us deleted the rows where name starts with 'A' */

proc sql;
	delete from class
	where name like 'A%';
select *
from class;
quit;



/*Altering columns */
/*we need to use alter table using table name 
and then add column which we want to add */

proc sql;
Alter table class
add BMI num label = 'Body Mass Index';
Update class
set BMI = (weight/height**2) * 100;
quit;

proc sql;
select *
from class;
quit;


proc sql;
	select *
	from class (drop = age);
quit;

proc sql;
	Alter table class
	add age num label = 'Age of student'
	modify age  format = 2.1;
quit;

proc sql;
select *
from class;
quit;
