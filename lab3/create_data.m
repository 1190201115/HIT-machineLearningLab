function [ data1,data2,data3,data4,tag] = create_data( num,mean_all,cov_all)
%产生混合高斯模型
mean1=mean_all(1,[1,2]);
mean2=mean_all(1,[3,4]);
mean3=mean_all(1,[5,6]);
mean4=mean_all(1,[7,8]);
cov1=cov_all([1,2],[1,2]);
cov2=cov_all([1,2],[3,4]);
cov3=cov_all([1,2],[5,6]);
cov4=cov_all([1,2],[7,8]);
data1=mvnrnd(mean1, cov1, num);
data2=mvnrnd(mean2, cov2, num);
data3=mvnrnd(mean3, cov3, num);
data4=mvnrnd(mean4, cov4, num);
tag1=ones(num,1);
tag2=tag1.*2;
tag3=tag1.*3;
tag4=tag1.*4;
tag=[tag1;tag2;tag3;tag4];
end

