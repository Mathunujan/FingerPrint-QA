%Nearest Neigbour Approach
data1=load('C:\Users\Abc\Desktop\Project\QA\SVMlight\Live.txt');
cl1=ones(size(data1,1),1);
data1=[data1 cl1];
data2=load('C:\Users\Abc\Desktop\Project\QA\SVMlight\Fake.txt');
cl2=2*ones(size(data2,1),1);
data2=[data2 cl2];

data=[data1 ; data2];
% save('Full.txt','data','-ASCII');

save('fullLabel.txt','data','-ASCII');