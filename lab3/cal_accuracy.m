function [ accuracy ] = cal_accuracy(class,mark,num,needchange)
%计算聚类的准确度。由于聚类后的分类标签顺序未必与分类前一致，故写了一个简单的算法使其对应，传入参数needchange为2时表示需要对应。
right=0;
kind=class(num);
if needchange==2
num_now=class(1);
n=1;
exchange=zeros(kind,1);
count=zeros(kind,1);
    max=1;
    maxtag=1;
while n<=num
    if class(n)==num_now
        count(mark(n))=count(mark(n))+1;
        n=n+1;
    else
    for k=1:kind
        if count(k)>max
            max=count(k);
            maxtag=k;
        end
    end
    exchange(num_now)=maxtag;
    num_now=class(n);
    count=zeros(kind,1);
    max=1;
    maxtag=1;
    continue;
    end
end
for k=1:kind
        if count(k)>max
            max=count(k);
            maxtag=k;
        end
    end
    exchange(num_now)=maxtag;
for i=1:num
   class(i)=exchange(class(i));
end

end
a=class-mark;
for i=1:num
    if a(i)==0
        right=right+1;
    end
end
accuracy=right/num
end

