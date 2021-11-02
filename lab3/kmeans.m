function [center,class] = kmeans( X,k,num )
%kmeans分类算法
% 
center=cal_center(X,k,num);
[~,col]=size(center);
class=zeros(num,1);%存放每个点距离最近的中心点序号
get=0;
iteration=0
while get==0
      newcenter=zeros(k,col);
      tagnum=zeros(k,1);%记录每个区域有多少数据点
for i=1:num
    minlen=9999;
    tag=1;
    for j= 1:k
        len=cal_distance(X(i,:),center(j,:),col);
        if minlen>len
            minlen=len;
            tag=j;
        end
    end
    class(i)=tag;
    tagnum(tag)=tagnum(tag)+1;
end
for i=1:num
    newcenter(class(i),:)=newcenter(class(i),:)+X(i,:);
end
for i=1:k
    newcenter(i,:)=newcenter(i,:)./tagnum(i);
end
    if newcenter==center
        get=1;
        iteration
    end
    iteration=iteration+1;
        center=newcenter;
end

