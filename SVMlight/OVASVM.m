clc;
N=5; %Number of classes
trainData=load('.\FullCodeLblTrain.txt');
testData=load('.\FullCodeLblTest.txt');

%data=load(' ');
%[trainData,testData]=splitData(data);

%col=size(trainData,2);
A=1:N; %generate class numbers
%c=[2^-12, 2^-11, 2^10, ... , 0, 1, 2, ... ,2^10];
 c=1;   
%accuracy=[];

%for i=1:length(c)
    %options=SVMlopt('C',c(i),'verbosity',0);
    options=svmlopt('C',c,'verbosity',0);
    predict=[];
   for class=1:N;
        % Training Phase
        Model=['Model' int2str(A(class)),'vsAll'];
        x=invertData(trainData,A(class));
        y=x(:,end);
        x(:,end)=[];
        svmlwrite('SVMLTrain',x,y);
        svm_learn(options,'SVMLTrain',Model);
        
        % Testing Phase
        xtest=invertData(testData,A(class));
        ytest=xtest(:,end);
        xtest(:,end)=[];
        svmlwrite('SVMLTest',xtest,ytest);
        ModelOutput=['ModelOutput' int2str(A(class)),'vsAll'];
        svm_classify(options,'SVMLTest',Model,ModelOutput);
        svmpredict=svmlread(ModelOutput);
        predict=[predict svmpredict];
    end
    rate=winnerTakesAll(testData,predict,A);
    disp(rate*100);
        