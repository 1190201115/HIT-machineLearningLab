function [ Cost ] = cal_cost( theta,X,label )
%计算当前代价（误差）
[row,~]=size(X);
Cost=0;
for i=1:row
 Cost=-label(i)*log(cal_sigmoid(X(i,:)*theta))-(1-label(i))*log(1-cal_sigmoid(X(i,:)*theta))+Cost;
end


