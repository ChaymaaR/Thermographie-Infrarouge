function [ft]=quadavt(t,beta);
	
      ft=Invlap('Quadavp',t,0,1e-9,beta);
