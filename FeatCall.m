function feat = FeatCall(inp_img)
%inp_img=imread('C:\Users\Abc\Documents\MATLAB\PROJECT\QA\Train\Fake.png');
%     global gray_img
%     global feat
    if(size(size(inp_img),2)>2)
            gray_img=rgb2gray(inp_img);
        else
            gray_img=inp_img;
        end
    psi = fspecial('gaussian',3,0.5);
    g_gray_img = imfilter(gray_img, psi);
    I=gray_img;
    I_cap=g_gray_img;
    %subplot(1,2,1),imshow(I),title('Original');
    %subplot(1,2,2),imshow(I_cap),title('Gaussion Img');
    psnr_v  = PeakSgnlToNoiseRatio( I,I_cap );
    ad_v  = AvgDiff( I,I_cap );
    mse_v  = MeanSqrdErr( I,I_cap );
    nae_v  = NrmlzdAbsltErr( I,I_cap );
    sc_v  = StrctrlContent( I,I_cap );
    snr_v  = SgnlToNoiseRatio( I,I_cap );
    md_v  = MaxDiff( I,I_cap );
    feat=[psnr_v,ad_v,mse_v,nae_v,sc_v,snr_v,md_v];
    %imshow(feat);
    % figure,plot(feat),xlabel('Features Set'),ylabel('Feature Value'),title('Features');
     %msgbox(strcat('Features Set = ',num2str(feat)));
    
end