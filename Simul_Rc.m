% *** Estimation du d�faut par m�thode inverse ***

global a la e

a=5e-5% Diffusivit� thermique du mat�riau
la=0.67     % Conductivit� thermique du mat�riau

e=4e-3      % Epaisseur du mat�riau
e1=1e-3     % Epaisseur du mat�riau 1
e2=e-e1     % Epaisseur du mat�riau 2

Rm=e/la     % R�sistance du mat�riau
Rc=1e-3     % R�sistance de contact entre les 2 mat�riaux
h=0         % Valeur du coefficient d'�change 

beta=[e2,Rc,h]  % Profondeur, r�sistance et coefficient d'�change

tc=e^2/a    % Temps caract�ristique du mat�riau sain  

t=[1/1000:1/1000:1]'*tc;

% Thermogramme arri�re sans d�faut 

ys_ar=Quadart(t,[e2,0,h]);
maxi=max(ys_ar);
ys_ar=ys_ar/maxi;

% Thermogramme arri�re avec d�faut

yd_ar=Quadart(t,[e2,Rc,h]);
yd_ar=yd_ar/maxi;

% Contraste face arri�re 

ycste_ar=Contraste_Ar(t,[e2,Rc,h]);

% Thermogramme avant sans d�faut 

ys_av=Quadavt(t,[e2,0,h]);
mini=min(ys_av);
ys_av=ys_av/mini;

% Thermogramme avant avec d�faut

yd_av=Quadavt(t,[e2,Rc,h]);
yd_av=yd_av/mini;

% Contraste face avant 

ycste_av=Contraste_Av(t,[e2,Rc,h]);

% Affichage des diff�rents thermogrammes

figure(1);
plot(t/tc,ys_ar,'b',t/tc,yd_ar,'r',t/tc,ycste_ar,'g');
title('d�faut � 75%')
legend('Thermogramme Sans D�faut','Thermogramme Avec D�faut','Constraste Face Arri�re')
xlabel('t^*=at/e^2')
ylabel('Thermogrammes normalis�s')

figure(2);
plot(t/tc,ys_av,'b',t/tc,yd_av,'r',t/tc,ycste_av,'g');
title('d�faut � 75%')
legend('Thermogramme Sans D�faut','Thermogramme Avec D�faut','- Constraste Face Avant')
xlabel('t^*=at/e^2')
ylabel('Thermogrammes normalis�s')

% Identification des param�tres 

% Face Arri�re
% la_d=
deltaTm_av = 0,1901;
Tm=0,15;
Rc=0,15;
Rm = e/la;
ed=la_d*Rc*Rm;






% Ident_Rc;
