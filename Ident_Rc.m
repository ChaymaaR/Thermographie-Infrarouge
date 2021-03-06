% *** Programme d'identification du d?faut ***

warning off;

% global a la e

global fonction yexpn beta_minleven;

% Donn?es du probl?me 

a=5e-7      % Diffusivit? thermique du mat?riau
la=2        % Conductivit? thermique du mat?riau
e=4e-3      % Epaisseur du mat?riau

Rm=e/la     % R?sistance du mat?riau
h=0         % Valeur du coefficient d'?change

tc=e^2/a;   % Temps caract?ristique

% Valeurs Initiales : betainit=[e1 - Rc - h] 

betainit=[e/2;1e-4];
    
% Courbe de contraste Exp?rimentale - Simul?e

texp=t;
yexpn=ycste_ar;

% Mod?le d'identification 

fonction='Contraste_Ar';
%fonction='Contraste_Av';

% Levenberg-Marquardt 

figure(3)
options=foptions;

betaols=betainit;
beta_minleven=zeros(size(betainit));

while (betaols~=beta_minleven),
    
    options=zeros(length(betainit),2);
    stol=1e-4;
    niter=100;
    wt=1;
    dp=1e-3*ones(size(betainit));
    dfdp='';
    options(:,1)=zeros(length(betainit),1);
    options(:,2)=1e-1*ones(length(betainit),1);
    
    [fcout,betaols]=leasqr(texp,yexpn,[betainit],'minleven',stol,niter,wt,dp,'dfdp',options); 		   	% Levenberg-Marquardt
    betainit=beta_minleven;
end;
    
% Calcul du contraste ? partir des param?tres estim?s;

if fonction=='Contraste_Ar',
    ythe=contraste_ar(texp,betaols);
end;

if fonction=='Contraste_Av',
    ythe=contraste_av(texp,betaols);
end;

% *** Affichage des R?sultats ***

residusols=yexpn-ythe;
plot(texp/tc,yexpn,'r',texp/tc,ythe,':',texp/tc,residusols*4-0.1,'-.');
axis([0 max(texp/tc) -0.2 1.2]);
xlabel('');
ylabel('Reduced Thermogram');
if fonction=='Contraste_Ar',
    title(['Contraste Face Arri?re : ' num2str(betaols')]);
end;
if fonction=='Contraste_Av',
    title(['Contraste Face Avant : ' num2str(betaols')]);
end;
grid;
drawnow;
