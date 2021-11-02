function [center ] = cal_center( X,k,num)
%产生初始中心点
% k个中心，不能相同
[~,col]=size(X);
%产生随机且不同的k个中心点
center=zeros(k,col);
i=1;
while i<k+1
    temp=X(randi([1,num],1),:);
    if ismember(temp,center)
        continue;
    end
    center(i,:)=temp;
    i=i+1;
end

end

