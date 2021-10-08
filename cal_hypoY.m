function [ hypo_y ] = cal_hypoY(order,w,data_x)
%������������ݼ���С��������ϵ����x���������Ӧ��y����
[~,num]=size(data_x);
hypo_y=zeros(1,num);
for j=1:num
    for i=1:order+1
        hypo_y(j)=w(i)*(data_x(j).^(i-1))+hypo_y(j);
    end
end
hypo_y=reshape(hypo_y,num,1);
end

