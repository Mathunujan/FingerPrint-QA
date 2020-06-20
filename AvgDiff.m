function [ ad_v ] = AvgDiff( I,I_cap )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
I=double(I);
I_cap=double(I_cap);
ad_v=(1/(size(I,1)*size(I,2)))*sum(sum(I-I_cap));
end
