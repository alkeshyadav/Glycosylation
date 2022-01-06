clc
clear

%%
addpath('../cbrewer') 
cmap = cbrewer('seq','RdPu',100);

nt{1} = '../../Data/OptimizationB/sensitivity/sensitivity_gmm201nE3.mat'; 
nt{2} = '../../Data/OptimizationB/sensitivity/sensitivity_gmm204nE5.mat'; 
nt{3} = '../../Data/OptimizationB/sensitivity/sensitivity_gmm206nE.mat';
nt{4} = '../../Data/OptimizationB/sensitivity/sensitivity_gmm207nE.mat';
nt{5} = '../../Data/OptimizationB/sensitivity/sensitivity_gmm208nE.mat';
nt{6} = '../../Data/OptimizationB/sensitivity/sensitivity_gmm209nE.mat';
nt{7} = '../../Data/OptimizationB/sensitivity/sensitivity_gmm2010nE.mat';
nt{8} = '../../Data/OptimizationB/nCnE_tcells_g20.mat'; 

load(nt{1});
D_complete = D;

load(nt{2});
D_complete = cat(1,D_complete,D(4:5,:,:));

load(nt{3});
D_complete = cat(1,D_complete,D(6,:,:));

load(nt{4});
D_complete = cat(1,D_complete,D(7,:,:));

load(nt{5});
D_complete = cat(1,D_complete,D(8,:,:));

load(nt{6});
D_complete = cat(1,D_complete,D(9,:,:));

load(nt{7});
D_complete = cat(1,D_complete,D(10,:,:));

load(nt{8});

%D_complete(2,8,9) = 1.1;

options = optimoptions(@fmincon,'algorithm','interior-point','Display','none');

for E = 1:10
   for C = 1:10
       

       
       sigma_min = x_opt{E,C}(end);
       sigma = linspace(sigma_min/5,2*sigma_min,10);
%       sigma     =  sort([sigma_min - (1:5)*0.01, sigma_min, sigma_min + (1:5)*0.01],'ascend');  
%       sigma     = sigma(sigma>=0);
       
        
       X = squeeze(D_complete(E,C,:));
       X = X(1:numel(sigma))
       index_finite = isfinite(X);
       X = X(index_finite);
       sigma = sigma(index_finite);
       [~,mI] = min(X);
       sigma_opt = sigma(mI);
       
       
       par_fun = @(c) c(1).*((sigma - sigma_opt).^2) + c(2);
       opt_fun = @(c) sum((par_fun(c) - X').^2); 
       c_min = [0,0];
       c_max = [inf,10];
       
       
       
       c0  = [10,1];
       
        
       [c_opt{E,C},Error(E,C)] = fmincon(opt_fun,c0,[],[],[],[],c_min,[],[],options);    
       curv(E,C) = c_opt{E,C}(1);
   end
end

curv = log(curv');
%curv(curv<=-1) = -1;

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


patch(x,y,curv(:),'EdgeColor','none')

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

print('Fig6d','-dpng','-r300')
