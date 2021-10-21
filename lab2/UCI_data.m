function [ output_args ] = UCI_data(  )
%从UCI下载了一份分类数据，对其进行处理，Skin.txt为训练集数据

%%读文件，x，y，z分别为三个变量的列向量，kind为分类向量，因为原数据用1和2分类，为了直接用之前的函数，故改为0和1
file=load('D:\matlab\code_here\logistic_lab2\Skin.txt');
x=file(:,1);
y=file(:,2);
z=file(:,3);
x=x./100;
y=y./100;
z=z./100;
kind=file(:,4);
kind=kind-1;
[row,~]=size(x);
line1=ones(row,1);
X=[line1,x,y,z];
w=gradient(X,kind,0.9)

%%训练得到系数向量w后，传递到test函数中绘图
UCI_test(w);

%{
ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';
%}
end

