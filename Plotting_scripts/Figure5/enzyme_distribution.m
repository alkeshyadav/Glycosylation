clc
clear
%%
addpath('../cbrewer') 
cmap = cbrewer('seq','RdPu',100);

nt{1} = '../../Data/OptimizationB/nCnE_tcells_g20.mat';
load(nt{1});

nE = 5; 
nC = 7;


%% Calculation of effective Rate R_{eff}

Rate = zeros(nC,179);
for j = nC:nC
    x = x_opt{nE,j};
    mu = x(1:j);
    R  = reshape(x(j+1:j+j*nE),[nE,j]);
    l  = reshape(x(j+j*nE+1:end-1),[nE,j]);
    sigma = x(end);
    
    for jj =1:j
        rate = zeros(179,1);
        for k =1:179
            for i = 1:nE
                rate(k) = rate(k) + R(i,jj) *  exp(- sigma*abs(l(i,jj)-k)); 
            end
        end
       Rate(jj,:) = rate/sum(rate);    
       Rate(jj,:) = rate; 
    end
end



%% Plotting 

% Patch 
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

% concentration in the final compartment and the target distribution
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

c_nC = concentration(x_opt{nE,nC},nE,nC);

% Plot

figure
subplot(1,4,[1,2])
patch(x,y,Rate(:),'EdgeColor','none')
colormap(cmap)
colorbar
title('(i)')
xlabel('Cisternal index, j','Fontsize',25)
ylabel('Reaction index, k','Fontsize',25)

xlim([0,8])
set(gca,'xtick',1:7)

ax = gca;
ax.Box = 'off';
ax.FontSize = 20;
ax.LineWidth = 2;

subplot(1,4,3)
patch(x1,y1,ideal_dist(:),'EdgeColor','none')
colormap(cmap)
colorbar
title('(ii)')
xlabel('Target glycan \newline      profile','Fontsize',25)
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
xlabel('Optimised glycan \newline         profile','Fontsize',25)
ylim([0,180])
ax = gca;
ax.Box = 'off';
ax.FontSize = 20;
ax.LineWidth = 2;

set(gca,'xtick',[])
set(gca,'ytick',[])
set(gcf, 'Position',  [0, 0, 2000, 1500])
 
%saveas(gcf,'Fig5a.jpg')