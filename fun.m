%%主函数部分，各个函数的汇总。解除掉对应注释即可运行

%%x:自变量范围，num:数据集数量，order:阶数，average:噪声平均值,sigma：噪声标准差
%%lamda:惩罚项系数
x=0:0.01:1;
num=100;
order=50;
average=0;
sigma=0.1;
lamda=exp(-9);

%%数据产生函数
%%output:
%%data_x:产生的x轴坐标向量，大小为1*num
%%data_y:产生的y轴坐标向量，大小为num*1
%%X:以[1，xi,xi^2,...,xi^order]为行，共num列的矩阵，i的范围为1~num。大小为num*(order+1)
[data_x,data_y,X]=create_data(num,order,average,sigma);

%%寻找合适的lamda（惩罚系数）
%%find_lamda(X,data_x,data_y,num);

%%绘制sin(2pix)的函数图像
%{
origin_paint(x,data_x,data_y);
hold on;
%}

%%最小二乘法求解析解（无正则项）
%{
func1_paint(x,X,data_y)
hold on;
%}

%%最小二乘法求解析解（有正则项）
%{
punish_paint(x,X,data_y,lamda);
hold on;
%}

%%梯度下降法
%%output:
%%train_times:当满足精度时，梯度下降的迭代次数
%{
train_times=gradient_paint(x,order,data_x,data_y,lamda);
hold on;
%}

%%共轭梯度法
%%output
%%trainTimes:当满足精度时，共轭梯度的迭代次数
%{
trainTimes=con_gradient(X,lamda,data_y,x);
%}

%%图像说明
%{
legend('sin','withOut_punish','punish','gradient','conGradient');
string1=sprintf('%s%d,%s%d','order=',order,'dataNum=',num);
title(string1);
%}


