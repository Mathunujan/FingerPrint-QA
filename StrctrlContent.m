function [ sc_v ] = StrctrlContent( I,I_cap )
I=double(I);
I_cap=double(I_cap);
sc_v=sum(sum(I.^2))/sum(sum(I_cap.^2));
end

