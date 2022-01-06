function[D_KL] = optimal_Dkl(nE,nC,sigma,ideal_dist,x_opt)
%global TauR_max TauT_max
options = optimoptions(@fmincon,'algorithm','sqp','Display','none');
warning('off')

nI       = 127;  
Nmax     = numel(ideal_dist);
R_max    = 20;                               % Decision Variables Upper Bound initialisation
R_min    = 0.018;                                  % Decision Variables Lower Bound
l_max    = numel(ideal_dist);
l_min    = 1;
mu_max   = 1;
mu_min   = 1/100;
xmin     = [mu_min*ones(nC,1);R_min*ones(nE*nC,1);l_min*ones(nE*nC,1)];
xmax     = [mu_max*ones(nC,1);R_max*ones(nE*nC,1);l_max*ones(nE*nC,1)];
TauT_max = 100;


D        = @(x)dklv2(x,ideal_dist,nE,nC,sigma);

%x_opt_temp          = cell(nI,1);  
D_KL_temp           = Inf*ones(nI,1);

X    =    genIntPop(R_min,R_max,mu_min,mu_max,l_min,l_max,nE,nC,nI); 

%size(X)
%size(x_opt)
X    = [X x_opt];

parfor oi =1:nI+1
    
    x_s = X(:,oi);
    
    try
            
        [~,D_KL_temp(oi)] = fmincon(D,x_s,[],[],[],[],xmin,xmax,[],options);
    catch
        D_KL_temp(oi)  =  Inf;
%        x_opt_temp{oi} = [];
        display('Bad Initial Point')
        
     end
end

[D_KL,~] = min(D_KL_temp);
%x_opt    = x_opt_temp{J};
