function varargout = main(varargin)
% MAIN M-file for main.fig

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @main_OpeningFcn, ...
                   'gui_OutputFcn',  @main_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end

function main_OpeningFcn(hObject, eventdata, handles, varargin)

handles.output = hObject;

guidata(hObject, handles);

function varargout = main_OutputFcn(hObject, eventdata, handles) 

varargout{1} = handles.output;


% --------------------------------------------------------------------
function mnu_file_Callback(hObject, eventdata, handles)

function mnu_feat_Callback(hObject, eventdata, handles)

global gray_img
global feat
psi = fspecial('gaussian',3,0.5);
g_gray_img = imfilter(gray_img, psi);
I=gray_img;
I_cap=g_gray_img;
subplot(1,2,1),imshow(I),title('Original');
subplot(1,2,2),imshow(I_cap),title('Gaussion Img');
psnr_v  = PeakSgnlToNoiseRatio( I,I_cap );
ad_v  = AvgDiff( I,I_cap );
mse_v  = MeanSqrdErr( I,I_cap );
nae_v  = NrmlzdAbsltErr( I,I_cap );
sc_v  = StrctrlContent( I,I_cap );
snr_v  = SgnlToNoiseRatio( I,I_cap );
md_v  = MaxDiff( I,I_cap );
feat=[psnr_v,ad_v,mse_v,nae_v,sc_v,snr_v,md_v];
figure,plot(feat),xlabel('Features Set'),ylabel('Feature Value'),title('Features');
msgbox(strcat('Features Set = ',num2str(feat)));
% --------------------------------------------------------------------
function mnu_classify_Callback(hObject, eventdata, handles)

global feat
global inp_img
subplot(1,1,1)
cla     %Clear current axes
res=dir('*.mat');
for fid=1:size(res,1)
    load (res(fid).name);
    nam{fid}=res(fid).name;
    if fid==1
        train1=quality(1).feat;
        for j=2:length(quality)
        train1=[train1;quality(j).feat];
        end
        group=ones(length(quality),1)*fid;
    else
        for j=1:length(quality)
        train1=[train1;quality(j).feat];
        end
        group=[group;ones(length(quality),1)*fid];
    end
    
end
svmStruct = svmtrain(train1,group);
class = svmclassify(svmStruct,feat);
pro_name=nam{class};
subplot(1,1,1),
imshow(inp_img),title('Classifiction');
hold on
text(size(inp_img,2)-10,size(inp_img,1)-5,pro_name,'BackgroundColor',[.7 .9 .7])


% --------------------------------------------------------------------
function mnu_load_Callback(hObject, eventdata, handles)

global inp_img gray_img
subplot(1,1,1)
imshow([])
cla
[file path] = uigetfile({'*.png';'*.jpg';'*.bmp';'*.tif'},'Select a Color Image');

if(path) 
    inp_img=imread([path file]);
    subplot(1,1,1),
    imshow(inp_img)
    if(size(size(inp_img),2)>2)
        gray_img=rgb2gray(inp_img);
    else
        gray_img=inp_img;
    end
end

% --------------------------------------------------------------------
function mnu_exit_Callback(hObject, eventdata, handles)

clc
clear all
close all
return


function figure1_CloseRequestFcn(hObject, eventdata, handles)

delete(hObject);
clc
clear all
close all
return


% --------------------------------------------------------------------
function mnu_addtrain_Callback(hObject, eventdata, handles)

folder_name = uigetdir();
addtrain(folder_name);