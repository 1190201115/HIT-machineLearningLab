function [ accuracy ] = UCI_accuracy( w,X,kind )
%������ά�����ľ�ȷ��
% ��cal_accuracyԭ����ȫһ�£�������Ǹ������˾�������д��һ�����
data_x=X(:,2);
data_y=X(:,3);
data_z=X(:,4);
[row,~]=size(X);
kind0=zeros(row,1);
for i=1:row
    if (w(1)+w(2)*data_x(i)+w(3)*data_y(i)+w(4)*data_z(i))>0
        kind0(i)=1;
    else
        kind0(i)=0;
    end
end
bitxor(kind0,kind);
accuracy=1-sum(bitxor(kind0,kind))/row
end

