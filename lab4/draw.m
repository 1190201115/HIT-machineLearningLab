function [ output_args ] = draw(data,type)
%UNTITLED4 此处显示有关此函数的摘要
%   此处显示详细说明
[row,col]=size(data);
for i=1:row
    if col==3
        plot3(data(i,1),data(i,2),data(i,3),type);
        hold on;
    end
    if col==2
        plot(data(i,1),data(i,2),type);
        hold on;
    end
    if col==1
        plot(data(i),type);
        hold on;
    end
end

