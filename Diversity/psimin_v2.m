function[D_KL,x_opt] = psimin_v2(nE,nC,sigma,thres,sharp)
%global TauR_max TauT_max
options = optimoptions(@fmincon,'algorithm','sqp','Display','none');
warning('off')

nI       = 128;  
Nmax     = 180;
R_max    = 20;                               % Decision Variables Upper Bound initialisation
R_min    = 0.018;                                  % Decision Variables Lower Bound
l_max    = Nmax;
l_min    = 1;
mu_max   = 1;
mu_min   = 1/100;
xmin     = [mu_min*ones(nC,1);R_min*ones(nE*nC,1);l_min*ones(nE*nC,1)];
xmax     = [mu_max*ones(nC,1);R_max*ones(nE*nC,1);l_max*ones(nE*nC,1)];


D        = @(x) -count_func(x,nE,nC,sigma,thres,sharp);

x_opt_temp          = cell(nI,1);
D_KL_temp           = Inf*ones(nI,1);

X    =    genIntPop(R_min,R_max,mu_min,mu_max,l_min,l_max,nE,nC,nI); 

parfor oi =1:nI
    
    x_s = X(:,oi);
    
    try
            
        [x_opt_temp{oi},D_KL_temp(oi)] = fmincon(D,x_s,[],[],[],[],xmin,xmax,[],options);
    catch
        D_KL_temp(oi)  =  Inf;
        x_opt_temp{oi} = [];
        display('Bad Initial Point')
        
     end
end

[D_KL,J] = min(D_KL_temp);
x_opt    = x_opt_temp{J};
