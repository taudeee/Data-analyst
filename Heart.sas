proc print data = sashelp.heart;
run;

proc sql;
select * 
from sashelp.heart;
quit;

/* average weight of female under underweight category*/

proc sql;
select avg(weight) as avg_weight
from sashelp.heart
where sex = 'Female' and weight_status = 'Underweight';
quit;


/* average weight of male under overweight category*/

proc sql;
select max(weight) as avg_weight
from sashelp.heart
where sex = 'Male' and weight_status = 'Overweight';
quit;


/*Relationship between status and cancer */
proc sql;
select status, smoking
from sashelp.heart
where smoking > 10;
quit;



/*Relationship between BP status and weight status */

proc sql;
select BP_Status, count(*)
from sashelp.heart;
Where Weight_Status = 'Overweight' 
group by BP_status;
quit;


proc sql;
SELECT Weight_Status, BP_Status, COUNT(DISTINCT BP_Status)
FROM sashelp.heart
GROUP BY Weight_Status, BP_Status;
quit;

/*Number of people with each BP_Status*/
proc sql;
SELECT BP_Status, COUNT(Weight_Status)
FROM sashelp.heart
GROUP BY BP_Status;
quit;


/*Relationship between BP status and smoking */
Proc sql;
select BP_Status, count(Smoking_Status) as Smoker_number /*this gives the number of smokers in each BP status */
from sashelp.heart
group by BP_Status;
quit;

/*To find the number relation of smokers with BP*/
proc sql;
select BP_Status, count(Smoking_Status)
from sashelp.heart
where Smoking_Status = 'Very_Heavy'
group by BP_Status;
quit;

/* To find the distinct column name */
proc sql;
describe table sashelp.heart;
quit;


/*Relationship between BP_status and weight_status */
proc freq data = sashelp.heart;
tables BP_Status*Weight_Status /nocum nopercent norow nocol;
run;

/*Realationship between and smoking status */
proc freq data=sashelp.heart;
tables BP_Status*Smoking_Status /nocum nopercent norow nocol;
run;

proc freq data=sashelp.heart;
tables Chol_Status*BP_Status
run;

proc means data=sashelp.class;
run;

proc means data=sashelp.class;
var age
run;

proc means data=sashelp.class n mean median;
var 
run;



proc sql;
SELECT BP_Status, Weight_Status, COUNT(*) as Frequency
FROM sashelp.heart
GROUP BY BP_Status, Weight_Status;
quit;