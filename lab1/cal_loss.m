function [ loss ] = cal_loss( order,w,data_x,data_y)
%¼ÆËãµ±Ç°´ú¼Û
hypo_y=cal_hypoY(order,w,data_x);
loss=sum((hypo_y-data_y).^2);
end

