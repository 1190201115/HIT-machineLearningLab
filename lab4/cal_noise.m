function [ psnr ] = cal_noise(ph,pic)
%UNTITLED3 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
[row,col]=size(ph);
mse=0;
for r=1:row
    for c=1:col
        mse=mse+(ph(r,c)-pic(r,c))^2;
    end
end
mse=mse/(row*col);
psnr=20*log(1/sqrt(mse))

end

