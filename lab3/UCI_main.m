function [ output_args ] =UCI_main( input_args )
%聚类UCI数据，运行此函数

file=load('D:\matlab\code_here\k-means_lab3\seeds_data.txt');
%%为可视化取三维
x=file(:,1);
y=file(:,2);
z=file(:,7);
class=file(:,8);
X=[x,y,z];
[row,~]=size(X);
kind=3;

%kmeans方法
%{
[center,mark]=kmeans(X,kind,row);

for i=1:row
    switch class(i)
        case 1
            plot3(x(i),y(i),z(i),'or');
            hold on;
        case 2
            plot3(x(i),y(i),z(i),'+g');
            hold on;
        case 3
            plot3(x(i),y(i),z(i),'*b');
            hold on;
    end
end
plot3(center(:,1),center(:,2),center(:,3),'p','MarkerFaceColor','r','MarkerSize',20);
cal_accuracy(class,mark,row,2)
%}


%gmm算法
%{
nums=zeros(3,3);
numofclass=zeros(1,3);
for i=1:row
    nums(class(i),1)=nums(class(i),1)+x(i);
    nums(class(i),2)=nums(class(i),2)+y(i);
    nums(class(i),3)=nums(class(i),3)+z(i);
    numofclass(class(i))=numofclass(class(i))+1;
end

mean_all=[[nums(1,1)/70,nums(1,2)/70,nums(1,3)/70],[nums(2,1)/70,nums(2,2)/70,nums(2,3)/70],[nums(3,1)/70,nums(3,2)/70,nums(3,3)/70]];
cov_all=[[1,0,0;0,1,0;0,0,1],[1,0,0;0,1,0;0,0,1],[1,0,0;0,1,0;0,0,1]];
mark=gmm(cov_all,mean_all,30,row,X,kind);
for i=1:row
    switch mark(i)
        case 1
            plot3(x(i),y(i),z(i),'or');
            hold on;
        case 2
            plot3(x(i),y(i),z(i),'+g');
            hold on;
        case 3
            plot3(x(i),y(i),z(i),'*b');
            hold on;
    end
end
cal_accuracy(class,mark,row,2)
end
%}

