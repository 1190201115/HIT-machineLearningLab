%ʵ����,������
%%��������
num=200;

%��׼����
%{
k=4;
mean_all=[[1,1],[3,3],[1,3],[3,1]];
cov_all=[[0.2,0;0,0.2],[0.4,0.1;0.1,0.4],[0.3,0.15;0.15,0.3],[0.2,0.05;0.05,0.2]];
[data1,data2,data3,data4,class]=create_data(num,mean_all,cov_all);
X=[data1;data2;data3;data4];
%}

%%�޸�ƽ��ֵ��ʹ����
%{
k=4;
mean_all=[[1,1],[5,5],[1,5],[5,1]];
cov_all=[[0.2,0;0,0.2],[0.4,0.1;0.1,0.4],[0.3,0.15;0.15,0.3],[0.2,0.05;0.05,0.2]];
[data1,data2,data3,data4,class]=create_data(num,mean_all,cov_all);
X=[data1;data2;data3;data4];
%}

%%�޸�Э�������ʹ�������ڲ���ɢ�̶ȸ���
%{
k=4;
mean_all=[[1,1],[3,3],[1,3],[3,1]];
cov_all=[[0.4,0;0,0.4],[0.8,0.2;0.2,0.8],[0.6,0.3;0.3,0.6],[0.4,0.1;0.1,0.4]];
[data1,data2,data3,data4,class]=create_data(num,mean_all,cov_all);
X=[data1;data2;data3;data4];
%}

%%gmm�㷨
%{
step=50;
mark=gmm(cov_all,mean_all,step,num*k,X,k);
draw(num*k,mark,X);
cal_accuracy(class,mark,num*k,1);
%}

%%kmeans�㷨
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