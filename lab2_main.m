%%������
%%numΪ����һ�����ݵ������������Ƕ��ֵģ������ܵ�������Ϊ2m
num=150;
lamda=10^-4;
%%��������ɣ������������������������ΪX
X1=create_data([-0.8,-0.8],[0.4 0;0 0.4],num,0);
X2=create_data([0.8,0.8],[0.4 0;0 0.4],num,1);
X=[X1;X2];

label=X(:,4);%%label
X(:,4)=[];%%Xÿ������Ϊ1��x,y����ȥ�����У�label��

%%ͨ���ݶ��½����õ������ߵ�ϵ��w
w=gradient(X,label,lamda);

%%��ͼ
Px=(-2:0.01:2);
Py=(w(1)+w(2)*Px)/(-w(3));
plot(Px,Py);
accuracy=cal_accuracy(w,X,label,2*num);
string1=sprintf('%s%d,%s%d','accuracy=',accuracy,'dataNum=',2*num);
title(string1);

