% *** Mise en place du modèle par calcul formel ***

syms h Rc A1 B1 C1 D1 A2 B2 C2 D2;

Mh=[1 0;h 1];
M1=[A1 B1;C1 D1];
MRc=[1 Rc;0 1];
M2=[A2 B2;C2 D2];

Meq=Mh*M1*MRc*M2*Mh;

Aeq=Meq(1,1)
Beq=Meq(1,2)
Ceq=Meq(2,1)
Deq=Meq(2,2)
