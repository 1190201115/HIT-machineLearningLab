function [ output_args ] = photo( input_args )
%UNTITLED2 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
%{
n=1;
ph=imread('s40_2.bmp');
[row ,col ,bands]=size(ph);
ph=double(ph)/255;
[vector,centre_data,mean]=PCA(ph,0);
vector=vector(:,1:n);
new_ph=centre_data*vector;
pic=new_ph*vector'+repmat(mean,row,1);
imshow(pic);
noise=cal_noise(ph,pic);
figure(1);
imshow(pic,'InitialMagnification','fit');
str =sprintf('ѹ����%d%s,�����Ϊ%.2f',n,'��ά��',noise);
title(str);

%}

%%ͨ��ѹ��

n=1;
ph=imread('cat.png');
ph=double(ph)/255;
[row ,col ,bands]=size(ph);
mul = reshape(ph, [row*col,bands]);
[vector,centre_data,mean]=PCA(mul,0);
re = mul*vector(:,1:n)*vector(:,1:n)';
[r,c,bands] =size(ph);
comp = reshape(re,[r,c,bands]);
str =sprintf('%d%s,�����Ϊ%.2f',n,'��ͨ��');
figure;imshow(comp);title(str);

%{
ph=im2double(ph);
vector=PCA(ph,80);
imshow(newph);
%}
%}
end

