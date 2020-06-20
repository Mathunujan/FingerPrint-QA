function data=invertData(data,class)
n=size(data,2)
indices=(data(:,n)==class);
data(indices,n)=1;

ind=~indices;
data(ind,n)=-1;