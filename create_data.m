function [data_x,data_y,X] = create_data(size,order,average,sigma )
%   输入数据集大小size，阶数order,噪声均值average和标准差sigma
%
%   data_x为在0-1之间的随机数，1*size大小的矩阵。data_y为size*1的矩阵。
%   产生以average为均值，sigma为标准差的噪声noise
%   
data_x=rand(1,size);
sin_func=sin(2*pi*data_x);
noise=average+sigma.*randn(1,size);
data_y=sin_func+noise;
data_y=reshape(data_y,size,1);
X=ones(size,order+1);
for i=1:order
  X(:,i+1)=(data_x.^i);
end
end

