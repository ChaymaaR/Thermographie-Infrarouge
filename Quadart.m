function [ft]=quadart(t,beta);

      ft=Invlap('Quadarp',t,0,1e-9,beta);
