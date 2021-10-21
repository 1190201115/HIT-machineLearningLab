function [w ] = gradient(X,y,lamda)
%梯度下降法求系数向量

%%col为X的列数，即变量数+1，X的第一列为1
[~,col]=size(X);

%%初始系数向量设置为全0
w = zeros(col, 1);
old_cost=cal_cost(w,X,y);
tempw=w;

%%设置步长和最大训练次数
train_rate=0.02;
train_times=100000;
for j=1:train_times
    hypo_y=cal_sigmoid(X*w);%%计算预测的label值（0到1之间）
    for i=1:col
        tempw(i)=w(i)-train_rate*(sum((hypo_y-y).*X(:,i))+lamda*w(i));
    end
    new_cost=cal_cost(tempw,X,y);
    %%满足精度时，记录训练次数，退出迭代
    if abs(old_cost-new_cost)<10^-6
        train_times=j;
        train_times
        %%输出训练次数
        break;
    end
    if new_cost<old_cost
        w=tempw;
        old_cost=new_cost;
        continue;
    end
    if new_cost>=old_cost
        train_rate=train_rate/2;
    end
    
end

end

