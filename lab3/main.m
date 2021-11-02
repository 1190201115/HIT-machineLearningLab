%实验三,主函数
%%数据生成
num=200;

%标准数据
%{
k=4;
mean_all=[[1,1],[3,3],[1,3],[3,1]];
cov_all=[[0.2,0;0,0.2],[0.4,0.1;0.1,0.4],[0.3,0.15;0.15,0.3],[0.2,0.05;0.05,0.2]];
[data1,data2,data3,data4,class]=create_data(num,mean_all,cov_all);
X=[data1;data2;data3;data4];
%}

%%修改平均值，使分离
%{
k=4;
mean_all=[[1,1],[5,5],[1,5],[5,1]];
cov_all=[[0.2,0;0,0.2],[0.4,0.1;0.1,0.4],[0.3,0.15;0.15,0.3],[0.2,0.05;0.05,0.2]];
[data1,data2,data3,data4,class]=create_data(num,mean_all,cov_all);
X=[data1;data2;data3;data4];
%}

%%修改协方差矩阵，使样本集内部分散程度更高
%{
k=4;
mean_all=[[1,1],[3,3],[1,3],[3,1]];
cov_all=[[0.4,0;0,0.4],[0.8,0.2;0.2,0.8],[0.6,0.3;0.3,0.6],[0.4,0.1;0.1,0.4]];
[data1,data2,data3,data4,class]=create_data(num,mean_all,cov_all);
X=[data1;data2;data3;data4];
%}

%%gmm算法
%{
step=50;
mark=gmm(cov_all,mean_all,step,num*k,X,k);
draw(num*k,mark,X);
cal_accuracy(class,mark,num*k,1);
%}

%%kmeans算法
%{
[center,mark]=kmeans(X,k,num*k);
plot(data1(:,1),data1(:,2),'o');
hold on;
plot(data2(:,1),data2(:,2),'o');
hold on;
plot(data3(:,1),data3(:,2),'o');
hold on;
plot(data4(:,1),data4(:,2),'o');
hold on;
plot(center(:,1),center(:,2),'p','MarkerFaceColor','r','MarkerSize',20);
cal_accuracy(class,mark,num*k,2);
%}