function [final_mark] = gmm( cov_all,mean_all,step,num,X,kind )
%gmm算法

[~,col]=size(X);
total_prob=zeros(num,kind);
single_prob=zeros(1,kind);
possible=zeros(1,kind);
possible(1,1:kind)=0.25;
while step>0
    step=step-1;
    %每个样本对每个类别的响应度
    for i=1:num
        total_weight=0;
        for j=1:kind
            single_prob(j)=cal_probability( cov_all,mean_all,X,i,j);
            total_weight=total_weight+(1/kind)*single_prob(j);
        end
        for j=1:kind
            total_prob(i,j)=single_prob(j)/total_weight;
        end
    end
    for k=1:kind
        mulsum=zeros(1,col);
        sum=0;
        for j=1:num
            sum=sum+total_prob(j,k);
            mulsum=mulsum+total_prob(j,k)*X(j,:);
        end
        diff=X-repmat(mean_all(1,col*(k-1)+1:col*k),num,1);
        eye=zeros(num);
        for j=1:num
            eye(j,j)=total_prob(j,k);
        end
        cov_all(1:col,col*(k-1)+1:col*k)=diff'*eye*diff/sum;
        possible(k)=sum/num;
    end
    final_mark=zeros(num,1);
    for i=1:num
        max=0;
        tag=1;
        for k=1:kind
            weight=total_prob(i,k);
            if weight>max   
                max=weight;
                tag=k;
            end
        end
        final_mark(i)=tag;
    end  
end

