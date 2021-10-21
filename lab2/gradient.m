function [w ] = gradient(X,y,lamda)
%�ݶ��½�����ϵ������

%%colΪX����������������+1��X�ĵ�һ��Ϊ1
[~,col]=size(X);

%%��ʼϵ����������Ϊȫ0
w = zeros(col, 1);
old_cost=cal_cost(w,X,y);
tempw=w;

%%���ò��������ѵ������
train_rate=0.02;
train_times=100000;
for j=1:train_times
    hypo_y=cal_sigmoid(X*w);%%����Ԥ���labelֵ��0��1֮�䣩
    for i=1:col
        tempw(i)=w(i)-train_rate*(sum((hypo_y-y).*X(:,i))+lamda*w(i));
    end
    new_cost=cal_cost(tempw,X,y);
    %%���㾫��ʱ����¼ѵ���������˳�����
    if abs(old_cost-new_cost)<10^-6
        train_times=j;
        train_times
        %%���ѵ������
        break;
    end
    if new_cost<old_cost
        w=tempw;
        old_cost=new_cost;
        continue;
    end
    if new_cost>=old_cost
        train_rate=train_rate/2;
    end
    
end

end

