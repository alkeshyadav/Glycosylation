clc
clear
%%
addpath('../cbrewer') 
nt{1} = '../../Data/OptimizationB/nCnE_tcells_g20.mat';
nt{2} = '../../Data/OptimizationB/nCnE_tcells_g3.mat';

entropy = @(x)-sum(x.*log2(x));

cmap = cbrewer('seq','RdPu',100);

%% Figure 4b DKl vs NE,NC for 20 GMM approx

load(nt{1})
ent = entropy(ideal_dist);
D = D_KL'/ent ; 

xv1 = [0.5;1.5;1.5;0.5];
x = [];
for j=1:25
    xv = xv1 + j-1;
    for i = 1:10
        x = [x,xv];
    end
end

yv1 = [0.5;0.5;1.5;1.5];
y = [];
for j =  1:25
    
    for k = 1:10
        yv = yv1 + k-1;
        y = [y,yv];
    end
end

figure()
patch(x,y,D(:),'EdgeColor','none')
pbaspect([1.2,1,1])
%axis fill
ax = gca;
ax.Box = 'off';
ax.FontSize = 15;
ax.LineWidth = 2;

xlabel('N_E','Fontsize',25)
ylabel('N_C','Fontsize',25)
colormap(cmap)
colorbar

ax.XTick = 1:2:25;
ax.YTick = 1:10;
xlim([0,26])
ylim([0,11])

print('Fig4b','-dpng','-r300')

clearvars -except nt entropy cmap

%% Figure 4a  DKL vs NE,NC for 3-GMM approx  

load(nt{2})
ent = entropy(ideal_dist);
D = D_KL/ent ; 

xv1 = [0.5;1.5;1.5;0.5];
x = [];
for j=1:10
    xv = xv1 + j-1;
    for i = 1:10
        x = [x,xv];
    end
end

yv1 = [0.5;0.5;1.5;1.5];
y = [];
for j =  1:10
    for k = 1:10
        yv = yv1 + k-1;
        y = [y,yv];
    end
end

figure()
patch(x,y,D_KL(:),'EdgeColor','none')

ax = gca;
ax.Box = 'off';
ax.FontSize = 15;
ax.LineWidth = 2;

xlabel('N_E','Fontsize',25)
ylabel('N_C','Fontsize',25)
colormap(cmap)
colorbar

ax.XTick = 1:10;
ax.YTick = 1:10;
ylim([0,11])
xlim([0,11])

print('Fig4a','-dpng','-r300')
