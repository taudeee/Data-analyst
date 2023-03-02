/*Data for each employee is spread on 2 lines in the data given below.*/

data mid1;
input #1 emp_id 1-4 dep_code 1-2 @7 date_of_birth date9.
	  #2 Department $5. Salary: dollar7.;
datalines;
1101  01MAR1960
SALES 50000
1202  31DEC1959
TECH  60000
1103  01JAN1961
SALES 70000
1104  16FEB2004
SALES 80000
1501  01FEB1960
HR    40000
1502  30OCT2001
HR    70000
;
run;


proc print data = mid1;
format date_of_birth ddmmyy9.;
run;

proc print data = mid1;
format date_of_birth ddmmyy10.;
run;

/*Hierarchical data*/

data mid2(drop=type);
infile datalines missover;
input type $ @;
retain Make Origin;
	if type = "H" then input  Make $ Origin $;
	else if type = "D" then input  Model & $30.  Types $  MSRP:dollar7.;
	if type = "H" then delete;
datalines;
H Acura   Asia 
D MDX  SUV $36,945
D RSX Type S 2dr  Sedan $23,820
D TSX 4dr  Sedan $26,990
H Audi  Europe 
D A4 3.0 convertible 2dr  Sedan $42,490
D A4 3.0 Quattro convertible 2dr  Sedan  $44,240
D A6 2.7 Turbo Quattro 4dr  Sedan  $42,840
D A6 4.2 Quattro 4dr  Sedan  $49,690
D A8 L Quattro 4dr  Sedan  $69,190
D TT 1.8 Quattro 2dr (convertible)  Sports  $37,390
D TT 3.2 coupe 2dr (convertible)  Sports  $40,590
H BMW  Europe 
D X5 4.4i  SUV $52,195
D 325i 4dr  Sedan  $28,495
D 325Ci 2dr  Sedan $30,795
;
run;



data mid4;
input Make $ Type $ Origin $ MRSP horsepower weight length;
datalines;
Acura SUV Asia 36945 265 4451 189
Acura Sedan Asia 23820 200 2778 172
Acura Sedan Asia 26990 200 3230 183
Acura Sedan Asia 33195 270 3575 186
Acura Sedan Asia 43755 225 3880 197
Acura Sedan Asia 46100 225 3893 197
Acura Sports Asia 89765 290 3153 174
Audi Sedan Europe 25940 170 3252 179
Audi Sedan Europe 35940 170 3638 180
Audi Sedan Europe 31840 220 3462 179
Audi Sedan Europe 33430 220 3583 179
Audi Sedan Europe 34480 220 3627 179
Audi Sedan Europe 36640 220 3561 192
Audi Sedan Europe 39640 220 3880 192
Audi Sedan Europe 42490 220 3814 180
Audi Sedan Europe 44240 220 4013 180
Audi Sedan Europe 42840 250 3836 192
Audi Sedan Europe 49690 300 4024 193
Audi Sedan Europe 69190 330 4399 204
Audi Sedan Europe 48040 340 3825 179
Audi Sports Europe 84600 450 4024 191
Audi Sports Europe 35940 180 3131 159
Audi Sports Europe 37390 225 2921 159
Audi Sports Europe 40590 250 3351 159
Audi Wagon Europe 40840 220 4035 192
Audi Wagon Europe 49090 340 3936 179
BMW SUV Europe 37000 225 4023 180
BMW SUV Europe 52195 325 4824 184
BMW Sedan Europe 28495 184 3219 176
BMW Sedan Europe 30795 184 3197 177
BMW Sedan Europe 37995 184 3560 177
BMW Sedan Europe 30245 184 3461 176
BMW Sedan Europe 35495 225 3285 176
BMW Sedan Europe 36995 225 3285 176
BMW Sedan Europe 37245 225 3483 176
BMW Sedan Europe 39995 184 3428 191
BMW Sedan Europe 44295 225 3616 177
BMW Sedan Europe 44995 225 3472 191
BMW Sedan Europe 54995 325 3814 191
BMW Sedan Europe 69195 325 4376 198
BMW Sedan Europe 73195 325 4464 204
BMW Sports Europe 48195 333 3415 177
BMW Sports Europe 56595 333 3781 177
BMW Sports Europe 33895 184 2932 161
BMW Sports Europe 41045 225 2998 161
BMW Wagon Europe 32845 184 3594 176
Buick SUV USA 37895 275 4600 193
Buick SUV USA 26545 185 4024 187
Buick Sedan USA 22180 175 3353 195
Buick Sedan USA 26470 205 3567 200
;
run;

data 
      Make (keep = origin horsepower)
      origin(drop = horsepower make)
      MRSP(Keep = MRSP horsepower);
set mid4;
run;


data mid5;
input ID Name $ Rmit_type $ Amount:dollar7.;
datalines;
1001 John       NEFT 20000
1001 John       IMPS 10000
1001 John       NEFT 30000
1001 David      IMPS 10000
1001 David      NEFT 20000
1001 Alan       AEPS 30000
1001 Mary       NEFT 35000
1001 Mary       AEPS 20000
1001 Mary       NEFT 15000
1002 Ramesh     IMPS 20000
1002 Deepak     AEPS 40000
1002 Rani       NEFT 50000
1002 Rani       IMPS 40000
1002 Rani       AEPS 60000
1002 Rani       NEFT 70000
1003 Robert     AEPS 10000
1003 Robert     NEFT 10000
1003 Robert     IMPS 10000
1003 Manish     NEFT 50000
1003 Manish     IMPS 20000
1003 Manish     AEPS 10000
1003 Rajesh     IMPS 25000
1003 Rajesh     NEFT 30000
1003 Bill       IMPS 20000
1003 Jay        AEPS 30000
;
run;

proc sort data = mid5 out = mid6;
by name;
run;

data mid7;
set mid6;
by name;
put _all_;
if first.name then total_amount = 0;
total_amount + amount;
if last.name then output;
run;





proc sql;
select name, sum(amount) as total_amount
from mid5
group by name;
quit;

data emp3;
infile datalines;
input  s_ID $  mark @@;
datalines;
S1001 50 S1002 70 S1003 60
S1004 90 S1005 95 
S1006 60 
S1007 70 
S1008 75 S1009 90 S1010 69 S1011 95 
;
run;
