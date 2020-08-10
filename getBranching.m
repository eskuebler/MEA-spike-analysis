%calculates branching ratio
function sigma = getBranching(SP)

N = size(SP,1); %number of channels
T = size(SP,2);
desc_vec = [];
ance_vec = [];
kk = 1; %avalanche count

x = SP;
x(find(x~=0)) = 1;

s = sum(x);
fd = find(diff(s)>0);

for k = 1:length(fd)
    start=fd(k);
    if start+1 >= length(s)
        break;
    else
        f = find(s(start+1:end)==0);
    end
    if ~isempty(f)
        finish = f(1)+start;
        n_a{kk} = s(start);
        descendants{kk} = zeros(finish-start,1);
        ancestors{kk} = zeros(finish-start,1);
        for ii = 1:finish-start
            descendants{kk}(ii) = s(start+ii);
            ancestors{kk}(ii) = s(start+ii-1);
            desc_vec = [desc_vec s(start+ii)];
            ance_vec = [ance_vec s(start+ii-1)];
        end
        kk = kk+1;
    else
        break;
    end
end

nmax = max([desc_vec ance_vec]);
p_d = zeros(nmax,1);
n_sum_a = sum(ance_vec);
for i = 1:nmax
    s = 0;
    for j = 1:length(descendants)
        f = find(descendants{j}==i);
        n_sum_a_d = sum(ancestors{j}(f));
        s = s+((n_sum_a_d/n_sum_a) * ((nmax-1)/(nmax-n_a{j})));
    end
    p_d(i) = s;
end

sigma = 0;
for i = 1:nmax
    f = find(desc_vec==i);
    if ~isempty(f)
        d = round(sum(desc_vec(f))/sum(ance_vec(f)));
        if isnan(d) | isinf(d)
            d = 0;
        end
        sigma = sigma + (d * p_d(i));
    end
end

% disp(sigma)


