function [TT, BB, b1, lb, ub, exitflag]=GH_LP_Opt(NBeta,n,EpsilonMax,b,a,M,alpha)
beta=1/NBeta*n;
epsilon=beta.*EpsilonMax;
b1=[alpha;-1;-epsilon];
BB=[ones(1,M);-ones(1,M);-b];
lb=zeros(M,1);
ub=ones(M,1);
opt_lin=optimset('Display','off','Algorithm','interior-point');
[TT,~,exitflag]=linprog(a',BB,b1,[],[],lb,ub,[],opt_lin);