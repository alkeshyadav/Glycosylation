clc
clear
%%
load('../../Data/Hessian/Hessian_tcells_g20.mat')

addpath('../cbrewer') 
cmap_patch = cbrewer('seq','RdPu',100);

mu_range = 1;
R_range = 20;
L_range = 180;
sigma_range = 10;


%% Eigenvalue-eigenvector of the Normalized Hessian 
mu_stiffness = zeros(10,10);
R_stiffness = zeros(10,10);
L_stiffness = zeros(10,10);
sigma_stiffness = zeros(10,10);
for nE = 1:10
    for nC =1:10
        d = nC + 2*nE*nC +1;
        M = H{nE,nC};
        
        %Range of the optimization variable
        N = zeros(d,1);
        N(1:nC) = mu_range;
        N(nC+1:nC+nC*nE) = R_range;
        N(nC+nC*nE+1:end-1) = L_range;
        N(end) = sigma_range;

        %Normalization by range of the optimization variables 
        for i=1:d
            for j =1:d
                M(i,j) = N(i)*N(j)*M(i,j);
            end
        end

        % Eigenvalue Eigenvector Calculation
        [V,D] = eig(M);
        Eig = abs(diag(D));
        V = abs(V);
        stiffness = 0;
        for i = 1:d
            w =  V(:,i)/sum(V(:,i)); 
            stiffness = stiffness + w*Eig(i);
        end
        mu_stiffness(nE,nC) = sum(stiffness(1:nC));
        R_stiffness(nE,nC) = sum(stiffness(nC+1:nC+nC*nE));
        L_stiffness(nE,nC) = sum(stiffness(nC+nC*nE:nC+2*nC*nE));
        sigma_stiffness(nE,nC) = stiffness(end);
        
        
    end
end


xv1 = [1;1.8;1.8;1];
x = [];
for j=1:4
    xv = xv1 + j-1;
    for k = 1:10
        x = [x,xv];
    end
end

yv1 = [0.5;0.5;1.5;1.5];
y = [];
for j =  1:4
    for k = 1:10
        yv = yv1 + k-1;
        y = [y,yv];
    end
end
figure()

mu_stiffness = mu_stiffness(4,:);
R_stiffness = R_stiffness(4,:);
L_stiffness = L_stiffness(4,:);
sigma_stiffness = sigma_stiffness(4,:);
R = log10([mu_stiffness,R_stiffness,L_stiffness,sigma_stiffness]);

% Uncomment the following if varying Ne keeping Nc fixed

%R_stiffness = R_stiffness(:,3);
%L_stiffness = L_stiffness(:,3);
%sigma_stiffness = sigma_stiffness(:,3);

%R = log10([mu_stiffness;R_stiffness;L_stiffness;sigma_stiffness]);



patch(x,y,R,'EdgeColor','none')

ax = gca;
ax.Box = 'off';
ax.FontSize = 15;
ax.LineWidth = 2;

%xlabel('Eigenvector','Fontsize',25)
ylabel('N_C','Fontsize',25)
colormap(cmap_patch)
colorbar


ax.YTick = 1:2:10;
names = {'\langle\lambda\rangle_{\mu}'; '\langle\lambda\rangle_{R}';...
    '\langle\lambda\rangle_{l}'; '\langle\lambda\rangle_{\sigma}'};
set(gca,'xtick',[1.4,2.4,3.4,4.4],'xticklabel',names,'fontsize',25)

xlim([0.7,5])
ylim([0,11])

print('Fig6c','-dpng','-r300')

        