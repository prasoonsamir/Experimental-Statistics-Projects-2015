dm 'log;clear;output;clear'; 
ods html close; ods html; 
ods graphics on; 
options nodate nocenter pageno=1 ls=90 ps=56;
ODS listing;   


title1 "EXST 7005 Assignment 4"; 
title2 "Samir Prasun, Section 2"; 


***********************;
*** Assignment 04   ***;
***  Samir Prasun   ***;
*** Section 2       ***;
***********************;



Proc contents data=Bowfin_05; run;

data bowfin_06;
   INFILE 'Bowfin (2006).csv' dlm=',' dsd missover firstobs=2;
	  input Month Day Year Age Sex $ TL Wt;
datalines; run;
;
run;

*Proc contents data=bowfin_06; run;

data combined; set Bowfin_05 bowfin_06; 
      label Age = 'Age in years'
            TL = 'Total Length (mm)'
            Wt  = 'Weight (g)';
run;

*Proc contents data=combined; run;

*proc print data=combined; run;

proc plot data=Combined; plot Wt * TL = sex; 
   Title3 'Scatter plot';
run; 

proc freq data=Combined; 
   Title4 'Two-way frequencies of age and sex';
   table Age * Sex;
run;
proc sort data=combined; by Sex; run;
proc means data=combined; by Sex; var TL Wt; 
   Title4 'Proc MEANS by sex';
run;
proc chart data=Combined; 
   Title4 'Histogram (horizontal) of total lengths';
   Title5 'Sex specified as subgroup';
   hbar TL / midpoints=300 to 750 by 50 subgroup=sex;
run;

proc chart data=Combined; where sex eq 'F'; 
   Title4 'Histogram (horizontal) of total lengths';
   Title5 'WHERE statement used to plot females only';
   hbar TL / midpoints=300 to 750 by 50 subgroup=sex;
run;

proc means data=combined noprint; class Sex; 
   var TL; 
   Title4 'Proc MEANS OUTPUT classed by sex';
   output out=next01 n=n mean=mean min=min max=max median=median;
run;

proc print data=next01; run;




