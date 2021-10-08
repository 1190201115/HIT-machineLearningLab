function [ train_times ] = gradient_paint(x,order,data_x,data_y,lamda)
%��ʼϵ������Ϊȫ0
w = zeros(order+1, 1);
%���㵱ǰ����
old_loss=cal_loss(order,w,data_x,data_y);
tempw=w;
train_rate=0.02;
train_times=1000000;%%���ѵ������
for j=1:train_times
    
    hypo_y=cal_hypoY(order,w,data_x);
    for i=1:order+1
        tempw(i)=w(i)-train_rate*(sum((hypo_y-data_y).*(data_x.^(i-1))')+lamda*w(i));
    end
    new_loss=cal_loss(order,tempw,data_x,data_y);
    %%���㾫��ʱ����¼ѵ���������˳�����
    if abs(old_loss-new_loss)<10^-6
        train_times=j;
        break;
    end
    if new_loss<old_loss
        w=tempw;
        old_loss=new_loss;
        continue;
    end
    if new_loss>=old_loss
        train_rate=train_rate/2;
    end
end
paint(w,order,x);
end

