clc;
myRootDir = 'C:\Users\Abc\Documents\MATLAB\PROJECT\QA\Train';
 %objects = {'Live1' 'Fake1'};
 objects = {'Live' 'Fake'};
 lv=[];
 fk=[];
for i = 1:length(objects)
    tifffiles = dir([myRootDir '\' objects{i} '\*.png']);
    
    if(i==1)
        for k = 1:length(tifffiles)
            filename = [myRootDir '\' objects{i} '\' tifffiles(k).name];
            gray_img=imread(filename);
            feat=FeatCall(gray_img);
            lv=[lv;feat];
            
%             C1=struct2array(feat,2);
%             quality=C1(:,:,1);
             %s1=[s1;s11];
%             [m1,n1]=size(lv);
%               quality(k).feat=feat
        end
        save('Live.txt', 'lv','-ASCII');
       % save('Live1.mat', 'quality');
    else
            for k = 1:length(tifffiles)
            filename = [myRootDir '\' objects{i} '\' tifffiles(k).name];
            gray_img=imread(filename);
            feat=FeatCall(gray_img)
            fk=[fk;feat];
            
%              C2=struct2array(feat,2);
%              quality=C1(:,:,1);
             %s2=C2{k};
%              [m2,n2]=size(fk);
               
            end
            save('Fake.txt', 'fk','-ASCII');
           %save('Fake1.mat', 'quality');
    end
%     str = strcat('Code-',objects{i},'.txt');
%     save(str,'c','-ASCII');%  save codebook
end
