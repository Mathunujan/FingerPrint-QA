clc;
myRootDir = 'C:\Users\Abc\Documents\MATLAB\PROJECT\QA\Train';
 %objects = {'Live1' 'Fake1'};
 objects = {'Live' 'Fake'};
 lv=[];
 fk=[];
for i = 1:length(objects)
    tifffiles = dir([myRootDir '\' objects{i} '\*.png']);
    quality(1:size(tifffiles,1))...
    =struct('feat',zeros(1,4));
    if(i==1)
        quality=[];
        for k = 1:length(tifffiles)
            filename = [myRootDir '\' objects{i} '\' tifffiles(k).name];
            gray_img=imread(filename);
            feat=FeatCall(gray_img);
            %lv=[lv;feat];
            quality(k).feat=feat;
%             C1=struct2array(feat,2);
%             quality=C1(:,:,1);
             %s1=[s1;s11];
%             [m1,n1]=size(lv);
%               quality(k).feat=feat
        end
        save('Live.mat', 'quality');
       % save('Live1.mat', 'quality');
    else
            for k = 1:length(tifffiles)
            filename = [myRootDir '\' objects{i} '\' tifffiles(k).name];
            gray_img=imread(filename);
            feat=FeatCall(gray_img)
            %fk=[fk;feat];
            quality(k).feat=feat;
%              C2=struct2array(feat,2);
%              quality=C1(:,:,1);
             %s2=C2{k};
%              [m2,n2]=size(fk);
               
            end
            save('Fake.mat', 'quality');
           %save('Fake1.mat', 'quality');
    end
%     str = strcat('Code-',objects{i},'.txt');
%     save(str,'c','-ASCII');%  save codebook
end
