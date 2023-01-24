data car;
input make $ type $ engine size cylinders mpg_city mpg_highway;
datalines;
Acura SUV 3.5 6 17 23
Acura Sedan 2 4 24 31
Acura Sedan 2.4 4 22 29
Audi Sedan 2.7 6 18 25
Audi Sedan 4.2 8 17 24
Audi Sedan 4.2 8 17 24
BMW Sedan 2.5 6 20 29
BMW Sedan 2.5 6 19 27
BMW Sports 3 6 21 29
BMW Wagon 2.5 6 19 26
Buick Sedan 3.8 6 20 29
Buick Sedan 3.8 6 18 28
Cadillac SUV 5.3 8 14 18
Cadillac SUV 4.6 8 16 21
Chevrolet Sedan 2.2 4 26 37
Chevrolet Sedan 2.2 4 26 37
Chrysler Sedan 3.3 6 19 26
Chrysler Sedan 3.8 6 18 25
Chrysler Sports 3.2 6 17 25
Chrysler Wagon 3.5 6 17 23
Dodge SUV 4.7 8 15 21
Dodge Sedan 2 4 29 36
Dodge Sedan 2 4 29 36
;
run;

/*Find out the Highest mileage on the highway in the data*/

proc sql;
select max(mpg_highway) as max_highway
from car;
quit;

proc means data=car max;
   var mpg_highway;
run;

/*Find out the average mileage in the city – make wise*/

proc sql;
select make as make, avg(mpg_city)
from car
group by make;
quit;

proc means data=car mean;
   var mpg_city;
   class make_type;
run;

/*Find out make wise car with maximum cylinders*/

proc freq data = car.sasdata;
tables make*cylinders /nocum nopercent norow nocol;
run;

/* .Find out make wise car with maximum cylinders*/
proc sql;
select make, max(cylinders) as frequency
from car
group by make;
quit;

/* Find out the biggest engine – make wise.*/
proc sql;
select make, max(engine) as max_engine
from car
group by make;
quit;