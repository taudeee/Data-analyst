/*Creating library*/libname ILIP '/home/u63059416/Data';


/*Creating filename using location*/
filename emp7 '/home/u63059416/raw data/empdata7.txt';

/*converting em7 data using filename reference*/
data ILIP.em;
infile emp7 dlm = '*';
input empId dept $ salary;
run;

/*Creating filename reference for class_TXT*/
filename class '/home/u63059416/raw data/CLASS_TEST.TXT';

/*converting above files using infile statement*/
data ILIP.class_TXT2;
infile class dlm = ',';
input name $ age Gender $ Weight;
run;

/*Converting raw data into sas dataset*/
data ILIP.em7;
infile '/home/u63059416/raw data/empdata7.txt' dlm='*';
input empId dept $ salary;
run;

/*creating dataset using class_txt*/
data ILIP.class_txt;
infile '/home/u63059416/raw data/CLASS_TEST.TXT' dlm = ',';
input Name $ age Gender $ Weight;
run;

proc sql;
select avg(Weight) as avg_weight
from ILIP.class_txt;
quit;

/*Conveting class_txt file and emp7 into sas dataset using datalines*/

data ILIP.class_text2;
input name $ age Gender $ weight;
datalines ;
Alfred,14,M,69.00
Alice,13,F,56.50
Barbara,13,F,65.30
Carol,14,F,62.80
Henry,14,M,63.50
James,12,M,57.30
Jane,12,F,59.80
Janet,15,F,62.50
Jeffrey,13,M,62.50
John,12,M,59.00
Joyce,11,F,51.30
Judy,14,F,64.30
Louise,12,F,56.30
Mary,15,F,66.50
Philip,16,M,72.00
Robert,12,M,64.80
Ronald,15,M,67.00
Thomas,11,M,57.50
William,15,M,66.50
;
run;

/*Converting data into sas dataset using colum input*/
data ILIP.Banking_txt;
infile '/home/u63059416/raw data/Banking.txt';
input empID 1-4 Name $ 6-9  Dept $ 17-20 Salary 22-26;
run;

/*Converting datafiles into sas datalines when data is seperated by '*' */
data emp8;
infile datalines dlm = '*';
input empID Dept $ salary;
datalines;
1107*FINANCE*90000              
1108*TECH*75000
1109*SALES*85000
;
run;


data emp9;
infile datalines dlm = ',';
input name $ age Gender $ weight;
datalines;
Alfred,14,M,69.00
Alice,13,F,56.50
Barbara,13,F,65.30
Carol,14,F,62.80
Henry,14,M,63.50
James,12,M,57.30
Jane,12,F,59.80
Janet,15,F,62.50
Jeffrey,13,M,62.50
John,12,M,59.00
Joyce,11,F,51.30
Judy,14,F,64.30
Louise,12,F,56.30
Mary,15,F,66.50
Philip,16,M,72.00
Robert,12,M,64.80
Ronald,15,M,67.00
Thomas,11,M,57.50
William,15,M,66.50
;
run;


/*Creating sas dataset from a raw data file*/
libname ILIP '/home/u63059416/Data';

data ILIP.class2;
infile '/home/u63059416/raw data/CLASS_TEST.TXT' dsd;
input Name $ age sex $ Height;
Put _all_;
run;

/*Importing files in sas studio */
libname ILIP '/home/u63059416/Data';

Data ILIP.heart;
infile '/home/u63059416/raw data/heart.txt' dsd;
input status height weight BP_status;
run;

Data ILIP.cars;
infile '/home/u63059416/raw data/cars.txt';
input make $ type $ origin $ msrp horsepower weight length;
run;

Data ILIP.airs;
infile '/home/u63059416/raw data/air.txt' dsd;
input Month $ 1-3 Rating 4-5 air 7-9;
put _all_;
run;


/*importing Excel File Proc import*/
Proc import datafile = '/home/u63059416/raw data/EMP_EXCEL.xlsx'
dbms=xlsx
out = ILIP.excelfile replace;
run;

proc import datafile = '/home/u63059416/raw data/demo.xlsx'
out = demo
dbms = xlsx replace;
run;

/*Creating dataset using SAS dataset */

data bmt;
set sashelp.bmt;
run;

libname ILIP '/home/u63059416/Data';

data air;
set ILIP.airs;
run;

data carr;
set sashelp.heart;
put _all_;
run;


data bmi;
set sashelp.class;
bmi = weight /(height**2);
run;

data class;
put _all_;
set sashelp.class;
weight_kg = Weight * 0.4;
put _all_;
run;


data cars;
put _all_;
set sashelp.cars;
Tax = 0.1 * msrp;
put _all_;
run;


data heart;
put _all_;
set sashelp.heart;
bmi = weight / (height ** 2);
put _all_;
run;


