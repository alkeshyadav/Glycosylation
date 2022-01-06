clear 
clc
%%

nt{1} = '../../Data/Diversity/nC_count.mat';
nt{2} = '../../Data/Diversity/nC_count_mu_2threshold.mat';
nt{3} = '../../Data/Diversity/nC_count_mu_4threshold.mat';
nt{4} = '../../Data/Diversity/nC_count_mu_8threshold.mat';

%% Figure 7a Diversity vs number of compartments  
%  for various values of sigma at optimal mu (the lower bound) and fixed Ne = 3 

load(nt{1})

% Cleaning the data by taking the convex hull of Diversity vs Nc
Div1 = squeeze(D_KL(2,:,1,1));
conv_ind = convhull(1:10,Div1);
Div1_interp = interp1(conv_ind(1:end-1),Div1(conv_ind(1:end-1)),1:10,'linear');

Div2 = squeeze(D_KL(2,:,2,1));
conv_ind = convhull(1:10,Div2);
Div2_interp = interp1(conv_ind(1:end-1),Div2(conv_ind(1:end-1)),1:10,'linear');

Div3 = squeeze(D_KL(2,:,3,1));
conv_ind = convhull(1:10,Div3);
Div3_interp = interp1(conv_ind(1:end-1),Div3(conv_ind(1:end-1)),1:10,'linear');


Div4 = squeeze(D_KL(2,:,4,1));
conv_ind = convhull(1:10,Div4);
Div4_interp = interp1(conv_ind(1:end-1),Div4(conv_ind(1:end-1)),1:10,'linear');

Div5 = squeeze(D_KL(2,:,5,1));
conv_ind = convhull(1:10,Div5);
Div5_interp = interp1(conv_ind(1:end-1),Div5(conv_ind(1:end-1)),1:10,'linear');

% Plotting 

figure()

plot(-Div1_interp,'-o','color','blue','LineWidth',2,'MarkerSize',10)
hold on
plot(-Div2_interp,'-o','color','red','LineWidth',2,'MarkerSize',10)
plot(-Div3_interp,'-o','color','magenta','LineWidth',2,'MarkerSize',10)
plot(-Div4_interp,'-o','color','green','LineWidth',2,'MarkerSize',10)
plot(-Div5_interp,'-o','color','cyan','LineWidth',2,'MarkerSize',10)

xlabel('Number of Compartments, N_C','Fontsize',25)
ylabel('Diversity','Fontsize',25)
hleg = legend('\sigma = 1/N_S','\sigma = 20/N_S ','\sigma = 40/N_S ','\sigma = 70/N_S','\sigma = 90/N_s')
set(hleg,'LineWidth',0.5)

xlim([1,10])
ax = gca;
ax.Box = 'off';
ax.FontSize = 25;
ax.LineWidth = 2;


%% Appendix 10 Figure 1 Threshold = 2/Ns
% Diversity vs Nc for fixed NE = 1 variuos sigma


load(nt{2})

% Cleaning the data by taking the convex hull of Diversity vs Nc
Div1 = squeeze(D_KL(1,:,1,1));
conv_ind = convhull(1:10,Div1);
Div1_interp = interp1(conv_ind(1:end-1),Div1(conv_ind(1:end-1)),1:10,'linear');

Div2 = squeeze(D_KL(1,:,2,1));
conv_ind = convhull(1:10,Div2);
Div2_interp = interp1(conv_ind(1:end-1),Div2(conv_ind(1:end-1)),1:10,'linear');

Div3 = squeeze(D_KL(1,:,3,1));
conv_ind = convhull(1:10,Div3);
Div3_interp = interp1(conv_ind(1:end-1),Div3(conv_ind(1:end-1)),1:10,'linear');


Div4 = squeeze(D_KL(1,:,4,1));
conv_ind = convhull(1:10,Div4);
Div4_interp = interp1(conv_ind(1:end-1),Div4(conv_ind(1:end-1)),1:10,'linear');

Div5 = squeeze(D_KL(1,:,5,1));
conv_ind = convhull(1:10,Div5);
Div5_interp = interp1(conv_ind(1:end-1),Div5(conv_ind(1:end-1)),1:10,'linear');

% Plotting 

figure()

plot(-Div1_interp,'-o','color','blue','LineWidth',2,'MarkerSize',10)
hold on
plot(-Div2_interp,'-o','color','red','LineWidth',2,'MarkerSize',10)
plot(-Div3_interp,'-o','color','magenta','LineWidth',2,'MarkerSize',10)
plot(-Div4_interp,'-o','color','green','LineWidth',2,'MarkerSize',10)
plot(-Div5_interp,'-o','color','cyan','LineWidth',2,'MarkerSize',10)

xlabel('Number of Compartments, N_C','Fontsize',25)
ylabel('Diversity','Fontsize',25)
hleg = legend('\sigma = 1/N_S','\sigma = 20/N_S ','\sigma = 40/N_S ','\sigma = 70/N_S','\sigma = 90/N_s')
set(hleg,'LineWidth',0.5)

