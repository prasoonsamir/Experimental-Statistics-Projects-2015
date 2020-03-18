dm 'log;clear;output;clear'; 
ods html close; ods html style=minimal body='Assign06.html'; 
ods graphics on; 
options nodate nocenter pageno=1 ls=90 ps=56;
ODS listing;   

***EXST 7005***************************;
*** Samir Prasun                 ***;
*** Assignment 06                   ***;
***  Multiple Observation input and ***; 
***  Confidence Interval Example    ***;


title1 "Assignment 06"; 

data POTATO (keep = TEMP Bur Ken Nor Rls) 
     uni (keep = TEMP Variety Pounds) ; 
   INFILE 'POTATO.csv' dlm=',' dsd missover firstobs=2;
	  input TEMP Bur Ken Nor Rls;
	  output POTATO;
      Pounds = Bur; Variety = 'Bur'; output uni;
	  Pounds = Ken; Variety = 'Ken'; output uni;
      Pounds = Nor; Variety = 'Nor'; output uni;
	  Pounds = Rls; Variety = 'Rls'; output uni;
datalines; run;
;
run;

title2 "Listing of Multiple observations per line"; 
proc print data=POTATO; run;
*proc print data=uni; run;

title2 "Proc means with class statement"; 
proc means data=uni n mean stderr; 
   class TEMP Variety; 
   Var Pounds;
run;

title2 "Proc means with BY statement and output"; 
proc sort data=uni; by TEMP Variety; run;
proc means data=uni noprint; by TEMP Variety;  
Var Pounds;
   output out = next1 n=n mean=mean var=var std=std stderr=stderror;
run;

title2 "Listing of means by TEMP and Variety"; 
proc print data=next1; 
run;

options ls=90 ps=48;
title2 "Plot of mean on TEMP and Variety"; 
proc plot data=next1; 
   plot mean*TEMP=Variety;
run;

PROC UNIVARIATE data=uni CIBASIC;
   VAR Pounds;
   ods exclude BasicMeasures ExtremeObs ExtremeValues Modes
               MissingValues Quantiles TestsForLocation; 
RUN;


