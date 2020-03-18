dm 'log;clear;output;clear'; 
options nodate nocenter nonumber ls=90 ps=56
        nolabel FORMCHAR="|----|+|---+=|-/\<>*";
ODS listing;   
ods graphics on; 
ods html close; ods html style=minimal body='Lab 05 Output.html'; 

************************************;
*** Samir Prasun                 ***;
*** EXST 7005 Chi Square Example ***;
*******************************************************************************;



title1 "Laptop purchases"; 

******************************************;
*** Assignment 05:    Laptop purchases ***;
******************************************;

 
data Purchases; length Importance $ 15;
   INFILE 'LapTop Importance.csv' dlm=',' dsd missover firstobs=2;
	  input Brand $ Importance $ Respondents;
datalines; run;
;
run;

*proc print data=Purchases; run;

proc freq data=Purchases order=data; 
   Title3 'Two-way frequencies of Brand and Importance';
   table Brand * Importance;
run;

proc freq data=Purchases order=data; weight Respondents;
   Title3 'Two-way frequencies of Brand and Importance';
   table Brand * Importance;
run;

proc chart data=Purchases;
Title4 'Histogram (horizontal) of Brand and Importance';
hbar Importance / subgroup=Brand sumvar=Respondents 
midpoints = "NotAtAll" "Minimally" "Somewhat" "Important" "Most";
run;

proc freq data=Purchases order=data; weight Respondents;
   Title3 'Two-way frequencies of Brand and Importance';
   table Brand * Importance / norow nocol nopercent
                    chisq expected cellchi2;
run;

proc freq data=Purchases order=data; weight Respondents;
   Title3 'One-way frequencies of Brand';
   table Brand / chisq expected cellchi2;
run;
