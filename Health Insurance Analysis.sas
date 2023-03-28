/*Creating library */

libname phonix '/home/u63059416/Project';

/*conveting csv into sas.dataset into under phonix library */
proc import datafile = '/home/u63059416/Project/2020 Rates.csv'
	out = phonix.rate
	dbms = csv
	replace;
run;

/* converting character into numeric */
 
data out_rate(drop = rates);
set phonix.rate;
total = input(Rates, dollar7.);
run;

proc print data = out_rate;
run;

/*importing csv and converting into sas dataset */

Proc import datafile = '/home/u63059416/Project/ac.csv'
	out =  phonix.claim 
	dbms = csv
replace;
run;

/*changing datatype from character to numeric */

data phonix.out_anciliary(drop = anc2020 anc2021 gtotal);
set phonix.claim;
rename 'new id'n = new_id;
anc_2020 = input(anc2020, dollar11.);
anc_2021 = input(anc2021, dollar11.);
grand_total = input(gtotal, dollar11.);
run;

proc print data = phonix.out_anciliary;
run;

/*importing file and converting into sas dataset */
proc import datafile = '/home/u63059416/Project/hospo.csv'
	out = phonix.out_hospo
	dbms = csv
replace;
run;

/* change of data type */

data phonix.hospo (drop = hos2020 hos2021 Gtotal var5 var6 var7 var8 
 var9 var10 var11 var12 var13 var14 var15 var16 var17 var18 var19 var20 var21 var22 var23 var24 var25 var26);
set phonix.out_hospo;
rename 'New id'n = new_id;
hosp_2020 = input(hos2020, dollar11.);
hosp_2021 = input(hos2021, dollar11.);
Grand_Htotal = input(GTotal, dollar11.);
run;

/*importing datatype */

proc import datafile = '/home/u63059416/Project/Agent.csv'
	out = phonix.out_agent (drop = var10 var11 var12 var13)
	dbms = csv
	replace;
run;

/*rename of columns */

data phonix.out_agent;
set phonix.out_agent;
rename 'New id'n = new_id;
rename 'Join Date'n = join_date;
rename 'Termination Date'n = termination_date;
run;

/*sorting data by ascending */

proc sort data = phonix.out_agent;
by new_id;
run;

proc print data = phonix.out_agent;
run;

/*Is there any indication of “hit n run” behaviour 
(someone joins, claims a lot then terminates within an 18-month period)?*/

data phonix.hit_run;
set phonix.out_agent;
Duration_month = intck('month', Join_date, Termination_Date);
run;

/*number of left members within 18 months */

proc sql;
select join_date, termination_date, duration_month, count(duration_month) as left_member
from phonix.hit_run
where termination_date is not null and Duration_month < 18;
quit;

/* 433 members had left the phonix health insurance within 18 months */

proc sql;
select grand_total, grand_Htotal 
from phonix.out_anciliary, phonix.hospo;
quit;

/*Merging data by new_id */
/*before that sorting data by new_id */

proc sort data = phonix.hospo;
by new_id;
run;

proc sort data = phonix.out_anciliary;
by new_id;
run;

/*Merging data */

data phonix.anc_hospo;
merge phonix.out_anciliary phonix.hospo;
by new_id;
run;

proc print data = phonix.anc_hospo;
run;

data phonix.sum(keep = grand_total grand_htotal sum);
set phonix.anc_hospo;
sum = sum(grand_total, grand_htotal);
run;

proc print data = phonix.sum;
Title 'Total claimed in each year';
run;

