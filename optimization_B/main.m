clc
clear

%% Data

%loading the Ideal Distribution
ideal_dist = load('tcells_20GMM.txt');
ideal_dist = (ideal_dist/(sum(ideal_dist)))';
Nmax = numel(ideal_dist);

% Fixing nE and nC
nE = 1:25;
nC = 1:10;

%% Calculation 
for  i = 1:25
    for j=1:10
       [D_KL(i,j),x_opt{i,j}] = psimin_v2(ideal_dist,nE(i),nC(j));
       save('nCnE_tcells_g20.mat')
    end
end






