clc
clear
%%
load('nCnE_tcells_g20.mat')
addpath('DERIVESTsuite')

V = cell(10,10);
D = cell(10,10);
H = cell(10,10);
err = cell(10,10);
robustness = zeros(5,5);

parfor nE = 1:10
    for nC= 1:10
        Func = @(x)dkl(x,ideal_dist,nE,nC);
        x = x_opt{nE,nC};
        [H{nE,nC},err{nE,nC}] = hessian(Func,x); 
%        [V{nE,nC},D{nE,nC}] = eig(H);
%        robustness(nE,nC) = sum(D{nE,nC}(:));
    end
end
save('Hessian_tcells_g20.mat','H','err')