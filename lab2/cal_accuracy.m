function [accuracy  ] = cal_accuracy( w,X,label,num)
%������֤������ȷԤ��������/��������
%  
data_x=X(:,2);
data_y=X(:,3);
[row,~]=size(X);
mylabel=zeros(row,1);
for i=1:row
    if (w(1)+w(2)*data_x(i)+w(3)*data_y(i))<0
        mylabel(i)=0;
    else
        mylabel(i)=1;
    end
end

%%����Ԥ���label������ʵ�ʵı������ٶ������ڲ���ͣ��õ�Ԥ������������
bitxor(mylabel,label);
accuracy=(1-sum(bitxor(mylabel,label))/num)

end

