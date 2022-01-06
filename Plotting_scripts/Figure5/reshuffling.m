clc
clear
%%
addpath('../cbrewer') 
cmap = cbrewer('seq','RdPu',100);

nt{1} = '../../Data/OptimizationB/nCnE_tcells_g20.mat';

load(nt{1});
nE = 5; 
nC = 7;

%%Shuffling the rates 

x     = x_opt{nE,nC};
mu    = x(1:nC);
R_old = reshape(x(nC+1:nC+nC*nE),[nE,nC]);       
l_old = reshape(x(nC+nC*nE+1:end-1),[nE,nC]);
sigma = x(end);

% Re-shuffling the enzyme 
l = l_old(:,[1,4,3,2,5,6,7]);

% Reshuffling the Rates
R = R_old(:,[1,4,3,2,5,6,7]); 

% New R_{eff}
Rate = zeros(nC,179);
for j =1:nC
    rate = zeros(179,1);
    for k =1:179
        for i = 1:nE
            rate(k) = rate(k) + R(i,j) *  exp(- sigma*abs(l(i,j)-k)); 
        end
     end
Rate(j,:) = rate; 
end

%Old R_{eff}
Rate_old = zeros(nC,179);
for j =1:nC
    rate = zeros(179,1);
    for k =1:179
        for i = 1:nE
            rate(k) = rate(k) + R_old(i,j) *  exp(- sigma*abs(l_old(i,j)-k)); 
        end
     end
Rate_old(j,:) = rate; 
end

%% Patch plot

xv1 = [0.5;1.4;1.4;0.5];
x = [];
for j=1:nC
    xv = xv1 + j-1;
    for k = 1:179
        x = [x,xv];
    end
end

yv1 = [0.5;0.5;1.5;1.5];
y = [];

for j =  1:nC
    for k = 1:179
        yv = yv1 + k-1;
        y = [y,yv];
    end
end

Rate = Rate';
Rate_old = Rate_old';

% Concentration in the final compartment and the target distribution
xv1 = [0.5;1.4;1.4;0.5];
x1 = [];
for j=1:1
    xv = xv1 + j-1;
    for k = 1:180
        x1 = [x1,xv];
    end
end

yv1 = [0.5;0.5;1.5;1.5];
y1 = [];
for j =  1:1
    
    for k = 1:180
        yv = yv1 + k-1;
        y1 = [y1,yv];
    end
end

v_opt = [mu(:);R(:);l(:);sigma];
v_opt_old = [mu(:);R_old(:);l_old(:);sigma];
c_nC = concentration(v_opt,nE,nC);
c_nC_old = concentration(v_opt_old,nE,nC);

%% Plotting

figure
subplot(1,4,[1,2])
patch(x,y,Rate(:),'EdgeColor','none')
colormap(cmap)
colorbar
xlim([0,8])
xlabel('Cisternal index, j','Fontsize',25)
ylabel('Reaction index, k','Fontsize',25)
title('(i)')
ax = gca;
ax.Box = 'off';
ax.FontSize = 20;
ax.LineWidth = 2;
set(gca,'xtick',1:7)

subplot(1,4,3)
patch(x1,y1,c_nC_old(:),'EdgeColor','none')
colormap(cmap)
colorbar
title('(ii)')
xlabel('Optimised glycan \newline         profile','Fontsize',25)
ylim([0,180])
ax = gca;
ax.Box = 'off';
ax.FontSize = 20;
ax.LineWidth = 2;

set(gca,'xtick',[])
set(gca,'ytick',[])

subplot(1,4,4)
patch(x1,y1,c_nC(:),'EdgeColor','none')
colormap(cmap)
colorbar
title('(iii)')
xlabel('  Glycan profile after \newline enzyme repartioning','Fontsize',25)
ylim([0,180])
ax = gca;
ax.Box = 'off';
ax.FontSize = 20;
ax.LineWidth = 2;

set(gca,'xtick',[])
set(gca,'ytick',[])
