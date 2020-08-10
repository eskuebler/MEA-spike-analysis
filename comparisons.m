%{
Wilcoxon Test Cumulative Distributions
%}

% function P = wilcoxonCumul(x1,x2)

%Let's create some imaginary data:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
N = 64; %number of electrodes
M = 100;%whatever number of observations you have, e.g., the amplitude of 100 bursts for each electrode
 
%for example, random data
x1 = randn(N,M); 
x2 = randn(N,M)+0.5;
 
%some pre-processing
rx1 = reshape(x1,N*M,1);
rx2 = reshape(x2,N*M,1);
max_rx = max([rx1 rx2]);
min_rx = min([rx1 rx2]);
h1 = histc(rx1,min_rx:max_rx/100:max_rx);
h2 = histc(rx2,min_rx:max_rx/100:max_rx);
 
%get the normalized cumulative distribution of the data
xc1 = cumul(h1./sum(h1));
xc2 = cumul(h2./sum(h2));
 
%Wilcoxon rank test
P = ranksum(xc1,xc2);
disp(['significance: P=' num2str(P)])

function y = cumul(x)

N = length(x);
y = x;
for i = 2:N
    y(i) = y(i-1)+y(i);
end

end
