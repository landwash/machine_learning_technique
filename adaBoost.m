data=load('hw2_adaboost_train.dat');
x=data(:,1:2);
y=data(:,3);

tx1 = sort(x(:,1));
tx2 = sort(x(:,2));

threshold = zeros(size(x));
threshold(1,1) = tx1(1) - 1;
threshold(1,2) = tx2(1) - 1;

for i = 2:length(y)
    threshold(i,1) = tx1(i) + tx1(i-1) / 2;
    threshold(i,2) = tx2(i) + tx2(i-1) / 2;
end

iter    = 1;
alpha   = zeros(1,300);
u       = ones(100,1)/100;
s       = zeros(300,1);
thre    = zeros(300,1);
indx    = zeros(300,1);

h_sum = 0;
em    = 1;
S     = [-1,1];
ut    = 1;
while(iter <= 300)
    [e,thresh,h] = dicisionStump(x,y,threshold,u);
    
    alpha = 0.5*log((1-e)/e);
    u1 = u.*exp(-alpha.*y.*h); 
    us = sum(u1);
    u  = u1/us;
    ut = ut*us;
    
    si    = thresh(end);
    indxi = thresh(2);
    threi = thresh(3);
    h1    = S(si).*sign(x(:,indxi)-threi);
    h_sum = h_sum + alpha*h1;
    
    s(iter)     = S(si);
    indx(iter)  = indxi;
    thre(iter)  = threi;
    
    if e < em; em = e; end
    iter = iter + 1;
end

h_f = sign(h_sum);
err_in = sum(h_f ~= y)

testdata = load('hw2_adaboost_test.dat');
xt       = testdata(:,1:2);
yt       = testdata(:,3);

ht = 0;
for i = 1:300
    h  = s(i)*sign(xt(:,indx(i))-thre(i));
    ht = ht + h;
end

h_test = sign(ht);
err_out = sum(h_test~=yt)





