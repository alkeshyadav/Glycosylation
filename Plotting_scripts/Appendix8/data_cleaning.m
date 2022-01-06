clc
clear

%%
load('../../Data/Appendix8/minimas_nE1nC1.mat')
H = -sum(ideal_dist.*log(ideal_dist));
[d,I] = sort(D_KL,'ascend');
d11 = d/H;
fileID = fopen('Initial_conditions11.txt','w');
fprintf(fileID,'%12s \n',d11);

load('../../Data/Appendix8/minimas_nE1nC2.mat')
H = -sum(ideal_dist.*log(ideal_dist));
[d,I] = sort(D_KL,'ascend');
d12 = d/H;
fileID = fopen('Initial_conditions12.txt','w');
fprintf(fileID,'%12s\n',d12);

load('../../Data/Appendix8/minimas_nE2nC1.mat')
H = -sum(ideal_dist.*log(ideal_dist));
[d,I] = sort(D_KL,'ascend');
d21 = d/H;
fileID = fopen('Initial_conditions21.txt','w');
fprintf(fileID,'%12s\n',d21);

load('../../Data/Appendix8/minimas_nE2nC2.mat')
H = -sum(ideal_dist.*log(ideal_dist));
[d,I] = sort(D_KL,'ascend');
d22 = d/H;
fileID = fopen('Initial_conditions22.txt','w');
fprintf(fileID,'%12s\n',d22);
