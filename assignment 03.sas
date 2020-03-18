dm 'log;clear;output;clear'; 
ods html close; ods html;
options nodate nocenter pageno=1 ls=160 ps=56;

ods graphics on;
ODS listing;

title1 "EXST 700X Assignment 03"; 
title2 "Samir Prasun, SECTION 2"; 

***EXST 700X***********;
*** Assignment 03   ***;
*** Samir Prasun    ***;
*** SECTION 2       ***;
***********************;

data Happiness; 
   input RESPONDENT AGE SEX HAPPY TVHOURS;
   label happy='happyness index: 3=happiest'
         sex='1=male';
   
datalines;
1      41       1       2       0
 2      25       2       1       0
 3      43       1       2       4
 4      38       1       2       2
 5      53       2       3       2
 6      43       2       2       5
 7      56       2       2       2
 8      53       1       2       2
 9      31       2       1       0
10      69       1       3       3
11      53       1       2       0
12      47       1       2       2
13      40       1       3       3
14      25       1       2       0
15      60       1       2       2
16      42       1       2       3
17      24       2       2       0
18      70       1       1       0
19      23       2       3       0
20      64       1       1      10
21      54       1       2       6
22      64       2       3       0
23      63       1       3       0
24      33       2       2       4
25      36       2       3       0
26      53       1       1       2
27      26       2       2       0
28      89       2       2       0
29      65       1       1       0
30      45       2       2       3
31      64       2       3       5
32      30       2       2       2
33      75       2       2       0
34      53       2       2       3
35      38       1       2       0
36      26       1       2       2
37      25       2       3       1
38      56       2       3       3
39      26       2       2       1
40      54       2       2       5
41      31       2       2       0
42      44       1       2       0
43      36       2       2       3
44      74       2       2       0
45      74       2       2       3
46      37       2       3       0
47      48       1       2       3
48      42       2       2       6
49      77       2       2       2
50      75       1       3       0

; 
run;
proc print data=Happiness; 
   Title3 'Unsorted data listing';
run;
proc freq data=Happiness; 
   Title3 'Frequencies of sex and tvhours categories';
   table sex * tvhours;
run;
proc chart data=Happiness;
   Title3 'Horizontal bar chart of the variable TVHOURS';
   hbar tvhours;
run;
proc chart data=Happiness;
   Title3 'vertical bar chart of age';
   vbar age;
run;
proc chart data=Happiness;
   Title3 'Histogram (horizontal) of age categories';
   vbar age / midpoints= 20 to 80 by 10;
run;
proc chart data=Happiness;
   Title3 'A block chart';
   block happy / discrete group=sex;
run;

proc chart data=Happiness;
   Title3 'A pie chart';
   pie age/discrete;
run;
