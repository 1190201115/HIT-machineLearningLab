%%����sin(2pix)�ĺ���ͼ��
function [ ] = origin_paint( x,data_x,data_y )
text(data_x,data_y,'o');
hold on;
y=sin(2*pi*x);
plot(x,y);
end

