function [X] = create_data(mu,S,num,label)
%产生以mu为均值，S为方差，num为数量的离散数据点

data=mvnrnd(mu, S, num);
plot(data(:,1),data(:,2),'o');

if(label==1)
X=ones(num,4);
else
X=zeros(num,4);
X(:,1)=ones(num,1);
end
X(:,2)=data(:,1);
X(:,3)=data(:,2);
hold on;
end