data em1;
infile em1 '/home/u63059416/raw data/em1.txt' dsd;
input deptID 1-4 Department $ 6 -10 salary 12-16;
put _all_;
run;

/*Importing data using informats*/
data friday;
input @1 empid $4. @6 dept $5. @12 salary 5. @18 dob ddmmyy10. ;
datalines;
1101 SALES 50000 01/02/2000
1201 HR    60000 10/05/1995
1103 SALES 70000 01/01/1960
;
run;

proc print data = friday;
format dob worddate.;
run;


data friday;
input @1 empid $4. @6 dept $5. @12 salary dollar7.  @20 dob ddmmyy10. ;
datalines;
1101 SALES $50,000 01/02/2000
1201 HR    $60,000 10/05/1995
1103 SALES $70,000 01/01/1960
;
run;

proc print data = friday;
format dob worddate.;
format salary dollar7.;
run;


data assignment1;
input @1 Branch_Id $4. @6 Name $5. @17 Remit_Type $4.  @22 Amount dollar7. @30 date_txn mmddyy10. ;
datalines;
1001 John       NEFT $20,000 11/25/2000
1001 David      IMPS $10,000 12/20/1990
1001 Alan       AEPS $30,000 01/01/1960
1001 Mary       NEFT $35,000 01/01/1959
;
run;

proc print data = assignment1;
format date_txn worddate.;
run;


data assignment082;
input @1 flight_no $15 departure_date destination_revenue;
datalines;
43912/11/00LAX $50,000
92112/11/00DFW $30,000
11412/12/00LAX $10,000
98212/12/00dfw $60,000
43912/13/00LAX $35,000
;
run;

data assignment083;
input @1 Make $5. @8 Type $5. @15 Origin $6. @23 Price dollar7. @31 Release_date date9.;
datalines;
Acura  SUV    Asia    $36,945 01JAN2000 
Acura  Sedan  Asia    $23,820 25DEC1995
Audi   Sedan  Europe  $25,940 10OCT2010
Audi   Sedan  Europe  $35,940 05AUG2015
BMW    SUV    Europe  $37,000 14FEB2014
BMW    SUV    Europe  $52,195 11NOV2012 
Buick  SUV    USA     $37,895 02MAR2017
Buick  SUV    USA     $26,545 03APR2018
;
run;

proc print data = assignment083;
format release_date worddate.;
run;



 /* Informates using missover */
data patients;
input @1 id $5.
	  @1 initials $3. +3 ssn comma11.
	  @19 (test1 - test3)  (4. +1);

datalines;
AFG03 999-99-0393 381  1.3  5
TEY01 999-99-7362           3
REW17 999-99-4313 25   0    3
;

run;


data car1;
input @1 Make $5.
	  @8 Type $5.
	  @15 Origin $6.
	  @23 Price comma7.
	  @31 Date Date9.
	  ;
datalines;
Acura  SUV    Asia    $36,945 01JAN2000 
Acura  Sedan  Asia    $23,820 25DEC1995
Audi   Sedan  Europe  $25,940 10OCT2010
Audi   Sedan  Europe  $35,940 05AUG2015
BMW    SUV    Europe  $37,000 14FEB2014
BMW    SUV    Europe  $52,195 11NOV2012 
Buick  SUV    USA     $37,895 02MAR2017
Buick  SUV    USA     $26,545 03APR2018
;

run;


proc print data = car1;
format date ddmmyy10. ;
run;

data car2;
infile datalines dlm =',';
input name $ (q1 -q3) ($);
datalines;
soham,abc,b,c
ram,d,e,f,
hit,a,f,g 
;
run;



data car2;
infile datalines dlm =',' dsd;
input name $ (q1 -q3) ($);
datalines;
soham,abc,b,c
ram,d,e,f,
hit,a,,g 
;
run;



data car3;
infile datalines dlm =',' missover;
input name $ (q1 -q3) ($);
datalines;
soham,abc,b,
ram,d,e,
hit,a,f,g 
;
run;


data car3;
infile datalines dlm =',' dsd missover;
length name $ 13;
input name $ (q1 -q3) ($);
datalines;
soham pantha,abc,b,c
ram,d,e,f,
hit,a,,g 
;
run;


/* Create SAS data set for the following raw data:
Branch_id Name Remit_type Amount date_txn 
Use List input. */

data assignment021;
input Branch_id Name $ Remit_type $ Amount;
datalines;
1001 John       NEFT 20000 
1001 David      IMPS 10000 
1001 Alan       AEPS 30000 
1001 Mary       NEFT 35000 
;
run;


/*  Create SAS data set for the following raw data:
Branch_id Name Remit_type Amount date_txn 
Use List input. Use infile statement along with options.
*/

data assignment022;
	infile datalines dlm=" " dsd;
	length Name $ 14;
