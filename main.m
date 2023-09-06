clear;clc;
%% 读取图像
[FileName,PathName,FilterIndex] = uigetfile({'*.jpg;*.tif;*.png;*.jpeg;*.gif', ...
    '所有图像文件';...
    '*.*','所有文件' },'载入数字图像',...
    '.\\image');
 
if isequal(FileName, 0) || isequal(PathName, 0)
    return;
end
fileName = fullfile(PathName, FileName);
%% 图像预处理
image_small=imread(fileName);%欲缩小图像
image=image_small;%备份原图像
image_small=imresize(image_small,0.1);%将原图像缩小10倍
I1=rgb2ycbcr(image_small);%将原图像转化到YcbCr颜色空间
%% 计算原图像的概率密度图，阈值0.7
I1=double(I1);
%Cb：反映的是RGB输入信号蓝色部分与RGB信号亮度值之间的差异。
% Cr：反映了RGB输入信号红色部分与RGB信号亮度值之间的差异。
cb=I1(:,:,2);
cr=I1(:,:,3);
mu=[117.44 157.56]';
% sig=[299.46 12.14;12.14 160.13];
sig = [160.13,12.14;12.14,299.46];
%首先缩小10倍
%返回肤色概率图
image_Probability_diagram=drawGaussian(mu,sig,cb(:),cr(:));
image_Probability_diagram=reshape(image_Probability_diagram,size(cb));
p1 = image_Probability_diagram > 0.7;
p2=imresize(p1,10);
%结构元素
se1 = strel('disk',15);
%闭运算
f1 = imclose(p2,se1);
%% 绘制脸部
[L,num]=bwlabel(f1);
STATS = regionprops(L,'BoundingBox');%存储所有可能为人脸的区域
figure,
subplot(3,2,1),imshow(image_small),title('缩小10倍后的原图像');
subplot(3,2,2),imshow(image_Probability_diagram),title('YCbCr处理(初步)');
subplot(3,2,3),imshow(p1);title('进一步阈值处理');
subplot(3,2,4),imshow(p2);title('放大10倍后的处理图像')
subplot(3,2,5),imshow(f1);title('数学形态处理（闭运算）');
subplot(3,2,6),imshow(image);title('原图像脸部标记');
% for j = 1:num
%    rectangle('Position',STATS(j).BoundingBox,'EdgeColor','r'); 
% end
facebox = [];%存储所有的人脸
for j = 1:num
    if (STATS(j).BoundingBox(3)*STATS(j).BoundingBox(4) > 10000)%筛选面积
        rectangle('Position',STATS(j).BoundingBox,'EdgeColor','r'); 
        facebox = [facebox;STATS(j).BoundingBox(1),STATS(j).BoundingBox(2)...
            STATS(j).BoundingBox(3),STATS(j).BoundingBox(4)];
    end
end
facebox = floor(facebox);
%Y(facebox(i,2):facebox(i,2)+facebox(i,4),facebox(i,1):facebox(i,1)+facebox(i,3),:)
%脸部区域的切片
