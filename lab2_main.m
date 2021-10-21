%%主函数
%%num为产生一类数据的数量，由于是二分的，所以总的数据量为2m
num=150;
lamda=10^-4;
%%随机数生成，产生的两类坐标向量列相加为X
X1=create_data([-0.8,-0.8],[0.4 0;0 0.4],num,0);
X2=create_data([0.8,0.8],[0.4 0;0 0.4],num,1);
X=[X1;X2];

label=X(:,4);%%label
X(:,4)=[];%%X每列依次为1，x,y，消去第四列（label）

%%通过梯度下降法得到分类线的系数w
w=gradient(X,label,lamda);

%%绘图
Px=(-2:0.01:2);
Py=(w(1)+w(2)*Px)/(-w(3));
plot(Px,Py);
accuracy=cal_accuracy(w,X,label,2*num);
string1=sprintf('%s%d,%s%d','accuracy=',accuracy,'dataNum=',2*num);
title(string1);