input Branch_id Name $ Rmit_Type $ Amount dollar5.;
datalines;
1001 "John Brown" NEFT 20000
1001 "David Thompson" IMPS 10000
1001 "Alan Gore" AEPS 30000
1001 "Mary D" NEFT 35000
;
run;

 /*Create SAS data set for the following raw data:*/
data assignment023;
	infile datalines dlm = ':';
	input flight_no date_of_departure mmddyy8. destination $ revenue dollar5.;
datalines;
439:12/11/00:LAX:50000
921:12/11/00:DFW:30000
114:12/12/00:LAX:10000
982:12/12/00:dfw:60000
439:12/13/00:LAX:35000
;
run;


/*Create SAS data set for the following raw data:
Use list input.*/

data assignmento24;
	infile datalines missover;
input Make $ Type $ Origin $ Mrsp;
datalines;
Acura  SUV    Asia    36945  
Acura  Sedan  Asia    
Audi   Sedan  Europe  25940 
Audi   Sedan  Europe  
BMW    SUV    Europe  
BMW    SUV    Europe  52195  
Buick  SUV    USA     37895 
Buick  SUV    USA     26545 
;
run;


/*Modified list input with amperstand*/

data Test;
input ID Name & $14. Rmit_type $ Amount;
datalines;

1001 John Brown  NEFT 20000
1001 David Thompson  IMPS 10000
1001 Alan Gore  AEPS 30000
1001 Mary D  NEFT 35000
;
run;


/*Modified list inl=put using colon and amperstand*/

data Test2;
input Branch_id Name & $13. Rmit_type $ Amount:dollar5. Transaction_date:mmddyy10.;
datalines;
1001 John Brown  NEFT $20,000 11/25/2000
1001 David Thompson  IMPS $10,000 12/20/1990
1001 Alan Gore  AEPS $30,000 01/01/1960
1001 Mary D  NEFT $35,000 01/01/1959
;
run;

proc print data = Test2;
format Transaction_date worddate.;
run;


/* use of put statement to create text file in sas */

data app;
	set sashelp.class;
	file '/home/u63059416/raw data/raww.txt' dsd;
	put name sex age height:5.2;
run;

/*Mixed input*/

data mixed_dataset;
input ID 1-4 Name & $14. Rmit_type $  @29 Amount dollar7.  @37 Txn_date mmddyy10.;
/*format Txn_date worddate.;*/
datalines;
1001 John Brown  NEFT       $20,000 11/25/2000
1001 David Thompson  IMPS   $10,000 12/20/1990
1001 Alan Gore  AEPS        $30,000 01/01/1960
1001 Mary D  NEFT           $35,000 01/01/1959
;
run;



proc print data = mixed_dataset;
run;


/* 1. Create SAS data set for the following raw data 
Use Mixed input styles. */


data assignment131;
input @1 Make $5. Model & $35. Type $ Origin $7. @57 MSRP dollar7.;
datalines;
Acura  MDX  SUV  Asia                                   $36,945
Acura  RSX Type S 2dr  Sedan  Asia                      $23,820
Acura  TSX 4dr  Sedan Asia                              $26,990
Audi  A4 3.0 convertible 2dr  Sedan  Europe             $42,490
Audi  A4 3.0 Quattro convertible 2dr  Sedan  Europe     $44,240
Audi  A6 2.7 Turbo Quattro 4dr  Sedan  Europe           $42,840
Audi  A6 4.2 Quattro 4dr  Sedan Europe                  $49,690
Audi  A8 L Quattro 4dr  Sedan Europe                    $69,190
Audi  TT 1.8 Quattro 2dr (convertible)  Sports  Europe  $37,390
Audi  TT 3.2 coupe 2dr (convertible)  Sports  Europe    $40,590
BMW  X5 4.4i  SUV  Europe                               $52,195
BMW  325i 4dr  Sedan  Europe                            $28,495
BMW  325Ci 2dr  Sedan  Europe                           $30,795
;
run;


/*Create SAS data set for the following raw data:*/

data assignment132;
input Branch_ID 1-4 Name & $14. RMit_type $ @30 Amount:dollar8.2;
datalines;
1001 John Brown  NEFT       $20,000.00
1001 David Thompson  IMPS   $10,000.00
1001 Alan Gore  AEPS        $30,000.55
1001 Mary D  NEFT           $35,000.70
;
run;


/*Line Pointer */

data test;
input idNumber 1-4 name $ 6-23;
input team $;
input startWeight 1-3 EndWeight 5-7;
datalines;
1023 David
Shaw Red
189 165
;
run;

data test2;
input Name $ / sex $ / Age 1-2 @4 Height 5.2;

datalines;
Alfred  
M 
14 69.00
Alice  
F 
13 56.50
Barbara  
F 
13 65.30
Carol  
F 
1462.80
;
run;


data test2;
input Name $ / / Age 1-2 @4 Height 5.2;

