%Nearest Neighbour Approach
data=load('C:\Users\Abc\Desktop\Project\QA\SVMlight\FullLabel.txt');
data=shuffleData(data);
[trainSet,testSet]=splitData(data);
save('FullTrain.txt','trainSet','-ASCII');
save('FullTest.txt','testSet','-ASCII');