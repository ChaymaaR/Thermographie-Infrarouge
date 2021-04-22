% *** Estimation du défaut par méthode inverse ***

global a la e

a=5e-5% Diffusivité thermique du matériau
la=0.67     % Conductivité thermique du matériau

e=4e-3      % Epaisseur du matériau
e1=1e-3     % Epaisseur du matériau 1
e2=e-e1     % Epaisseur du matériau 2

Rm=e/la     % Résistance du matériau
Rc=1e-3     % Résistance de contact entre les 2 matériaux
h=0         % Valeur du coefficient d'échange 

beta=[e2,Rc,h]  % Profondeur, résistance et coefficient d'échange

tc=e^2/a    % Temps caractéristique du matériau sain  

t=[1/1000:1/1000:1]'*tc;

% Thermogramme arrière sans défaut 

ys_ar=Quadart(t,[e2,0,h]);
maxi=max(ys_ar);
ys_ar=ys_ar/maxi;

% Thermogramme arrière avec défaut

yd_ar=Quadart(t,[e2,Rc,h]);
yd_ar=yd_ar/maxi;

% Contraste face arrière 

ycste_ar=Contraste_Ar(t,[e2,Rc,h]);

% Thermogramme avant sans défaut 

ys_av=Quadavt(t,[e2,0,h]);
mini=min(ys_av);
ys_av=ys_av/mini;

% Thermogramme avant avec défaut

yd_av=Quadavt(t,[e2,Rc,h]);
yd_av=yd_av/mini;

% Contraste face avant 

ycste_av=Contraste_Av(t,[e2,Rc,h]);

% Affichage des différents thermogrammes

figure(1);
plot(t/tc,ys_ar,'b',t/tc,yd_ar,'r',t/tc,ycste_ar,'g');
title('défaut à 75%')
legend('Thermogramme Sans Défaut','Thermogramme Avec Défaut','Constraste Face Arrière')
xlabel('t^*=at/e^2')
ylabel('Thermogrammes normalisés')

figure(2);
plot(t/tc,ys_av,'b',t/tc,yd_av,'r',t/tc,ycste_av,'g');
title('défaut à 75%')
legend('Thermogramme Sans Défaut','Thermogramme Avec Défaut','- Constraste Face Avant')
xlabel('t^*=at/e^2')
ylabel('Thermogrammes normalisés')

% Identification des paramètres 

% Face Arrière
% la_d=
deltaTm_av = 0,1901;
Tm=0,15;
Rc=0,15;
Rm = e/la;
ed=la_d*Rc*Rm;






% Ident_Rc;
