function [fp]=quadarp(p,beta);

global a la e

e1=beta(1);
e2=e-e1;
Rc=beta(2);

if length(beta)==2,
    h=0;
else
    h=beta(3);
end    

flag=0;
taille=size(p);

if taille(1)>taille(2),
	flag=1;
	p=p';
end;

k=sqrt(p/a);

A1=cosh(k*e1);
B1=sinh(k*e1)./(la*k);
C1=la*k.*sinh(k*e1);
D1=A1;

A2=cosh(k*e2);
B2=sinh(k*e2)./(la*k);
C2=la*k.*sinh(k*e2);
D2=A2;

Ceq=(h*A1+C1).*A2+((h*A1+C1)*Rc+h*B1+D1).*C2+((h*A1+C1).*B2+((h*A1+C1)*Rc+h*B1+D1).*D2)*h;
fp=1./Ceq;

if flag==1,
   fp=fp';
end;   