datalines;
Alfred  
M 
14 69.00
Alice  
F 
13 56.50
Barbara  
F 
13 65.30
Carol  
F 
1462.80
;
run;


/*# line pointer*/
data test123;
input #2 sex $ 
	#1 Name $
	#3 Age 1-2 @4 height 5.2;
datalines;
Alfred  
M 
14 69.00
Alice  
F 
13 56.50
Barbara  
F 
13 65.30
Carol  
F 
1462.80
;
run;


data IF_statement;
input Model $ Type $ Origin $ MSRP;
IF      upcase(Model) = "ACURA" then code = "A";
ELSE IF upcase(Model) = "AUDI" then code = "AB";
ELSE IF upcase(Model) = "BMW" then code = "B";
ELSE IF upcase(Model) = "BUICK" then code = "C";
datalines;
Acura SUV Asia 36945 265 4451 189
ACURA Sedan Asia 23820 200 2778 172
Audi Sedan Europe 42490 220 3814 180
AUDI Sedan Europe 44240 220 4013 180
BMW Sedan Europe 28495 184 3219 176
bmw Sedan Europe 30795 184 3197 177
Buick Sedan USA 22180 175 3353 195
buick Sedan USA 26470 205 3567 200
;
run;


proc print data = if_statement;
run;


Data cla;
set sashelp.class;
if age > 14;
run;

/*Create SAS data set from the cars raw data given below:
   Data for one observation is spread over 3 lines:
   Line 1: Make
   Line 2: Model (contains embedded blanks)
   Line 3: Type, Origin, MSRP   
Try using different techniques to process this data.*/
  
  
data assign151;
input # 1 Make  $ #2  Model & $30.  #3 Type $ Origin $ Msrp:dollar7.; 
datalines;
Acura
MDX 
SUV Asia $36,945
Acura
RSX Type S 2dr 
Sedan Asia $23,820
Acura 
TSX 4dr 
Sedan Asia $26,990
Audi 
A4 3.0 convertible 2dr 
Sedan Europe $42,490
Audi 
A4 3.0 Quattro convertible 2dr 
Sedan Europe $44,240
Audi 
A6 2.7 Turbo Quattro 4dr 
Sedan Europe $42,840
Audi 
A6 4.2 Quattro 4dr 
Sedan Europe $49,690
Audi 
A8 L Quattro 4dr 
Sedan Europe $69,190
Audi 
TT 1.8 Quattro 2dr (convertible) 
Sports Europe $37,390
Audi 
TT 3.2 coupe 2dr (convertible) 
Sports Europe $40,590
BMW 
X5 4.4i 
SUV Europe $52,195
BMW 
325i 4dr 
Sedan Europe $28,495
BMW 
325Ci 2dr 
Sedan Europe $30,795
;
run;



/*Create SAS dataset from sashelp.class. Create new variable: Group*/


data assignment152;
	set sashelp.class;
	If      age in (11, 13, 15) then Group = 'A';
	Else If age in(12,14,16) then Group = 'B';
run;


/*Create a SAS dataset from sashelp.heart with subjects having 
status = 'Alive' and bp_status = 'Normal'. */

data assignment1522;
	set sashelp.heart;
	if status= "Alive" and bp_status = "Normal";
run;

Proc sql;
select *
from sashelp.heart
where status = "Alive" and bp_status = "Normal";
run;

/*Create SAS dataset from the following raw data. 
   Variables: 
   Make Type Origin MSRP
   The value of origin may contain embedded blanks.*/
  
  
data assignment1504;
input Make $ Model $ Origin $ Msrp;
	If Origin = "Asia"        then Group = "A";
	Else if Origin = "Europe" then Group = "E";
	ELse if Origin = "Usa"    then Group = "U";

datalines;
Acura SUV Asia 36945 
Acura Sedan Asia 23820 
Audi Sports Europe 37390 
Audi Sports Europe 40590 
Audi Wagon Europe 40840 
BMW Sedan Europe 54995 
BMW Sedan Europe 69195 
Buick Sedan Usa 22180 
Buick Sedan Usa 26470 
;
run;


/*Where clause*/
data whee;
set sashelp.heart;
where sex = "Female";
run;


Data cla;
set sashelp.class;
where age between 12 and 14;
run;

/*where contains*/
Data cla;
set sashelp.class;
where name contains "U";
run;

/*Like operators*/
Data clas;
set sashelp.class;
where name like 'J_n%';
run;


Data clas;
set sashelp.class;
where name like 'R_n%';
run;


Data clas;
set sashelp.class;
where name like '____';
run;

Data class;
set sashelp.class;
where name like '%y';
run;

Data class;
set sashelp.class;
where name like 'J%';
run;


data class;
length group $ 4;
set sashelp.class;
	select;
	when (11 <=age <= 13) group = "Pre";
	when (14 <=age <= 15) group = "Post";
	otherwise             group = "Sec";
	end;
