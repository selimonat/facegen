function ResizeImages(f,factor)



%create the target folder if not existing
imfolder_target = sprintf('%s%sresized_%02g%s',f,filesep,factor*10,filesep);
if exist(imfolder_target) == 0
    mkdir(imfolder_target);
end
%%
for imname = ListFiles([f '*.bmp'])'
    im = imresize(imread(  sprintf('%s%s',f,imname{1}) )  ,factor,'bilinear');
    imwrite(im,sprintf('%s%s',imfolder_target,imname{1}));
end
