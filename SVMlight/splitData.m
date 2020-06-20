function [train,test]=splitData(data)
    [m,n]=size(data);
    k=round(m*0.7);
    train=data(1:k,:);
    data(1:k,:)=[];
    test=data;