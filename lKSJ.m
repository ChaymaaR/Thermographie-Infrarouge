%Calcul de la transform�e de laplace + normalisation
function [y]=inversnorme(tps,beta)
y=invlap('monocouche', tps,0,1e-9,beta);
y=y;
