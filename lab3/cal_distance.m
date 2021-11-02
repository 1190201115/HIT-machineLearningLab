function [distance ] = cal_distance( x,y,col )
%计算两点间距离，为了方便只写了二维和三维的，如需要可以改写为k维的
if col==2
distance=sqrt((x(1)-y(1))^2+(x(2)-y(2))^2);
else
    distance=sqrt((x(1)-y(1))^2+(x(2)-y(2))^2+(x(3)-y(3))^2);
end

