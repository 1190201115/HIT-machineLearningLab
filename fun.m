%%���������֣����������Ļ��ܡ��������Ӧע�ͼ�������

%%x:�Ա�����Χ��num:���ݼ�������order:������average:����ƽ��ֵ,sigma��������׼��
%%lamda:�ͷ���ϵ��
x=0:0.01:1;
num=100;
order=50;
average=0;
sigma=0.1;
lamda=exp(-9);

%%���ݲ�������
%%output:
%%data_x:������x��������������СΪ1*num
%%data_y:������y��������������СΪnum*1
%%X:��[1��xi,xi^2,...,xi^order]Ϊ�У���num�еľ���i�ķ�ΧΪ1~num����СΪnum*(order+1)
[data_x,data_y,X]=create_data(num,order,average,sigma);

%%Ѱ�Һ��ʵ�lamda���ͷ�ϵ����
%%find_lamda(X,data_x,data_y,num);

%%����sin(2pix)�ĺ���ͼ��
%{
origin_paint(x,data_x,data_y);
hold on;
%}

%%��С���˷�������⣨�������
%{
func1_paint(x,X,data_y)
hold on;
%}

%%��С���˷�������⣨�������
%{
punish_paint(x,X,data_y,lamda);
hold on;
%}

%%�ݶ��½���
%%output:
%%train_times:�����㾫��ʱ���ݶ��½��ĵ�������
%{
train_times=gradient_paint(x,order,data_x,data_y,lamda);
hold on;
%}

%%�����ݶȷ�
%%output
%%trainTimes:�����㾫��ʱ�������ݶȵĵ�������
%{
trainTimes=con_gradient(X,lamda,data_y,x);
%}

%%ͼ��˵��
%{
legend('sin','withOut_punish','punish','gradient','conGradient');
string1=sprintf('%s%d,%s%d','order=',order,'dataNum=',num);
title(string1);
%}


