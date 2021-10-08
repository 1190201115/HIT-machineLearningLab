%%»æÖÆº¯ÊıÍ¼Ïñ
function [] = paint(w,order,x )
y=0;
for i=1:order+1
    y=w(i)*x.^(i-1)+y;
end
plot(x,y);
end