run;


data class;
set sashelp.class;
	select (sex);
	when ('F') group ='F';
	when  ('M') group = 'M';
	end;
run;

/*Double trailing line - @ line Hold speicifer*/
data se;
input gender $ sex $ age @@;
datalines;
F f 11 f f 11
f f 11 f f 11
;
run;


proc print data = se;
title 'Double trailing line holder';
run;


Data Readit;
input @6 Type $1. @;
if type = '1' then input age 1-2;
else if type = '2' then input age 3-4;
datalines;
23   1
  44 2
;
run;

/*If we want to put the marks at the end of the table, we can simply use input afrer subject*/
data single_trin;
input type marks @;
if type = '1' then subject = 'science';
else if type = '2' then subject = 'Maths';
datalines;
1 55
2 66
1 77
2 88
;
run;

proc print data = single_trin;
title 'Marks in Maths and science';
run;

data single_trin;
input type  @;
if type = '1' then do subject = 'science';  input marks; end;
else if type = '2' then do subject = 'Maths'; input marks; end;
datalines;
1 55
2 66
1 77
2 88
;
run;


data int;
input rollno @;
input mark  @;
output;
input mark  @;
output;
input mark @;
output;
datalines;
01 44 44 66
02 33 45 56 
03 44 55 66 
;
run;


data intt;
input rollno @;
	do maths = 1 to 3;
	input marks @;
	output;
end;
datalines;
01 44 44 66
02 33 45 56 
03 44 55 66 
;
run;


/*@13 reading hierechy files*/

[8:13 pm] Prafulla Kudale (Guest)
 A A001 John   
 NEFT 20000
 B IMPS 30000
 A A002 David      
 B IMPS 10000
 B AEPS  5000
 A A003 Alan
 B AEPS 30000
 B NEFT 50000
 A A004 Mary  
 B NEFT 35000 
;

data billing(drop=type);
	infile datalines;
	Retain ID name;
	input type $1 @;
if type = "A" then input @3 id 4. @8 name $13.;
else if type = "B" then input @3 date mmddyy8. @12 Amount comma5.1;
if type = "A" then delete;
format date mmddyy8. amount dollar7.2;
	datalines;
A 9854 Smith Cannses
B 01-08-97 $44.0
B 01-17-97 $36.5
A 1096 Ashwin Jack
B 01-09-97 $14.5
;

run;

/*Process the following hierarchical data to create a SAS dataset*/

data hier(drop = type);
infile datalines;
input type $ @;
Retain ID Name;
	if type = 'A' then input @3 ID 4. @8 Name $6.;
	else if type = 'B' then input @3 Depart $5. @9 Salary dollar5.;
If type = 'A' then delete;

datalines;
A 1101 James 
B SALES 50000
A 1201 Robert 
B HR    60000
A 1103 Jane 
B SALES 70000
;

run;

Proc print data = hier;
title 'Employees Details';
run;

/*Single Trailing @*/
data dat97;
infile datalines;
input Id @;
input mark @;
output;
input mark @;
output;
input mark @;
output;

datalines;
01 45 37 45
02 47 46 43
03 30 45 33
;
run;


/*Single Trailing*/
data dat97;
infile datalines;
input Id @;
	do maths = 1 to 3;
		input marks @;
		output;
	end;
	
datalines;
01 45 37 45
02 47 46 43
03 30 45 33
;
run;

/*double trailing*/
data double;
infile datalines;
input   Make $ Type $  MSRP: dollar7. @@;
format MSRP dollar7.;
datalines;
Acura  SUV     $36,945  Acura Sedan $23,820
Acura  Sedan   $26,990  Acura Sedan $33,195
Acura  Sedan   $43,755  Acura Sedan $46,100
Acura  Sports  $89,765  Audi  Sedan $25,940
Audi   Sedan   $35,940  Audi  Sedan $31,840
Audi   Sedan   $33,430  Audi  Sedan $34,480
Audi   Sedan   $36,640  Audi  Sedan $39,640
Audi   Sedan   $42,490  Audi  Sedan $44,240
Audi   Sedan   $42,840  Audi  Sedan $49,690
Audi   Sedan   $69,190  Audi  Sedan $48,040
;
run;

proc contents data = double;
run;
/*Creating Variables */

data sum;
x = 1 + 2 + . + 3;
run;

data sum;
x = sum(1,2,.,3);
run;


data summ;
set sashelp.class;
new_age = sum(age + height);
run;



data h;
infile datalines;
input Type $ Age Height;
datalines;
A . 13
B 1 4
C . 1
;
run;

Data H_retain(drop = age);
set h;
Retain new_age 5;
If age ne . then new_age = age;
else age = new_age;
run;


/*do loop*/
data earned;
amount = 1200;
rate = 0.075/12;
	do month = 1 to 12;
	earned + (amount + earned) * rate;
	output;
	end;
