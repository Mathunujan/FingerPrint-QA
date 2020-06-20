
function rate=winnerTakesAll(actual,predict,classes)
[m,n]=size(actual);
[maxp,classp]=max(predict,[],2);
rate=sum(actual(:,n)==classes(classp)')/m;
