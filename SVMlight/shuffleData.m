function data=shuffleData(data)
    [m,n]=size(data);   %m-#instances, n-#attributes+target
    indices=randperm(m);
    data=data(indices,:);