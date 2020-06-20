% function hists =  trainHist()

myRootDir = 'C:\Users\Abc\Documents\MATLAB\PROJECT\siftDemoV4\ItaldataTrain';
objects = {'Ecoflex' 'Gelatine' 'Latex' 'Live' 'Modasil' 'WoodGlue'};

des=[];

cent = load('FullCode.txt');
hists = [];
lbl = [];
 for i = 1:length(objects)
%      length(objects) % 2: Apple, Bird
    tifffiles = dir([myRootDir '\' objects{i} '\*.png']);
    
    h = zeros(numel(tifffiles),6*15); 

    
    for k = 1: length(tifffiles)
%         length(tifffiles)
        filename = [myRootDir '\' objects{i} '\' tifffiles(k).name];
        [image, descriptors, locs] = sift(filename);
        
        
        for key = 1 : size(descriptors,1)
            des = descriptors(key,:);
            for j=1:size(cent,1)
            d(j) = norm(des-cent(j,:));
            end
            [elt,ind] = min(d);
%             disp(ind);
            h(k,ind) = h(k,ind) + 1;
        end
        
    end
    hists = [hists;h];
    lbl = [lbl;ones(numel(tifffiles),1)*i];  
end

 hists = [hists lbl];
%  hi=hists';
%  hi=flipud(hists);
  save('FullCodeLbl.txt','hists','-ASCII');
%   save('histSift8.txt','hists','-ASCII');

xlswrite('data_sift.xlsx',hists);
 