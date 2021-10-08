
function [  ] = punish_paint( x,X,data_y,lamda )
[~,col]=size(X);
w=pinv(X'*X+lamda*eye(col))*X'*data_y;
paint(w,col-1,x);
end

