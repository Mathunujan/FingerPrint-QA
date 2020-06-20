%Nearest Neigbour Approach
data=load('.\iris.txt');
cls=data(:,1);
data(:,1)=[];
data=[data cls];
save('iris.txt','data','-ASCII');