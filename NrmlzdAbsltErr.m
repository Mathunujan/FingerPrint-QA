function [ nae_v ] = NrmlzdAbsltErr( I,I_cap )
I=double(I);
I_cap=double(I_cap);
nae_v=sum(sum(I-I_cap))/sum(sum(I));
end
