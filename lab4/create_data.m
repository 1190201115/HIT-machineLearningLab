function [ data ] = create_data(dimension,num)
%UNTITLED2 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
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