run;
	
/*DO increment using by*/
data earned;
	amount = 1000;
	rate = .05;
	do month = 1 to 10 by 2;
	earned + (amount + earned) * rate;
	output;
	end;
run;

/*Do loop*/
data amount;
  amo = 10;
  do rate = 1, 2, 3;
  restult = amo * rate;
  output;
  end;
run;

data = var;
length day $9;
length i 3;
do day = 'Monday', 'Tuesday', 'Wednesday';
   i+1;
   des = 'day' || put(i, $1) || 'of the week is' || day;
   output;
end;
run;

data tes(keep=result);
x = 10;
p1 = 1;
p2 = 3;
p3 = 4;
do i = p1, p2, p3;
	result = x * i;
	output;
end;
run;


/* do until */

data saving;
	income = 400000;
	DO until (saving >= 1000000);
	year + 1;
	saving + income * 0.5;
	saving + saving * 0.5;
	end;
run;
	
	
/* do while */

data saving;
	income = 67000;
	DO while (saving < 100000);
	year + 1;
	saving + income * 0.5;
	saving + saving * 0.5;
	end;
run;
	
	
proc print data = saving;
title 'No of years to save 1 crore rupee';
run;

	
data expenses;
	exp = 20000;
	wealth = 10000000;
	donation = 1000000;
	year = 0;
	do while (wealth > 0);
	year + 1;
	wealth + (- exp - donation);
	end;
run;


/*Creating Format using proc format permanently*/

proc format; 
	value $gender
	'M'= 'Male'
	'F' = 'Female'
	'' = 'Not Entered'
	other = 'Miscorded' ;
run;


libname forname '/home/u63059416/Format';

proc format library = forname; 
	value $gender
	'M'= 'Male'
	'F' = 'Female'
	'' = 'Not Entered'
	other = 'Miscorded' ;
run;

proc print data = sashelp.class;
format sex $gender. ;
run;

proc print data = sashelp.class;
run;

proc format library = forname;
	value age
	low - 12 = 'Child'
	12 - <20 = 'Teenager';
run;

proc format library = forname fmtlib;
run;

options fmtsearch= (forname, work);
proc print data = sashelp.class;
format age age. sex $gender.;
run;
 
data clss;
length sex $6;
set sashelp.class;
format age age. sex $gender.;
run;

/*Export file */
proc export data = sashelp.class
outfile = '/home/u63059416/Program/class.csv'
dbms = csv replace;
run;

/*Create different table using sql */
proc sql;
create table hi
as select name, height
from sashelp.class
where height > 60;
quit;

/*use of function in sas*/
data function;
input id  maths1 maths2 maths3;
avg = mean(maths1, maths2, maths3);
datalines;
01 45 37 45
02 47 46 43
03 30 45 33
;
run;


data function;
input id  maths1 maths2 maths3;
avg = mean(of maths1 - maths3);
datalines;
01 45 37 45
02 47 46 43
03 30 45 33
;
run;


data function;
input id  maths1 maths2 maths3;
avg = mean(maths1 - maths3);
datalines;
01 45 37 45
02 47 46 43
03 30 45 33
;
run;

data function;
input id  maths1 maths2 maths3;
	avg = mean(of maths1 - maths3);
	max = max(of maths1 - maths3);
	min = min(of maths1 - maths3);
	sum = sum(of maths1 - maths3);
datalines;
01 45 37 45
02 47 46 43
03 30 45 33
;
run;


data abs;
input x y z;
abs_x = abs(x);
abs_y = abs(y);
abs_z = abs(z);
datalines;
1 -2 -3
1 -2 -3
1 -2 -3
1 -2 -3
;
run;


/*function*/
data func;
input id  maths1 maths2 maths3;
	avg = mean(of maths1 - maths3);
	max = max(of maths1 - maths3);
	min = min(of maths1 - maths3);
	sum = sum(of maths1 - maths3);
	n_mark = n(of maths1 - maths3);
	std = std(of maths1 - maths3);
	var = var(of maths1 - maths3);
datalines;
01 45 37 45
02 47 46 43
03 30 45 33
;
run;

proc print data = func;
title 'Function of SAS';
run;


data round;
input var $ av1 av2;
	round_av = round(av1,0.01);
	round_av1 = round(av2);
	int = int(av1);
	int1 = int(av2);
datalines;
var1 4.255 4.666
var2 4.45 8.22
;
run;

proc print data = round;
title 'Round and InT function';
run;


/*Length function*/
data lenth;
set sashelp.class;
lenth_name = length(name);
l_of_sex = length(sex);
run;

proc print data = lenth;
title 'Length of each name';
run;


/*left function*/
data left;
var1 = 'mumbai';
var2 = '  mumbai';
	if left(var1) = left(var2) then
	put "both of them are same";
	else put "both of them are same";
