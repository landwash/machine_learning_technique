X=[1 1 0; 1 0 1; 1 0 -1; 1 -1 0; 1 0 2; 1 0 -2; 1 -2 0];
y=[-1,-1,-1,1,1,1,1]'; Y=y;
Aeq = y';
beq = 0;
lb = zeros(7,1);
x0=zeros(7,1);
[lambda,favl,exitflag] = fmincon(@fsvm,x0,[],[],Aeq,beq,lb);
% w=(lambda.*y)'*(1+X*X');
