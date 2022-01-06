function [ x ] = genIntPop(Rmin,Rmax,mu_min,mu_max,lmin,lmax,sigma_min,sigma_max,nE,nC,nI)

rVar   = nE*nC;
lVar   = nE*nC;
muVar  = nC;
sigmaVar = 1;


p      = sobolset(muVar+rVar+lVar+ sigmaVar);
p      = scramble(p,'MatousekAffineOwen');
p      = (net(p,nI))';
%size(p)
r      = Rmin + (Rmax - Rmin)*p(1:rVar,:);
mu     = mu_min + (mu_max -mu_min)* p(rVar+1:rVar + muVar,:);
l      = lmin + (lmax-lmin)*p(rVar+muVar+1:end-1,:);
sigma  = sigma_min + (sigma_max - sigma_min)*p(end,:);
x      = [mu;r;l;sigma];

end

