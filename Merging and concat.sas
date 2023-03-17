
/* Folowing is the ATM withdrawal data from 3 different ATMs: */

data account;
input account_id $ withdrawl_date:mmddyy10. withdrawl_amount;
datalines;
A1001 01/01/2023 25000
A1002 01/15/2023 10000
A1003 01/20/2023 5000
A1004 01/30/2023 15000
A1005 02/05/2023 35000
;
run;


data account1;
input account_id $ withdrawl_date:mmddyy10. withdrawl_amount;
datalines;
A1001 02/01/2023 4000
A1002 02/15/2023 7000
A1003 02/20/2023 8000
A1004 02/28/2023 6000
A1005 02/28/2023 11000
;
run;


data account2;
input account_id $ withdrawl_date:mmddyy10. withdrawl_amount;
datalines;
A1001 02/10/2023 7000
A1002 02/25/2023 9000
A1003 02/15/2023 7500
A1004 03/10/2023 5500
;
run;


data atm;
	set account1 account2 account1;
run;

proc sort data = atm out = atm1;
by account_id;
run;

proc sort data = atm out = atm2;
by descending withdrawl_amount;
run;



/*Merging data */

data clinical1;
input subjid $ Height Weight Diastolic Systolic;
datalines;
S10001 62.25 132 90 170
S10002 65.75 158 80 128
S10003 66 156 76 110
S10004 61.75 131 92 176
S10005 64.75 136 80 112
S10006 71 194 68 132
S10007 66.25 179 76 128
S10008 64.25 151 68 108
S10009 70 174 90 142
S10010 67.25 165 76 128
S10011 69 155 90 130
S10012 64.5 134 76 120
S10013 66.25 151 72 132
S10014 67.75 162 96 138
S10015 66.25 148 78 110
S10016 64 147 74 120
S10017 65.75 156 74 156
S10018 63.75 122 84 132
S10019 67.5 185 88 150
;
run;


proc sort data = clinical1 out = clinical2;
by subjid;
run;

data clinical3;
input subjid $ Name $ site$;
datalines;
S10001 Alfred site001
S10002 Alice site001
S10003 Barbara site001
S10004 Carol site001
S10005 Henry site001
S10006 James site002
S10010 John site002
S10011 Joyce site002
S10012 Judy site002
S10007 Jane site002
S10008 Janet site002
S10009 Jeffrey site002
S10013 Louise site002
S10014 Mary site002
S10015 Philip site003
S10017 Ronald site003
S10018 Thomas site003
S10019 William site003
S10016 Robert site003
;
run;


proc sort data = clinical3 out = clinical4;
by subjid;
run;

data clin1_clin2;
merge clinical2 (in = a) clinical4 (in = b);
by subjid;
if a and b;
run;


/*input function and put function */

data student;
input student_id $ Name $ date_of_birth:date9.;
datalines;
S1011 Joyce 02MAR2000
S1012 Judy 15APR2005
S1007 Jane 10OCT2004
S1008 Janet 25DEC2002
S1009 Jeffrey 20NOV2001
S1013 Louise 17FEB2003
S1014 Mary 05MAY2007
S1015 Philip 01JUN2006
;
run;

data student1 (drop= date_of_birth);
set student;
date = input(date_of_birth, worddate19.);
run;

proc print data = student1;
format date worddate19.;
run;


data student2(drop = date_of_birth);
set student;
date = put(date_of_birth, worddate19.);
run;

data prize_info;
input position $  prize $ amount:dollar5.;
datalines;
1st prize $5000
2nd prize $4000
3rd prize $3500
4th prize $2500
5th prize $2000
;
run;


data score;
input pat_id $ score;
datalines;
P1001 70
P1002 85
P1003 67
P1004 50
P1005 75
P1006 55
P1007 45
P1008 90
P1009 95
P1010 60
;
run;

proc sort data = score out = score1;
by descending score;
run;
 
data com(drop = prize);
set score1;
set prize_info;
run;



