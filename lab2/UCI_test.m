function [ ] = UCI_test(w)
%绘图，计算精确度
% test0中存了label为1的数据，处理后label为0
file=load('D:\matlab\code_here\logistic_lab2\Skintest0.txt');
x0=file(:,1);
y0=file(:,2);
z0=file(:,3);
x0=x0./100;
y0=y0./100;
z0=z0./100;
plot3(x0,y0,z0,'o');
hold on;
kind1=file(:,4);
kind1=kind1-1;

%%test1中存了label为2的数据，处理后为1
file=load('D:\matlab\code_here\logistic_lab2\Skintest1.txt');
x1=file(:,1);
y1=file(:,2);
z1=file(:,3);
x1=x1./100;
y1=y1./100;
z1=z1./100;
plot3(x1,y1,z1,'o');
hold on;
kind2=file(:,4);
kind2=kind2-1;
kind=[kind1;kind2];

%%绘图范围
Px=(0:0.01:3);
Py=(0:0.01:3);
[x,y]=meshgrid(Px,Py); 
Pz=(w(1)+w(2)*x+w(3)*y)/(-w(4));
surf(x,y,Pz);
shading interp 

%%计算精确度
[row1,~]=size(x0);
[row2,~]=size(x1);
row=row1+row2;
line=ones(row,1);
x=[x0;x1];
y=[y0;y1];
z=[z0;z1];
X=[line,x,y,z];
UCI_accuracy(w,X,kind);
end

