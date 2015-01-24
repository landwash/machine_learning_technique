clear;
data = load('hw2_lssvm_all.dat');
x   = data(1:400,1:10);
y   = data(1:400,end);
xt  = data(401:end,1:10);
yt  = data(401:end,end);

gama    = [32, 2, 0.125];
lambda  = [0.001,1,1000];

x1  = x*x';
x2  = repmat(sum(x.^2, 2), 1,400);
x3  = repmat(sum(x.^2, 2)',400,1);

Ko = x2 + x3 - 2*x1;

xt1  = x*xt';
xt2  = repmat(sum(x.^2, 2), 1,100);
xt3  = repmat(sum(xt.^2, 2)',400,1);

Kto = xt2 + xt3 - 2*xt1;

for g = 1:3
    for l =1:3
        K   = exp(-gama(g).*Ko);
        Kt  = exp(-gama(g).*Kto);
        beta = (lambda(l).*eye(400)+K)\y;
        g1  = sign( beta' * K);
        gt1 = sign( beta' * Kt);
        sum(g1'~=y)
        sum(gt1'~=yt)
    end
end

% g = (y .* beta)' * K;
% b = -y(1)*(1- y(1)*g(1));

