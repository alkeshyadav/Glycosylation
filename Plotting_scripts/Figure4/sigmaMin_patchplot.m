clc
clear

%% 
addpath('../cbrewer') 
nt{1} = '../../Data/OptimizationB/nCnE_tcells_g3.mat';
nt{2} = '../../Data/OptimizationB/nCnE_tcells_g20.mat';

cmap = cbrewer('seq','RdPu',100);


%% Fig 4c Optimal Specificty for 3GMM approx

load(nt{1})

for i= 1:10
    for j = 1:10
        if numel(x_opt{i,j})~=0
            sigma_min(i,j) = x_opt{i,j}(end);
        end    
    end
end


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

patch(x,y,sigma_min(:),'EdgeColor','none')

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
xlim([0,11])
ylim([0,11])

print('Fig4c','-dpng','-r300')
clearvars -except nt cmap

%% Fig 4d Optimal Specificty for 20-GMM approx

load(nt{2})

for i= 1:10
    for j = 1:10
        if numel(x_opt{i,j})~=0
            sigma_min(i,j) = x_opt{i,j}(end);
        end    
    end
end


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
patch(x,y,sigma_min(:),'EdgeColor','none')

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
xlim([0,11])
ylim([0,11])

print('Fig4d','-dpng','-r300')
