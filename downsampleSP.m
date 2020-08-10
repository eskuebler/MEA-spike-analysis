function Xds = downsampleSP(X,dsFactor,flag)

%downsample
[N TT] = size(X);
Xds = zeros(N,round(TT/dsFactor));
for n = 1:N
    k = 1;
    for t = 1:dsFactor:TT-dsFactor
        if flag==0
            Xds(n,k) = max(X(n,t:t+dsFactor));
        else
            Xds(n,k) = nanmean(X(n,t:t+dsFactor));
        end
        k = k+1;
    end
end