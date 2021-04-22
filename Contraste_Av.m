function [ft]=Contraste_Av(t,beta);

global a la e

e1=beta(1);
e2=e-e1;
Rc=beta(2);

if length(beta)==2,
    h=0;
else
    h=beta(3);
end    

% Thermogramme avant sans défaut 

ys_av=Quadavt(t,[e1,0,h]);
mini=min(ys_av);
ys_av=ys_av/mini;

% Thermogramme avant avec défaut

yd_av=Quadavt(t,[e1,Rc,h]);
yd_av=yd_av/mini;

% Contraste face avant 

ft=-(ys_av-yd_av);
