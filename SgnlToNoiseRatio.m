function [ snr_v ] = SgnlToNoiseRatio( I,I_cap )
I=double(I);
I_cap=double(I_cap);
mse_v=(1/(size(I,1)*size(I,2)))*sum(sum((I-I_cap).^2));
snr_v=10*log(sum(sum((I-I_cap).^2))/((size(I,1)*size(I,2)))*mse_v);
end

