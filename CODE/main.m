 clc
clear all
close all
 N=80;
 rateline=[];
% x0=load('1dx3.txt');
  x0= linspace(0,1000,N)';
  y0=zeros(N,1);
%   h0=100*ones(N,1);
 H=100*ones(N,1);
 a=300;
 b=100;
%   mu = [a b];
% SIGMA = [0 0];
% gn=1000;
% e = mvnrnd(mu,SIGMA,gn);
%  x0=load('dx30.txt');
%  y0=load('dy30.txt');
for mm=1:12
 %secrecyline=[];
 
%for nn=5:10;
%     N=60;
    %nm=nn-4;
    %secrecyline=[];
v=20;
% H=100*ones(N,1);
%pr0=zeros(1800/v,1);
ps=1*ones(N,1);
%pr=[pr0;0.1*ones(N-1800/v,1)];
%gammar=10^8*pr;
 %x0= linspace(0,2000,N+2)';
%   x0= linspace(0,2000,N)';
  for ii=1:N
%       de_1=[];
%       for jj=1:gn
%           e_x=e(jj,1);
%           e_y=e(jj,2);
%           de_0=(x0(ii)-a)^2+(y0(ii)-b)^2+H(ii)^2;
%           de_1=[de_1,de_0];
%       end
      dd=(x0(ii)-900)^2+y0(ii)^2+H(ii)^2;
      de=(x0(ii)-a)^2+(y0(ii)-b)^2+H(ii)^2;
%       [de,index]=min(de_1);
%       ex=e(index,1);
%       ey=e(index,2);
      if(dd<de)
          break 
      end
  end
  pr0=zeros(ii,1);
  pr=[pr0;1*ones(N-ii,1)];
  gammar=10^(12.4-6)*pr;
 %y0=zeros(N+2,1);
%   y0=zeros(N,1);
cd D:\CVX\cvx
cvx_setup
n = 4*N-2;
cvx_begin
    variable x(n) nonnegative
 %    variable y(n) nonnegative 
%     expressions x(n) 
%      expressions y(n) 
 %     expressions gammas  RSL 
 %   kj=1+x
     gammas=10^(12.4-6)*ps;
    i=(2*N+1):(3*N-1);
    j=(3*N):(4*N-2);
    maximize(sum( x(i)-x(j)) )
    subject to
    for k=1:N-1
        m=1:k;
%      mu=H(m).^2
%      mn=x0(m).^2
%      mb=y0(m).^2
%      mv=mu+mn+mb
%       mi=((square(H(m))+square(x0(m))+square(y0(m))))
%       mj=(1+gammas(m)./((square(H(m))+pow_p(x0(m),2)+pow_p(y0(m),2))))
%       RSL=log(1+gammas(m)./((square(H(m))+pow_p(x0(m),2)+pow_p(y0(m),2))));
%       RDL=log(1+gammas(m)./((square(H(m))+square(x0(m)-2000)+square(y0(m)))));
%        REL=log(1+gammas(m)./(square(H(m))+square(x0(m)-1600)+square(y0(m))));
%        ASL=gammas(m)./(log(2)*(square(H(m))+square(x0(m))+square(y0(m))+gammas(m)).*(square(H(m))+square(x0(m))+square(y0(m))));
%        ADL=gammas(m)./(log(2)*(square(H(m))+square(x0(m)-2000)+square(y0(m))+gammas(m)).*(square(H(m))+square(x0(m)-2000)+square(y0(m))));
%        AEL=gammas(m)./(log(2)*(square(H(m))+square(x0(m)-1600)+square(y0(m))+gammas(m)).*(square(H(m))+square(x0(m)-1600)+square(y0(m))));
        RSL=log2(1+gammas(m)./(H(m).^2+(x0(m)-100).^2+y0(m).^2));
         RDL=log2(1+gammar(m)./(H(m).^2+(x0(m)-900).^2+y0(m).^2));
         REL=log2(1+gammar(m)./(H(m).^2+(x0(m)-a).^2+(y0(m)-b).^2));
         ASL=gammas(m)./((log(2)*(H(m).^2+(x0(m)-100).^2+(y0(m)).^2)+gammas(m)).*(H(m).^2+(x0(m)-100).^2+(y0(m)).^2));
         ADL=gammar(m)./((log(2)*(H(m).^2+(x0(m)-900).^2+(y0(m)).^2)+gammar(m)).*(H(m).^2+(x0(m)-900).^2+(y0(m)).^2));
          AEL=gammar(m)./((log(2)*(H(m).^2+(x0(m)-a).^2+(y0(m)-b).^2)+gammar(m)).*(H(m).^2+(x0(m)-a).^2+(y0(m)-b).^2));
