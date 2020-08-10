%{
Wilcoxon Test Cumulative Distributions
%}

function P = wilcoxonCumul(x1,x2)

max_rx = max([x1 x2]);
min_rx = min([x1 x2]);
h1 = histc(x1,min_rx:max_rx/100:max_rx);
h2 = histc(x2,min_rx:max_rx/100:max_rx);
 
%get the normalized cumulative distribution of the data
xc1 = cumul(h1./sum(h1));
xc2 = cumul(h2./sum(h2));
 
figure
hold on
plot(xc1)
plot(xc2)

%Wilcoxon rank test
P = ranksum(xc1,xc2);
disp(['significance: P=' num2str(P)])

end

function y = cumul(x)

N = length(x);
y = x;
for i = 2:N
    y(i) = y(i-1)+y(i);
end

end