xlim([1,9])
ax = gca;
ax.Box = 'off';
ax.FontSize = 25;
ax.LineWidth = 2;

%% Appendix 10 Figure 2 Threshold = 4/Ns
% Diversity vs Nc for fixed NE = 1 variuos sigma


load(nt{3})

% Cleaning the data by taking the convex hull of Diversity vs Nc
Div1 = squeeze(D_KL(1,:,1,1));
conv_ind = convhull(1:10,Div1);
Div1_interp = interp1(conv_ind(1:end-1),Div1(conv_ind(1:end-1)),1:10,'linear');

Div2 = squeeze(D_KL(1,:,2,1));
conv_ind = convhull(1:10,Div2);
Div2_interp = interp1(conv_ind(1:end-1),Div2(conv_ind(1:end-1)),1:10,'linear');

Div3 = squeeze(D_KL(1,:,3,1));
conv_ind = convhull(1:10,Div3);
Div3_interp = interp1(conv_ind(1:end-1),Div3(conv_ind(1:end-1)),1:10,'linear');


Div4 = squeeze(D_KL(1,:,4,1));
conv_ind = convhull(1:10,Div4);
Div4_interp = interp1(conv_ind(1:end-1),Div4(conv_ind(1:end-1)),1:10,'linear');

Div5 = squeeze(D_KL(1,:,5,1));
conv_ind = convhull(1:10,Div5);
Div5_interp = interp1(conv_ind(1:end-1),Div5(conv_ind(1:end-1)),1:10,'linear');

% Plotting 

figure()

plot(-Div1_interp,'-o','color','blue','LineWidth',2,'MarkerSize',10)
hold on
plot(-Div2_interp,'-o','color','red','LineWidth',2,'MarkerSize',10)
plot(-Div3_interp,'-o','color','magenta','LineWidth',2,'MarkerSize',10)
plot(-Div4_interp,'-o','color','green','LineWidth',2,'MarkerSize',10)
plot(-Div5_interp,'-o','color','cyan','LineWidth',2,'MarkerSize',10)

xlabel('Number of Compartments, N_C','Fontsize',25)
ylabel('Diversity','Fontsize',25)
hleg = legend('\sigma = 1/N_S','\sigma = 20/N_S ','\sigma = 40/N_S ','\sigma = 70/N_S','\sigma = 90/N_s')
set(hleg,'LineWidth',0.5)

xlim([1,9])
ax = gca;
ax.Box = 'off';
ax.FontSize = 25;
ax.LineWidth = 2;


%% Appendix 10 Figure 3 Threshold = 8/Ns
% Diversity vs Nc for fixed NE = 1 variuos sigma


load(nt{4})

% Cleaning the data by taking the convex hull of Diversity vs Nc
Div1 = squeeze(D_KL(1,:,1,1));
conv_ind = convhull(1:10,Div1);
Div1_interp = interp1(conv_ind(1:end-1),Div1(conv_ind(1:end-1)),1:10,'linear');

Div2 = squeeze(D_KL(1,:,2,1));
conv_ind = convhull(1:10,Div2);
Div2_interp = interp1(conv_ind(1:end-1),Div2(conv_ind(1:end-1)),1:10,'linear');

Div3 = squeeze(D_KL(1,:,3,1));
conv_ind = convhull(1:10,Div3);
Div3_interp = interp1(conv_ind(1:end-1),Div3(conv_ind(1:end-1)),1:10,'linear');


Div4 = squeeze(D_KL(1,:,4,1));
conv_ind = convhull(1:10,Div4);
Div4_interp = interp1(conv_ind(1:end-1),Div4(conv_ind(1:end-1)),1:10,'linear');

Div5 = squeeze(D_KL(1,:,5,1));
conv_ind = convhull(1:10,Div5);
Div5_interp = interp1(conv_ind(1:end-1),Div5(conv_ind(1:end-1)),1:10,'linear');

% Plotting 

figure()

plot(-Div1_interp,'-o','color','blue','LineWidth',2,'MarkerSize',10)
hold on
plot(-Div2_interp,'-o','color','red','LineWidth',2,'MarkerSize',10)
plot(-Div3_interp,'-o','color','magenta','LineWidth',2,'MarkerSize',10)
plot(-Div4_interp,'-o','color','green','LineWidth',2,'MarkerSize',10)
plot(-Div5_interp,'-o','color','cyan','LineWidth',2,'MarkerSize',10)

xlabel('Number of Compartments, N_C','Fontsize',25)
ylabel('Diversity','Fontsize',25)
hleg = legend('\sigma = 1/N_S','\sigma = 20/N_S ','\sigma = 40/N_S ','\sigma = 70/N_S','\sigma = 90/N_s')
set(hleg,'LineWidth',0.5)

xlim([1,9])
ax = gca;
ax.Box = 'off';
ax.FontSize = 25;
ax.LineWidth = 2;


