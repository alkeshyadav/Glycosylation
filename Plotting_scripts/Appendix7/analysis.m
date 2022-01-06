clc
clear
%%

nt{1} = '../../Data/supp/nCnE_tcells_lb2_g20.mat';   
nt{2} = '../../Data/supp/nCnE_tcells_lb20_g20.mat';                              
nt{3} = '../../Data/supp/nCnE_tcells_lb80_g20.mat';

addpath('../cbrewer') 
cmap_patch = cbrewer('seq','RdPu',100);
entropy = @(x)-sum(x.*log2(x));

%% Appendix 7 Figure 1 lb = 2 

load(nt{1})
ideal_dist = ideal_dist(ideal_dist~=0);
ent = entropy(ideal_dist);
D_KL = D_KL'/ent ; 

xv1 = [0.5;1.5;1.5;0.5];
x = [];
for j=1:5
    xv = xv1 + j-1;
    for i = 1:5
        x = [x,xv];
    end
end

yv1 = [0.5;0.5;1.5;1.5];
y = [];
for j =  1:5
    
    for k = 1:5
        yv = yv1 + k-1;
        y = [y,yv];
    end
end

% Plot
figure()
patch(x,y,D_KL(:),'EdgeColor','none')

ax = gca;
ax.Box = 'off';
ax.FontSize = 15;
ax.LineWidth = 2;

xlabel('N_E','Fontsize',25)
ylabel('N_C','Fontsize',25)
colormap(cmap_patch)
colorbar

ax.XTick = 1:5;
ax.YTick = 1:5;
% xlim([0,26])
ylim([0,6])

print('NeNcSymmetry1','-dpng','-r300')

%% Appendix 7 Figure 2 lb = 20 

load(nt{2})
ideal_dist = ideal_dist(ideal_dist~=0);
ent = entropy(ideal_dist);
D_KL = D_KL'/ent ; 

xv1 = [0.5;1.5;1.5;0.5];
x = [];
for j=1:5
    xv = xv1 + j-1;
    for i = 1:5
        x = [x,xv];
    end
end

yv1 = [0.5;0.5;1.5;1.5];
y = [];
for j =  1:5
    
    for k = 1:5
        yv = yv1 + k-1;
        y = [y,yv];
    end
end

% Plot
figure()

patch(x,y,D_KL(:),'EdgeColor','none')

ax = gca;
ax.Box = 'off';
ax.FontSize = 15;
ax.LineWidth = 2;

xlabel('N_E','Fontsize',25)
ylabel('N_C','Fontsize',25)
colormap(cmap_patch)
colorbar

ax.XTick = 1:5;
ax.YTick = 1:5;
% xlim([0,26])
ylim([0,6])

print('NeNcSymmetry2','-dpng','-r300')

%% Appendix 7 Figure 3 lb = 80 

load(nt{3})
ideal_dist = ideal_dist(ideal_dist~=0);
ent = entropy(ideal_dist);
D_KL = D_KL'/ent ; 

xv1 = [0.5;1.5;1.5;0.5];
x = [];
for j=1:5
    xv = xv1 + j-1;
    for i = 1:5
        x = [x,xv];
    end
end

yv1 = [0.5;0.5;1.5;1.5];
y = [];
for j =  1:5
    
    for k = 1:5
        yv = yv1 + k-1;
        y = [y,yv];
    end
end

% Plot
figure()
patch(x,y,D_KL(:),'EdgeColor','none')

ax = gca;
ax.Box = 'off';
ax.FontSize = 15;
ax.LineWidth = 2;

xlabel('N_E','Fontsize',25)
ylabel('N_C','Fontsize',25)
colormap(cmap_patch)
colorbar

ax.XTick = 1:5;
ax.YTick = 1:5;
% xlim([0,26])
ylim([0,6])

print('NeNcSymmetry3','-dpng','-r300')
