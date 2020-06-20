function [ sucess ] = addtrain(folder_name)

res=dir(fullfile(folder_name,'\*.png'));
quality(1:size(res,1))...
    =struct('feat',zeros(1,4));
h_wait = waitbar(0,'Wait..');
set(h_wait,'Name','Processing..');
for i=1:size(res,1)
    waitbar(i/size(res,1));
    inp_img=imread(fullfile(folder_name,res(i).name));
    if(size(size(inp_img),2)>2)
    gray_img=rgb2gray(inp_img);
    else
    gray_img=inp_img;
    end
psi = fspecial('gaussian',3,0.5);
g_gray_img = imfilter(gray_img, psi);
I=gray_img;
I_cap=g_gray_img;
psnr_v  = PeakSgnlToNoiseRatio( I,I_cap );
ad_v  = AvgDiff( I,I_cap );
mse_v  = MeanSqrdErr( I,I_cap );
nae_v  = NrmlzdAbsltErr( I,I_cap );
sc_v  = StrctrlContent( I,I_cap );
snr_v  = SgnlToNoiseRatio( I,I_cap );
md_v  = MaxDiff( I,I_cap );
feat=[psnr_v,ad_v,mse_v,nae_v,sc_v,snr_v,md_v];
 quality(i).feat=feat;
end
% Close waitbar.
close(h_wait);
split_c={''};
%split_c=strsplit(folder_name,'\');
s_name=split_c{end};

prompt = {'Enter Train Name'};
dlg_title = 'Input';
num_lines = 1;
def = {s_name};
answer = inputdlg(prompt,dlg_title,num_lines,def);
nam=answer{1};

save(nam,'quality');
sucess=1;
end