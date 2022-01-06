clc
clear
tic
%% Data
Nmax = 180;

% Defining Sigma
sigmaL = 1/Nmax;
sigmaH = 10/Nmax;
sigma  = sigmaL*(1:10:100) ;


%Defining threshold and sharpness
thres =  1/180;
sharp =  180;



% Fixing nE and nC
nE = [1,2,3,5];
nC = 1:10;
%% Calculation 

for  i = 1:1
    for j=1:10
        j
        for s=1:10
            [D_KL(i,j,s),x_opt{i,j,s}] = psimin_v2(nE(i),nC(j),sigma(s),thres,sharp);
        end
    end
end


%% Results
save('nC_count_thres0056_sharp05_sigma90.mat')
delete(gcp('nocreate'))
toc



