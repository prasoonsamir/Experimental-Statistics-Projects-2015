dm 'log;clear;output;clear'; 
options nodate nocenter pageno=1 ls=78 ps=55;
OPTIONS FORMCHAR="|----|+|---+=|-/\<>*";
ODS listing; ods graphics off; *ods noresults;

title1 "EXST 700X Assignment 02"; 
title2 "Samir Prasun, SECTION 2"; 

***EXST 700X***********;
*** Assignment 02   ***;
*** Samir Prasun    ***;
*** SECTION 2       ***;
***********************;

data Usedcars; 
   input COUNTRY $ MILEAGE PRICE MPG YEAR;
   label mileage='(thousand of miles)';
   
datalines;
JAPAN 80 5800 34 2004
USA 110 2800 23 2001
USA 75 5300 20 2004
JAPAN 92 6800 30 2005
GERMANY 87 6500 22 2001
USA 90 3000 25 2002
JAPAN 67 9000 33 2006
JAPAN 76 8500 32 2006
GERMANY 120 4200 20 1997
USA 89 3400 19 2000
USA 80 5500 24 2004
JAPAN 120 1500 28 1994
JAPAN 98 4000 30 2000
USA 85 3300 23 2001
GERMANY 115 4500 22 1999
USA 78 5200 21 2003
USA 90 3600 20 2002
JAPAN 115 4000 29 1998
JAPAN 85 7000 33 2005
;
run;
proc print data=Usedcars; var price mileage;
run;
proc sort data=Usedcars; by COUNTRY;
run;
proc print data=Usedcars;
run;
proc sort data=Usedcars; by PRICE MILEAGE;
run;
proc print data=Usedcars;
run;
proc sort data=Usedcars out=sasuser.sortedUsedcars; by  descending YEAR;
run;
proc print data=sasuser.sortedUsedcars;
run;
proc univariate data=sasuser.sortedUsedcars;
var price;
run;
proc means data=sasuser.sortedUsedcars;
class COUNTRY;
var MPG;
run;
