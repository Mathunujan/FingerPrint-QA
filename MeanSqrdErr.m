function [ mse_v ] = MeanSqrdErr( I,I_cap )
I=double(I);
I_cap=double(I_cap);
mse_v=(1/(size(I,1)*size(I,2)))*sum(sum((I-I_cap).^2));

end

