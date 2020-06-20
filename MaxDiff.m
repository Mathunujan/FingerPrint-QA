function [ md_v ] = MaxDiff( I,I_cap )
I=double(I);
I_cap=double(I_cap);
md_v=max(max(I-I_cap));
end

