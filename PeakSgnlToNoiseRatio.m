function [ psnr_v ] = PeakSgnlToNoiseRatio( I,I_cap )
I=double(I);
I_cap=double(I_cap);
mse_v=(1/(size(I,1)*size(I,2)))*sum(sum((I-I_cap).^2));
psnr_v=10*log(max(max(I.^2))/mse_v);
end
