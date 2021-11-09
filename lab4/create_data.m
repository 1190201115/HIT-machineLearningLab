function [ data ] = create_data(dimension,num)
%UNTITLED2 此处显示有关此函数的摘要
%   此处显示详细说明
if dimension==2
    mean=[2,2];
    cov=[5,0;0,0.01];
    data=mvnrnd(mean, cov, num);
end
if dimension==3
    mean=[3,3,3];
    cov=[5,0,0;0,5,0;0,0,0.01];
    data=mvnrnd(mean, cov, num);
end
end

