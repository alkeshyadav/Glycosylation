function [D1,s1,D2,s2,D3,s3,D4,s4] = data_cleaning(mat_file)
%UNTITLED4 Summary of this function goes here
%Detailed explanation goes here

entropy = @(x)-sum(x.*log2(x)); 
S = load(mat_file);
D_KL = S.D_KL;
ideal_dist = S.ideal_dist;
sigma = S.sigma;

ent = entropy(ideal_dist);
D_KL = D_KL/ent;

D1 = squeeze(D_KL(1,:));
index_finite = isfinite(D1);
I = convhull((sigma(index_finite)),D1(index_finite));
D1 = D1(I);
s1 = sigma(I);

D2 = squeeze(D_KL(2,:));
index_finite = isfinite(D2);
I = convhull((sigma(index_finite)),D2(index_finite));
D2 = D2(I);
s2 = sigma(I);

D3 = squeeze(D_KL(3,:));
index_finite = isfinite(D3);
I = convhull((sigma(index_finite)),D3(index_finite));
D3 = D3(I);
s3 = sigma(I);

D4 = squeeze(D_KL(4,:));
index_finite = isfinite(D4);
I = convhull((sigma(index_finite)),D4(index_finite));
D4 = D4(I);
s4 = sigma(I);

end

