function [center ] = cal_center( X,k,num)
%������ʼ���ĵ�
% k�����ģ�������ͬ
[~,col]=size(X);
%��������Ҳ�ͬ��k�����ĵ�
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

