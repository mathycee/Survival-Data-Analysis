********************************09-30-2014 X.CHAI********************************;
proc import out=work.whas500
	datafile="C:\Users\xchai\Desktop\whas500.xls"
	dbms=xls;
	getnames=yes;	
run;

***Survival functions for both genders when BMI=25 kg/m^2. CPH model of gender|bmi***;
data covs2;
input gender bmi;
cards;
0 25
1 25
;
run;
ods graphics on;
proc phreg data=work.whas500;
model lenfol*fstat(0)=gender|bmi;
baseline out=aa covariates=covs2 survival=s 
lower=lcl upper=ucl/alpha=0.1 rowid=gender group=gender ;
run;
ods graphics off;

proc gplot data=aa;
symbol1 color=red value=dot i=join;
symbol2 color=blue value=circle i=join;
plot s*lenfol=gender;
title 'Survival Function at BMI=25 kg/m^2';
run;
*****************************END 09-30-2014 X.CHAI******************************;
