function [ output_args ] = draw( num,class,X )
%UNTITLED3 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
for i=1:num
switch class(i)
        case 1
            plot(X(i,1),X(i,2),'or');
            hold on;
        case 2
            plot(X(i,1),X(i,2),'+g');
             hold on;
             
        case 3
            plot(X(i,1),X(i,2),'*b');
             hold on;
        case 4
            plot(X(i,1),X(i,2),'dk');
             hold on;  
end
end

end

