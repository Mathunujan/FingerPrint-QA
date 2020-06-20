myRootDir = 'C:\Users\Abc\Documents\MATLAB\PROJECT\siftDemoV4\ItaldataTrain';

 objects = {'Ecoflex' 'Gelatine' 'Latex' 'Live' 'Modasil' 'WoodGlue'};

des=[]; 
km=15;
% fid=fopen('code.txt','w+');
cent = [];
for i = 1:length(objects)
    tifffiles = dir([myRootDir '\' objects{i} '\*.png']);
    fts = [];
    for k = 1:length(tifffiles)
        filename = [myRootDir '\' objects{i} '\' tifffiles(k).name];
        [image, descriptors, locs] = sift(filename);
        fts = [fts;descriptors];
    end
    [idx,c]= kmeans(fts,km); %  clustering ..........
    cent = [cent;c];
    str = strcat('Code-',objects{i},'.txt');
    save(str,'c','-ASCII');%  save codebook
end

save('FullCode.txt','cent','-ASCII');

 
 
