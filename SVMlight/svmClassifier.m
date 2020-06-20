%-Load Dataset
data = load(...);

Traindata =
Testdata  =

%-Training
trnX = ...
trnY = ...   
    
%-Testing
tstX = ...
tstY = ...

%-Learning
options = svmlopt(...); 
svmlwrite(...);
svm_learn(...);

%-Classification
svm_classify(...);
predictions = svmlread(...);

%-Classification rate
rate = ...