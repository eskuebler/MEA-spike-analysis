function s = shuffle(x)

r = randperm(length(x));

s = x(r);
