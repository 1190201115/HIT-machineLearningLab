function [accuracy  ] = cal_accuracy( w,X,label,num)
%计算验证集中正确预测数据数/总数据数
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

%%利用预测的label向量和实际的标记异或，再对向量内部求和，得到预测错误的数据数
bitxor(mylabel,label);
accuracy=(1-sum(bitxor(mylabel,label))/num)

end

