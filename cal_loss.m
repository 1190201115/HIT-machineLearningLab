function [ loss ] = cal_loss( order,w,data_x,data_y)
%计算当前代价
hypo_y=cal_hypoY(order,w,data_x);
loss=sum((hypo_y-data_y).^2);
end

