dm 'log;clear;output;clear'; 
ods html close; ods html style=minimal body='Assignment 07 example.html'; 
ods graphics on; 
options nodate nocenter pageno=1 ls=90 ps=56;
ODS listing;   

************************************;
*** Samir Prasun              ***;
*** EXST 700X t-test Examplea    ***;
**********************************************************************;


title1 "Examples of t-tests"; 

***************************************;
*** First Example: Paired t-test    ***;
***************************************;

title2 "The paired t-test - Car's mileage"; 
data mileage; 
   INFILE 'datatab_5_15.txt' missover firstobs=2;
	  input car_no_  wo_mpg  with_mpg;
	  diff = with_mpg - wo_mpg; 
datalines; run;
;
run;

*proc print data=mileage; run;

proc univariate data=mileage plot normal CIBasic; 
   Title3 'Paired t-test with proc univariate';
   TITLE4 'Two-tailed hypothesis'; 
   var diff;
   ods exclude extremeobs quantiles; 
run;

PROC ttest data=mileage sides=u; 
   VAR diff;
   TITLE3 'Paired t-test with Proc TTEST'; 
   TITLE4 'One-tailed hypothesis'; 
   TITLE5 'Testing a difference calculated in the data step'; 
RUN;

PROC ttest data=mileage sides=u; 
   paired with_mpg * wo_mpg;
   TITLE3 'Paired t-test with Proc TTEST'; 
   TITLE4 'One-tailed hypothesis'; 
   TITLE5 'Alternative to testing a calculated difference'; 
RUN;

***************************************;
*** Second Example: Paired t-test   ***;
***************************************;

title2 "The one-sample t-test - Car's mileage"; 
data InfantWt; 
   INFILE 'InfantWt.txt' missover firstobs=2;
	  input weight;
datalines; 
;
run;

*proc print data=InfantWt; run;

PROC ttest data=InfantWt H0=7.5 sides=L; 
   TITLE3 'One-sample one-tailed t-test with Proc TTEST'; 
   VAR weight;
RUN;

proc univariate data=InfantWt plot normal; 
   Title4 'Test of normality with proc univariate';
   var weight;
   ods exclude BasicMeasures ExtremeObs ExtremeValues Modes
     Moments MissingValues Quantiles TestsForLocation; 
run;

ods html close; 
