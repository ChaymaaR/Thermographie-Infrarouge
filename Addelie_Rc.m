% *** Lecture d'un fichier Addélie pour traitement sous Matlab ***

load Test005.dat

time=Test005(:,1)';
y1=Test005(:,2)';
y2=Test005(:,3)';

figure(7)
plot(time,y1,'r.',time,y2,'b.')

ind1=66;
ind2=length(time);

t=(time(ind1+1:ind2)-time(ind1))*0.16;
y1b=y1(ind1+1:ind2)-mean(y1(1:ind1-1));
y2b=y2(ind1+1:ind2)-mean(y2(1:ind1-1));
y1n=y1b/max(y1b);
y2n=y2b/max(y2b);
ycste_ar=y2n-y1n;

figure(7)
plot(t,y1n,'r',t,y2n,'b',t,ycste_ar,'g')

t=t';
ycste_ar=ycste_ar';