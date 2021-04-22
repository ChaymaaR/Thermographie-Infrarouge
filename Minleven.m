function [y]=minleven(texp,beta);

   global e yexpn fonction affichage beta_minleven;
   
   yexp=yexpn;
      
   beta=abs(beta);
   
%   if beta(1)>e,
%       beta(1)=e/20;
%   end
   
   beta_minleven=beta;
      
   yi=feval(fonction,texp,beta);
   
%   if size(yexp)~=[length(yexp) 1],
%      yexp=yexp';
%	end;

%	if size(yi)~=[length(yexp) 1],
%		yi=yi';
%	end;

   % *** Intervalle d'identification ***
   
   deb=1;
   n=length(texp);
   
   % *** Calcul de la norme ***
   
   yinorm=yi(deb:n);
   yexpnorm=yexp(deb:n);
   norme=(yinorm-yexpnorm)'*(yinorm-yexpnorm);
   
   plot(texp,yexp,texp,yi,'--');
  
  titre='';
  
		for i=1:length(beta),
			titre=[titre,'  ',num2str(beta(i))];
      end;
      
      titre=[titre '   ',num2str(norme)];
      
      title(titre);
		grid;
		drawnow;
	end;
% pause
	y=yi;
 
