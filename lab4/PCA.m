function [vector,centre_data,mean] = PCA( data,k )
%data为数据，k为降后的维数
%
[row,col]=size(data);
mean=sum(data)/row;
centre_data=data-repmat(mean,row,1);
covdata=(centre_data'*centre_data)./(row-1);
[vector,value]=eig(covdata)
vector = fliplr(vector)
if k>0
    vector=vector(:,1:k);
    draw(data,'or');
    tempdata=centre_data*vector;
    score=tempdata*vector'+repmat(mean,row,1);
    draw(score,'g+');
    str =sprintf('原数据%d%s，压缩后%d%s',col,'个维度',k,'个维度');
    title(str);
end


%{
[U,S,V]=svd(covMat);
vector=U((1:col),(1:k));
for i=1:row
    (vector'*data(i,:)')'
    newdata(:,i)=vector'*data(i,:)';
end
newdata=newdata';
draw(newdata);
%}


