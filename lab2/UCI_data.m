function [ output_args ] = UCI_data(  )
%��UCI������һ�ݷ������ݣ�������д���Skin.txtΪѵ��������

%%���ļ���x��y��z�ֱ�Ϊ������������������kindΪ������������Ϊԭ������1��2���࣬Ϊ��ֱ����֮ǰ�ĺ������ʸ�Ϊ0��1
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

%%ѵ���õ�ϵ������w�󣬴��ݵ�test�����л�ͼ
UCI_test(w);

%{
ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';
%}
end