run;

/*Assignment for formats*/

data ass51;
input Customer_id $ Account_type $ Average_Monthly_Balance;
datalines;
C1001 S 50000
C1002 C  8000
C1003 C  1000
C1004 S   500
C1005 C  2000
C1006 S  3000
C1007 C   500
C1008 C  2000
C1009 S  2500
C1010 C   900
;
run;

libname forname '/home/u63059416/Format';

Proc format library = forname; 
	value $id
	S = Saving_account
	C = Current_account
	;
run;

options fmtsearch = (forname) 
/*we need to give options after creating format to give instruction to sas to search format*/

proc print data = ass51;
format Account_type $id.;
run;



Proc format library = forname;
	value avgbal
	low - 2000 = "Balance less than MAB"
	 2000 = "Balance same as MAB"
	2000 - high = "Balance greater than MAB"
	;
run;

proc print data = ass51;
format  Average_Monthly_Balance avgbal.;
run;

proc format library = forname  fmtlib;
run;

data new;
set ass51;
	if Average_Monthly_Balance < 2000 then charge = 100;
run;


data ass52;
input Subject_id $	Population $ heart_rate;
datalines;
S1001 S  70
S1002 P  75
S1003 E  55
S1004 F  50
S1005 S 101
S1006 S  70
S1007 P  70
S1008 P 110
S1009 E  50
S1010 F 105
S1011 S 120
;
run;

proc format library = forname;
	Value $pop
	"S" = "Safety Analysis Set"
	"P"	= "Per Protocol Set"
	"E"	= "Enrolled Population Set"
	"F" = "Full Analysis Set"
	;
	value rate
	low - 59 =   "Clinically notable below normal value"
	60 - 100 = "Normal value"
    101 - high = "Clinically notable elevated value"
     ;
run;


proc print data = ass52;
format Population $pop. heart_rate rate. ;
run;

Proc format library = forname;
	value rate
	low - 59 =   "Clinically notable below normal value"
	60 - 100 = "Normal value"
    101 - high = "Clinically notable elevated value"
     ;
run;


options fmtsearch = (forname);
run;


Proc print data = ass52;
format heart_rate rate.;
run;


proc format library = forname fmtlib;
run;




/* Character format*/
/* trim function */

data trim;
str1 = "welcome to 			";
str2 = "SAS Programming";
str3 = trim(str1)|| '' || str2;
run;

/* substr function */

data trim2;
set trim;
var4 = substr(str1, 1,7);
var5 = substr(str2, 2, 5);
run;

/*this will replace character with previous character*/

data trim3;
set trim;
substr(str1, 3,2) = "cc";
run;


data mod;
set trim;
sat = "NEpal";
substr(str2, 1, 5) = sat;
run;



/* scan function */
data scan;
input empID $ empName & $20.;
firstname = scan(empname,1 );
lastname = scan(empname, 2);
l_name = scan(empname, -1);
f_name = scan(empname, 3);
datalines;
E1001 Willium Brown
E1002 Alfred Johnson
E1003 Jenny Gates
;
run;

data scan1;
input id $ name & $20.;
datalines;
E1001 Willium Brown
E1002 Alfred Johnson
E1003 Jenny Gates
;
run;


/*compress function */
data compres;
input name & $8. surname $;
comp1 = compress(name);
comp2 = compress(name || ' ' || surname);
datalines;
Hit esh  Pantha
Sha nti  Pantha
KEs hav  Pantha
;
run;

proc print data = compres;
run;

data test;
input branch_id name & $14. remit_type $ amount $ date_txn:mmddyy10. ;
new_amount = compress(amount, "$,");
num_amount = input(amount, dollar7.);
drop amount;
rename num_amount = amount;
datalines;
1001 John Brown  NEFT $20,000 11/25/2000
1001 David Thompson  IMPS $10,000 12/20/1990
1001 Alan Gore  AEPS $30,000 01/01/1960
1001 Mary D  NEFT $35,000 01/01/1959
;


data one;
input num $;
mul = num * 2;
datalines;
1111
;
run;

data test;
input branch_id name & $14. remit_type $ amount $ date_txn:$10. ;
new_amount = compress(amount, "$,");
num_amount = input(amount, dollar7.);
new_date = input(date_txn, mmddyy10.);



drop amount date_txn;
rename num_amount = amount;
rename date_txn = new_date;
datalines;
1001 John Brown  NEFT $20,000 11/25/2000
1001 David Thompson  IMPS $10,000 12/20/1990
1001 Alan Gore  AEPS $30,000 01/01/1960
1001 Mary D  NEFT $35,000 01/01/1959
;

proc print data = test;
format new_date date11.;
run;


/*put function*/


data test;
input branch_id name & $14. remit_type $ amount $ date_txn:$10. ;
new_amount = compress(amount, "$,");
num_amount = input(amount, dollar7.);
new_date = input(date_txn, mmddyy10.);