%          AEL=gammar(m)./((log(2)*(H(m).^2+(x0(m)-1600).^2+(y0(m)-200).^2)+gammar(m)).*(H(m).^2+(x0(m)-1600).^2+(y0(m)-200).^2));
        %AEL=1./(15.*log(2)).*(3.*a^4.*gammar(m)+3.*a^3.*b.*gammar(m)+3.*a^2.*b^2.*gammar(m)+3*a*b^3.*gammar(m)+3*b^4.*gammar(m)-15*a^3*x0(m).*gammar(m)-15*a^2*b.*x0(m).*gammar(m)-15*a*b^2.*x0(m).*gammar(m)-15*b^3.*x0(m).*gammar(m)+30*a^2.*x0(m).^2.*gammar(m)+30*a*b.*x0(m).^2.*gammar(m)+30*b^2.*x0(m).^2.*gammar(m)-30*a.*x0(m).^3.*gammar(m)-30*b.*x0(m).^3.*gammar(m)+15.*x0(m).^4.*gammar(m) +10*a^2.*y0(m).^2.*gammar(m)+10*a*b.*y0(m).^2.*gammar(m)+10*b^2.*y0(m).^2.*gammar(m)-30*a.*x0(m).*y0(m).^2.*gammar(m)-30.*b.*x0(m).*y0(m).^2.*gammar(m)+30.*x0(m).^2.*y0(m).^2.*gammar(m)+15*y0(m).^4.*gammar(m)+10*a^2.*H(m).^2.*gammar(m)+10*a*b.*H(m).^2.*gammar(m)+10*b^2.*H(m).^2.*gammar(m)-30*a.*x0(m).*H(m).^2.*gammar(m)-30*b.*x0(m).*H(m).^2.*gammar(m)+30*x0(m).^2.*H(m).^2.*gammar(m)+30*y0(m).^2.*H(m).^2.*gammar(m)+15*H(m).^4.*gammar(m)+5*a^2.*gammar(m).^2+5*a*b.*gammar(m).^2+5*b^2.*gammar(m).^2-15*a*x0(m).*gammar(m).^2-15*b*x0(m).*gammar(m).^2+15*x0(m).^2.*gammar(m).^2+15*y0(m).^2.*gammar(m).^2+15*H(m).^2.*gammar(m).^2);
       BSL=2*(100-x0(m)).*ASL;
       BDL=2*(900-x0(m)).*ADL;
        BEL=2*(a-x0(m)).*AEL;
       %BEL=(1/(6*log(2)))*(-a^5.*gammar(m)-2*a^4*b.*gammar(m)-2*a^3*b^2.*gammar(m)-2*a^2*b^3.*gammar(m)-2*a*b^4.*gammar(m)-2*b^5*gammar(m)+12*a^4.*x0(m).*gammar(m)+12*a^3*b.*x0(m).*gammar(m)+12*a^2*b^2.*x0(m).*gammar(m)+12*b^3*a.*x0(m).*gammar(m)+12*b^3*b.*x0(m).*gammar(m)-30*a^3.*x0(m).^2.*gammar(m)-30*a^2*b.*x0(m).^2.*gammar(m)-30*b^2*a.*x0(m).^2.*gammar(m)-30*b^2*b.*x0(m).^2.*gammar(m)+40*a^2.*x0(m).^3.*gammar(m)+40*a*b.*x0(m).^3.*gammar(m)+40*b^2*x0(m).^3.*gammar(m)-30*a.*x0(m).^4.*gammar(m)-30*b.*x0(m).^4.*gammar(m)+12.*x0(m).^5.*gammar(m)-6*a^3.*y0(m).^2.*gammar(m)-6*a^2*b.*y0(m).^2.*gammar(m)-6*b^2*a.*y0(m).^2.*gammar(m)-6*b^2*b.*y0(m).^2.*gammar(m)+24*a^2.*x0(m).*y0(m).^2.*gammar(m)+24*a*b.*x0(m).*y0(m).^2.*gammar(m)+24*b^2.*x0(m).*y0(m).^2.*gammar(m)-36*a.*x0(m).^2.*y0(m).^2.*gammar(m)-36*b.*x0(m).^2.*y0(m).^2.*gammar(m)+24.*x0(m).^3.*y0(m).^2.*gammar(m)-6*a*y0(m).^4.*gammar(m)-6*b*y0(m).^4.*gammar(m)+12.*x0(m).*y0(m).^4.*gammar(m)-6*a^3*H(m).^2.*gammar(m)-6*a^2*b*H(m).^2.*gammar(m)-6*a*b^2*H(m).^2.*gammar(m)-6*b^3*H(m).^2.*gammar(m)+24*a^2*x0(m).*H(m).^2.*gammar(m)+24*a*b*x0(m).*H(m).^2.*gammar(m)+24*b^2*x0(m).*H(m).^2.*gammar(m)-36*a*x0(m).^2.*H(m).^2.*gammar(m)-36*b*x0(m).^2.*H(m).^2.*gammar(m)+24*x0(m).^3.*H(m).^2.*gammar(m)-12*a*y0(m).^2.*H(m).^2.*gammar(m)-12*b*y0(m).^2.*H(m).^2.*gammar(m)+24*x0(m).*y0(m).^2.*H(m).^2.*gammar(m)-6*a.*H(m).^4.*gammar(m)-6*b.*H(m).^4.*gammar(m)+12*x0(m).*H(m).^4.*gammar(m)-3*a^3*gammar(m).^2-3*a^2*b*gammar(m).^2-3*b^2*a*gammar(m).^2-3*b^2*b*gammar(m).^2+12*a^2*x0(m).*gammar(m).^2+12*a*b*x0(m).*gammar(m).^2+12*b^2*x0(m).*gammar(m).^2-18*a*x0(m).^2.*gammar(m).^2-18*b*x0(m).^2.*gammar(m).^2+12*x0(m).^3.*gammar(m).^2-6*a*y0(m).^2.*gammar(m).^2-6*b*y0(m).^2.*gammar(m).^2+12*x0(m).*y0(m).^2.*gammar(m).^2-6*a.*H(m).^2.*gammar(m).^2-6*b.*H(m).^2.*gammar(m).^2+12*x0(m).*H(m).^2.*gammar(m).^2);
       CSL=2*y0(m).*ASL;
       CDL=2*y0(m).*ADL;
        CEL=2*(b-y0(m)).*AEL;
       % CEL=(2/(15*log(2))*(3*a^4.*y0(m).*gammar(m)+3*a^3*b.*y0(m).*gammar(m)+3*a^2*b^2.*y0(m).*gammar(m)+3*a*b^3.*y0(m).*gammar(m)+3*b^4.*y0(m).*gammar(m)-15*a^3*x0(m).*y0(m).*gammar(m))-15*a^2*b*x0(m).*y0(m).*gammar(m)-15*b^2*a*x0(m).*y0(m).*gammar(m)-15*b^2*b*x0(m).*y0(m).*gammar(m)+30*a^2*x0(m).^2.*y0(m).*gammar(m)+30*a*b*x0(m).^2.*y0(m).*gammar(m)+30*b^2*x0(m).^2.*y0(m).*gammar(m)-30*a*x0(m).^3.*y0(m).*gammar(m)-30*b*x0(m).^3.*y0(m).*gammar(m)+15*x0(m).^4.*y0(m).*gammar(m)+10*a^2*y0(m).^3.*gammar(m)+10*a*b*y0(m).^3.*gammar(m)+10*b^2*y0(m).^3.*gammar(m)-30*a*x0(m).*y0(m).^3.*gammar(m)-30*b*x0(m).*y0(m).^3.*gammar(m)+30*x0(m).^2.*y0(m).^3.*gammar(m)+15*y0(m).^5.*gammar(m)+10*a^2*y0(m).*H(m).^2.*gammar(m)+10*a*b*y0(m).*H(m).^2.*gammar(m)+10*b^2.*y0(m).*H(m).^2.*gammar(m)-30*a*x0(m).*y0(m).*H(m).^2.*gammar(m)-30*b*x0(m).*y0(m).*H(m).^2.*gammar(m)+30*x0(m).^2.*y0(m).*H(m).^2.*gammar(m)+30*y0(m).^2.*y0(m).*H(m).^2.*gammar(m)+15*y0(m).*H(m).^4.*gammar(m)+5*a^2*y0(m).*gammar(m).^2+5*a*b*y0(m).*gammar(m).^2+5*b^2*y0(m).*gammar(m).^2-15*a*x0(m).*y0(m).*gammar(m).^2-15*b*x0(m).*y0(m).*gammar(m).^2+15*x0(m).^2.*y0(m).*gammar(m).^2+15*y0(m).^2.*y0(m).*gammar(m).^2+15.*y0(m).*H(m).^2.*gammar(m).^2);
      sum(x(2*N+m)-x(3*N-1+m))<=sum(RSL-ASL.*(square(x(m))+square(x(N+m)))-BSL.*x(m)-CSL.*x(N+m))-3.2%条件一
      x(2*N+k)<=RDL-ADL.*(square(x(m))+square(x(N+m)))-BDL.*x(m)-CDL.*x(N+m)%条件二
      x(3*N+k-1)<=REL-AEL.*(square(x(m))+square(x(N+m)))-BEL.*x(m)-CEL.*x(N+m)%条件三
      %if(k<N-1)
      kk=k+1;
     % end
      square(x0(kk)+x(kk)-x0(kk-1)-x(kk-1))+square(y0(kk)+x(N+kk)-y0(kk-1)-x(N+kk-1))<=v^2%条件五  
    end    
    square(x0(1)+x(1))+square(y0(1)+x(N+1))<=0
 %条件四
     square(1000-x(N)-x0(N))+square(0-x(N+N)-y0(N))<=0%条件六 
cvx_end
x0=x0+x(1:N);
y0=y0+x(N+1:2*N);
RDL=log(1+gammar./(H.^2+(x0-900).^2+y0.^2));
 REL=log(1+gammar./(H.^2+(x0-a).^2+(y0-b).^2));
secrecyrate=sum( RDL-REL)./N
rateline(mm)=secrecyrate;
 %secrecyline(nm)=secrecyrate; 

% secrecyrate=sum( x(i)-x(j))
%  secrecyline(nm)=secrecyrate;
% end 
end
 save gv20n80sline.txt rateline -ascii
 %save slinev20.txt rateline -ascii
% save x20.txt x0 -ascii 
% save y20.txt y0 -ascii
% save h20.txt h0 -ascii

% save 1dx50.txt x0 -ascii
% save 1dy50.txt y0 -ascii