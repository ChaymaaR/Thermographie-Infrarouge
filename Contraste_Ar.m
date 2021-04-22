function [ft]=Contraste_Ar(t,beta);

global a la e

e1=beta(1);
e2=e-e1;
Rc=beta(2);

if length(beta)==2,
    h=0;
else
    h=beta(3);
end    

% Thermogramme arrière sans défaut

ys_ar=Quadart(t,[e1,0,h]);
maxi=max(ys_ar);
ys_ar=ys_ar/maxi;

% Thermogramme arrière avec défaut

yd_ar=Quadart(t,[e1,Rc,h]);
yd_ar=yd_ar/maxi;

% Contraste face arrière 

ft=ys_ar-yd_ar;