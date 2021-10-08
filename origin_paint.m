%%»æÖÆsin(2pix)µÄº¯ÊıÍ¼Ïñ
function [ ] = origin_paint( x,data_x,data_y )
text(data_x,data_y,'o');
hold on;
y=sin(2*pi*x);
plot(x,y);
end

