function [data_x,data_y,X] = create_data(size,order,average,sigma )
%   �������ݼ���Сsize������order,������ֵaverage�ͱ�׼��sigma
%
%   data_xΪ��0-1֮����������1*size��С�ľ���data_yΪsize*1�ľ���
%   ������averageΪ��ֵ��sigmaΪ��׼�������noise
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

