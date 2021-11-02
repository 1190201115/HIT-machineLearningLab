function [ probability ] =cal_probability( cov_all,mean_all,X,j,k )
%   计算第j个数据属于第k类的概率
[~,col]=size(X);
denominator=((2*pi)^(col/2))*sqrt(det(cov_all(1:col,col*(k-1)+1:col*k)));
numerator=exp( -0.5* ( (X(j,:)-mean_all(1,col*(k-1)+1:col*k)) * inv(cov_all(1:col,col*(k-1)+1:col*k)) * (X(j,:)-mean_all(1,col*(k-1)+1:col*k))') );
probability=numerator/denominator;
end

