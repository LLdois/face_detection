function SaveImage2(Img,Image)
imagesPath = '.\\faces';
if ~exist(imagesPath, 'dir')
    mkdir(imagesPath);
end
[facenumber,~] = size(Img);
[FileName,PathName,FilterIndex] = uiputfile({'*.jpg;*.tif;*.png;*.gif','All Image Files';...
          '*.*','All Files' },'±£¥Ê¡≥≤ø’’∆¨',...
          '.\\faces\\face.jpg');
if isequal(FileName, 0) || isequal(PathName, 0)
    return;
end
Size = size(FileName);
for i=1:facenumber
    fileStr = fullfile(PathName, [FileName(1:4),num2str(i),'.jpg']);
    imwrite(Image(Img(i,2):Img(i,2)+Img(i,4),Img(i,1):Img(i,1)+Img(i,3),:),fileStr);
end

