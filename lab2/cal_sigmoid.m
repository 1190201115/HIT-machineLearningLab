function [sigmoid ] = cal_sigmoid( z )
%将数据控制在0到1
sigmoid=1./(1+exp(-z));
end

