clc
clear
%%

nt{1} = '../../Data/Diversity/Residence_time/nC_count_sigma20.mat';
nt{2} = '../../Data/Diversity/Residence_time/nC_count_sigma90.mat';
nt{3} = '../../Data/Diversity/Residence_time/nC_count_sigma120.mat';
nt{4} = '../../Data/Diversity/Residence_time/nC_count_sigma150.mat';
nt{5} = '../../Data/Diversity/Residence_time/nC_count_sigma180.mat';
nt{6} = '../../Data/Diversity/Residence_time/nC_count_sigma240.mat';
nt{7} = '../../Data/Diversity/Residence_time/nC_count_sigma360.mat';

%% Figure 7b Diversity vs Residence time 
% Ne = 10, Nc = 4, various values of sigma 
% Cleaning up the noise in the data by taking the convex hull of Diversity and Log(mu)

% sigma = 20/Ns
load(nt{1})
Div1 = squeeze(D_KL(5,4,1,:));
conv_ind = convhull(log(mu'),Div1);
Div1_interp = interp1(conv_ind(1:end-1),Div1(conv_ind(1:end-1)),1:20,'linear');

% sigma = 90/Ns
load(nt{2})
Div2 = squeeze(D_KL(5,4,1,:));
conv_ind = convhull(log(mu'),Div2);
Div2_interp = interp1(conv_ind(1:end-1),Div2(conv_ind(1:end-1)),1:20,'linear');

% sigma = 120/Ns
load(nt{3})
Div3 = squeeze(D_KL(5,4,1,:));
conv_ind = convhull(log(mu'),Div3);
Div3_interp = interp1(conv_ind(1:end-1),Div3(conv_ind(1:end-1)),1:20,'linear');

% sigma = 150/Ns
load(nt{4})
Div4 = squeeze(D_KL(5,4,1,:));
conv_ind = convhull(log(mu'),Div4);
Div4_interp = interp1(conv_ind(1:end-1),Div4(conv_ind(1:end-1)),1:20,'linear');

% sigma = 180/Ns
load(nt{5})
Div5 = squeeze(D_KL(5,4,1,:));
conv_ind = convhull(log(mu'),Div5);
Div5_interp = interp1(conv_ind(1:end-1),Div5(conv_ind(1:end-1)),1:20,'linear');

% sigma = 240/Ns
load(nt{6})
Div6 = squeeze(D_KL(5,4,1,:));
conv_ind = convhull(log(mu'),Div6);
Div6_interp = interp1(conv_ind(1:end-1),Div6(conv_ind(1:end-1)),1:20,'linear');

% sigma = 360/Ns
load(nt{7})
Div7 = squeeze(D_KL(5,4,1,:));
conv_ind = convhull(log(mu'),Div7);
Div7_interp = interp1(conv_ind(1:end-1),Div7(conv_ind(1:end-1)),1:20,'linear');

% residence time in units of 1/R_min
res_time = 1./mu;
res_time = res_time*0.018;


% Plot
figure()
semilogx(res_time,-Div1_interp,'-o','color','blue','LineWidth',2,'MarkerSize',10)
hold on
semilogx(res_time,-Div2_interp,'-o','color','red','LineWidth',2,'MarkerSize',10)
semilogx(res_time,-Div4_interp,'-o','color','magenta','LineWidth',2,'MarkerSize',10)
semilogx(res_time,-Div5_interp,'-o','color','green','LineWidth',2,'MarkerSize',10)
semilogx(res_time,-Div6_interp,'-o','color','cyan','LineWidth',2,'MarkerSize',10)


xlabel('Cisternal residence time (in R_{min}^{-1})','Fontsize',25)
ylabel('Diversity','Fontsize',25)
hleg = legend('\sigma = 20/N_S ','\sigma = 90/N_S ','\sigma = 150/N_S ','\sigma = 180/N_S','\sigma = 240/N_s')
set(hleg,'LineWidth',0.5)

ax = gca;
ax.Box = 'off';
ax.FontSize = 25;
ax.LineWidth = 2;
xlim([1e-2,1e3])
