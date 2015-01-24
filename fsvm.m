function f = fsvm(lambda)
X=[1 0;0 1; 0 -1; -1 0; 0 2; 0 -2; -2 0];
K= (1+X*X').^2;
% x1=X(:,1); x2=X(:,2);
% K=(x2.^2-2*x1+3)*(x1.^2-2*x2-3)';
y=[-1,-1,-1,1,1,1,1]';
len = size(X,1);
f=(-1*ones(len,1))'*lambda+1/2*(lambda.*y)'*K*(lambda.*y); 

end
