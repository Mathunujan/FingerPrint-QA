clc;
srcFiles = dir('.\Ecoflex\*.PNG');
x=[];
for i=1:length(srcFiles);
    filename=strcat('.\Ecoflex\',srcFiles(i).name);
    I=imread(filename);
    [image, descrips,locs]=sift(filename);
    x=[x;descrips];
    %figure,imshow(I);
   % pause;
end
save('fingerEcoflex.txt','descrips','-ASCII');