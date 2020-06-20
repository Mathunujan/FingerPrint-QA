%Nearest Neighbour Approach
data=load('C:\Users\Abc\Documents\MATLAB\PROJECT\siftDemoV4\FullCodeLbl.txt');
data=shuffleData(data);
[trainSet,testSet]=splitData(data);
save('FullCodeLblTrain.txt','trainSet','-ASCII');
save('FullCodeLblTest.txt','testSet','-ASCII');