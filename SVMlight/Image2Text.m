
srcFiles = dir('.\a\*.png');  % the folder in which ur images exists
a=[];

for i = 1 :20
    filename = strcat('.\a\',srcFiles(i).name);
    I = imread(filename);
    [image, descrips, locs] = sift(filename);
    a=[a;descrips];
    %imshow(I); hold on; plot(locs(11,1),locs(11,2),'*r');
 imshow(I); hold on; plot(locs(:,2),locs(:,1),'*r');
end
    save('descrips.txt','a','-ASCII');