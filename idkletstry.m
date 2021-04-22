filename1='Ar_C.txt';
filename2='Av_C.txt';
filename3='Ar_UI.txt';
filename4='Av_UI.txt';
arc=load(filename1);
avc=load(filename2);
arui=load(filename3);
avui=load(filename4);

% % ADDELIE - SUIVI TEMPOREL ZONES
% % Moyenne
% % Version 1.19
% % 700SW  7°  1.8  NOF  AN R=5  L=26.50  MEUSONIC07_2000_94.ETA  
% % 01/01/1997  01:26:04.03  256 images 280 x 280
% % E=0.95  Te=22°C  Ta=22°C  D=0.6m
% % stockage1/1  
% % 
% % Unités	°C	mm
% % 1 [209.9,232.1][259.4,281.6]
% % 2 [355.0,105.8][402.8,148.5]
% % N°		1		2		


a1=(arc(:,3)-min(arc(:,3)));
a2=(arc(:,2)-min(arc(:,2)));
a3=-(a2-a1);
max(a3)
figure(1)
plot(arc(:,1),a1/(max(a2)));
hold on
plot(arc(:,1),a2/(max(a2)));
hold on
plot(arc(:,1),(a2-a1)/(max(a2)))
title('Thermogramme face arrière');
xlabel('temps (s)');
ylabel('Température (°C)');
legend('sans','avec','contraste');
figure(2)
plot(avc(:,1),(avc(:,3)-min(avc(:,3)))/(max(avc(:,2))));
hold on
plot(avc(:,1),(avc(:,2)-min(avc(:,2)))/(max(avc(:,2)))-(avc(:,3)-min(avc(:,3)))/(max(avc(:,2))));
hold on
plot(avc(:,1),(avc(:,2)-min(avc(:,2)))/(max(avc(:,2))))
title('Thermogramme face avant');
xlabel('temps (s)');
ylabel('Température (°C)');
legend('sans','contraste','avec');