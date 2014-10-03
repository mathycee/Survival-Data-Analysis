********************************09-30-2014 X.CHAI********************************;
proc import out=work.whas500
	datafile="C:\Users\xchai\Desktop\whas500.xls"
	dbms=xls;
	getnames=yes;	
run;

***Compute hazard ratio for gender at 5 BMI levels, alpha set to 0.1***;
proc phreg data=work.whas500 alpha=0.1;
class gender;
model lenfol*fstat(0)=gender|bmi;
hazardratio 'Effect of 5-unit change in bmi' gender / at (bmi=(15 20 25 30 35)) units=5;
run;
*****************************END 09-30-2014 X.CHAI******************************;
