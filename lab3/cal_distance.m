function [distance ] = cal_distance( x,y,col )
%�����������룬Ϊ�˷���ֻд�˶�ά����ά�ģ�����Ҫ���Ը�дΪkά��
if col==2
distance=sqrt((x(1)-y(1))^2+(x(2)-y(2))^2);
else
    distance=sqrt((x(1)-y(1))^2+(x(2)-y(2))^2+(x(3)-y(3))^2);
end

