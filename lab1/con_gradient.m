function [trainTimes ] =con_gradient(X,lamda,data_y,x)
[~,col]=size(X);
A=X'*X+lamda*eye(col);
b=X'*data_y;
w = zeros(col, 1);
r0=b-A*w;
p=r0;
k=0;
delta=10^-6;
while true
    alpha = (r0'* r0)/(p'*A * p);
        w = w + alpha * p;
        r = r0-alpha*A*p;
        %%满足精度时退出
        if r0'*r0 < delta;
            break;
        end
        beta = (r'* r) / (r0'* r0);
        p = r + beta * p;
        r0 = r;
        k =k+1;
end
%%记录训练次数
trainTimes=k;
paint(w,col-1,x);
end

