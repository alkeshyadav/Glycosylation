%This function calculates the KL Divergence between the ideal distribution and the calculated distribution. 
%alpha is the enzyme specificty, l is the enzyme length vector and R is the Rate matrix. 
%mu is the flux

function [ D_kl ] = dkl(x,ideal_dist,nE,nC)

mu = x(1:nC);
R  = x(nC+1:nC+nE*nC);
l  = x(nC+nE*nC+1:end-1);
alpha = x(end);

N = numel(ideal_dist);
R = reshape(R,[nE,nC]);
l = reshape(l,[nE,nC]);



A = zeros(N,nC);
B = zeros(N,nC);


% Calculation of concentrations in first compartment
 A(1,1) =  mu(1)./(mu(1)+sum(R(:,1).*exp(-alpha.*abs(1-l(:,1)))));
c1(1,1) = A(1,1);
for k = 2:N-1
     A(1,k)  = (sum(R(:,1).*exp(-alpha.*abs(k-1-l(:,1)))))/(mu(1)+sum(R(:,1).*exp(-alpha.*abs(k-l(:,1)))));
     c1(k,1) =  A(1,k).*c1(k-1,1);
end
c1(N,1) = c1(N-1,1).*((sum(R(:,1).*exp(-alpha.*abs(N-1-l(:,1))))))/mu(1); 

% Calculation of concentrations in 2 to nC compartments
for j=2:nC
     B(j,1) = mu(j)./(mu(j)+sum(R(:,j).*exp(-alpha.*abs(1-l(:,j)))));
    c1(1,j) = B(j,1).*c1(1,j-1);
    for k = 2:N-1
        B(j,k)  = mu(j)./(mu(j)+sum(R(:,j).*exp(-alpha.*abs(k-l(:,j)))));
        A(j,k)  = (sum(R(:,j).*exp(-alpha.*abs(k-1-l(:,j)))))/(mu(j)+sum(R(:,j).*exp(-alpha.*abs(k-l(:,j)))));
        c1(k,j) = B(j,k).*c1(k,j-1) + A(j,k).*c1(k-1,j);
    end
    c1(N,j) = (mu(j)*c1(N,j-1) +  c1(N-1,j).*sum(R(:,j).*exp(-alpha.*abs(N-1-l(:,j)))))/mu(j);
end

% Calculation of KL Divergence using normalized concentrations of the last compartment
     c   = (c1(:,nC))';
       
     c   =  c/sum(c);                            % normalization
      
     p = find(ideal_dist>10^(-10));  % to avoid 0log(0) kind of expression
                            
   D_kl =  sum(ideal_dist(p).*(log2(ideal_dist(p)) - log2(c(p))));
   
   
end
