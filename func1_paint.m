function [  ] = func1_paint( x,X,data_y )
w=pinv(X'*X)*X'*data_y;
[~,col]=size(X);
paint(w,col-1,x);
end