word_date = put(date_txn, worddate11.);

drop amount date_txn;
rename num_amount = amount;
rename date_txn = new_date;
datalines;
1001 John Brown  NEFT $20,000 11/25/2000
1001 David Thompson  IMPS $10,000 12/20/1990
1001 Alan Gore  AEPS $30,000 01/01/1960
1001 Mary D  NEFT $35,000 01/01/1959
;

proc print data = test;
format new_date date11.;
run;

data nm;
input num; 
word = put(num, 3);
datalines;
111
;
run;


/*input function */
data balance;
input acc_id $ balance_amount $;
datalines;
A1001 $10,000
A1002 $20,000
A1003 $30,000
;
run;


data balance1 (drop = balance_amount);
set balance;
bal_numeric = input(balance_amount, dollar7.);
run;


/*put function*/

data customer_data;
input cus_id $ date_registration;
datalines;
C1001 10001
C1002 10002
C1003 10003
;
run;


data cus_data;
set customer_data;
dat_reg = put(date_registration,date9.);
run;


data _null_;
set customer_data;
file '/home/u63059416/raw data.cus.txt';
put cus_id date_registration:date9.;
run;



/*Reading multiple dataset */

data data1;
input x $ y $;
datalines;
P Q
R S
T U
V X
;

data data2;
input a $ b $;
datalines;
a b 
c d
e f
;

data data3;
	set data1;
	set data2;
run;

/*Observation will be equal to the number of observation equal to smallest dataset */


/* when data set has same variables */

data data3;
input a $ b $;
datalines;
a b 
c d
e f
;

data data4;
input a $ b $;
datalines;
x y 
z x
c v
;

data d5;
	set data3;
	set data4;
run;

/*if the dataset has same variable, the new dataset will read only from the last data as shown in above example */




data s6;
input x y;
datalines;
1 2 
3 4 
8 9
;
run;

data s7;
input x $ y $;
datalines;
3 4
6 7
7 8
;
run;


data s8;
	set s6;
	set s7;
run;


data p1;
length x $10;
input x $;
datalines;
Jan
Feb
Dec
;
run;

data p2;
length x $10;
input x $;
datalines;
JunanJuly
July
AUgust
;
run;
 
 
data p3;
length x $10;
	set p1;
	set p2;
run;


/*the attributes will taken from 1st dataset but variable are taken from 2nd dataset */


data student;
input student_id $;
datalines;
s1001
s1002
s1003
s1004
;
run;

data meeting;
input date $ meeting_room;
datalines;
20MAR2022 1
21Mar2022 2
22Mar2022 3
23MAr2022 4
;
run;


data exam;
	set student;
	set meeting;
run;


/* concatenating */

data s6;
input x y;
datalines;
1 2 
3 4 
8 9
;
run;

data s7;
input x  y ;
datalines;
3 4
6 7
7 8
;
run;


data s8;
	set s6 s7;
run;



data c1;
input x y;
datalines;
1 2 
3 4 
8 9
;
run;

data c2;
input x y ;
datalines;
3 4
6 7
7 8
;
run;


data c3;	
	set c1 c2;
run;


/*interleaving*/

data student1;
set sashelp.class;
if sex = 'M';
run;

data student2;
set sashelp.class;
if sex = 'F';
run;

proc sort data=student1 out=new_student1;
by age;
run;

proc sort data=student2 out=new_student2;
by age;
run;


data student3;
	set new_student1  new_student2;
	by age;
run;



/*Match merching */


data heart1;
set sashelp.heart (obs= 50);
run;

proc print data = heart1;
run;

proc datasets library = work;
	modify heart1;
	index create bp_status;
run;


data heart;
set heart1;
by bp_status;
run;

proc print data = heart;
run;

data accounts;
input account_id  name & $14. ;
datalines;
1001 John Brown
1002 David Thompson
1003 Alan Gore 
1004 Mary D  
;

data txn;
input account_id remit_type $ amount:dollar7. date_txn:mmddyy10. ;
datalines;
1001 NEFT $20,000 11/25/2000
1002 IMPS $10,000 12/20/1990
1003 AEPS $30,000 01/01/1960
1004 NEFT $35,000 01/01/1959
1001 NEFT $25,000 12/25/2000
1003 AEPS $40,000 12/26/2000
1004 NEFT $75,000 01/01/2001
1002 IMPS $37,000 12/20/2001
; 

/* Sort the dataset by account_id*/
proc sort data=accounts out=sorted_accounts;
by account_id;
run;

proc sort data=txn out=sorted_txn;
by account_id;
run;

 /* Merge datasets by matching values of account_id */


data tran_history;
merge sorted_accounts sorted_txn;
by account_id;
run;

proc print data = tran_history;
format date_txn date9.;
run;

