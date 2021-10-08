function [ hypo_y ] = cal_hypoY(order,w,data_x)
%根据输入的数据集大小，阶数，系数，x矩阵产生对应的y矩阵
[~,num]=size(data_x);
hypo_y=zeros(1,num);
for j=1:num
    for i=1:order+1
        hypo_y(j)=w(i)*(data_x(j).^(i-1))+hypo_y(j);
    end
end
hypo_y=reshape(hypo_y,num,1);
end

