%%寻找合适的惩罚系数
function [ ] = find_lamda(X,data_x,data_y,num)
siny=sin(2*pi*data_x)';

%%lamda范围为exp(-40),到exp(0)
lnlamda=(-40:0.1:0);
lamda=exp(lnlamda);

%%存储代价值
rms=zeros(401,1);
rms2=zeros(401,1);

[~,col]=size(X);
order=col-1;
minloss=1;
minlamda=0;

for i=1:401
    w=pinv(X'*X+lamda(i)*eye(col))*X'*data_y;
    rms2(i)=((cal_loss(order,w,data_x,siny))^(1/2))/num;
    %%记录代价最小时lamda的值，转化为以e为底的指数
    if rms2(i)<minloss
        minlamda=round(lnlamda(i));
        minloss=rms2(i);
    end
    rms(i)=((cal_loss(order,w,data_x,data_y))^(1/2))/num;
end
plot(lnlamda,rms);
hold on;
plot(lnlamda,rms2);
legend('data_y','sin');
string1=sprintf('%s%d %s%d','minloss=',minloss,'min=',minlamda);;
title(string1);
end

