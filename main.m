clear;clc;
%% ��ȡͼ��
[FileName,PathName,FilterIndex] = uigetfile({'*.jpg;*.tif;*.png;*.jpeg;*.gif', ...
    '����ͼ���ļ�';...
    '*.*','�����ļ�' },'��������ͼ��',...
    '.\\image');
 
if isequal(FileName, 0) || isequal(PathName, 0)
    return;
end
fileName = fullfile(PathName, FileName);
%% ͼ��Ԥ����
image_small=imread(fileName);%����Сͼ��
image=image_small;%����ԭͼ��
image_small=imresize(image_small,0.1);%��ԭͼ����С10��
I1=rgb2ycbcr(image_small);%��ԭͼ��ת����YcbCr��ɫ�ռ�
%% ����ԭͼ��ĸ����ܶ�ͼ����ֵ0.7
I1=double(I1);
%Cb����ӳ����RGB�����ź���ɫ������RGB�ź�����ֵ֮��Ĳ��졣
% Cr����ӳ��RGB�����źź�ɫ������RGB�ź�����ֵ֮��Ĳ��졣
cb=I1(:,:,2);
cr=I1(:,:,3);
mu=[117.44 157.56]';
% sig=[299.46 12.14;12.14 160.13];
sig = [160.13,12.14;12.14,299.46];
%������С10��
%���ط�ɫ����ͼ
image_Probability_diagram=drawGaussian(mu,sig,cb(:),cr(:));
image_Probability_diagram=reshape(image_Probability_diagram,size(cb));
p1 = image_Probability_diagram > 0.7;
p2=imresize(p1,10);
%�ṹԪ��
se1 = strel('disk',15);
%������
f1 = imclose(p2,se1);
%% ��������
[L,num]=bwlabel(f1);
STATS = regionprops(L,'BoundingBox');%�洢���п���Ϊ����������
figure,
subplot(3,2,1),imshow(image_small),title('��С10�����ԭͼ��');
subplot(3,2,2),imshow(image_Probability_diagram),title('YCbCr����(����)');
subplot(3,2,3),imshow(p1);title('��һ����ֵ����');
subplot(3,2,4),imshow(p2);title('�Ŵ�10����Ĵ���ͼ��')
subplot(3,2,5),imshow(f1);title('��ѧ��̬���������㣩');
subplot(3,2,6),imshow(image);title('ԭͼ���������');
% for j = 1:num
%    rectangle('Position',STATS(j).BoundingBox,'EdgeColor','r'); 
% end
facebox = [];%�洢���е�����
for j = 1:num
    if (STATS(j).BoundingBox(3)*STATS(j).BoundingBox(4) > 10000)%ɸѡ���
        rectangle('Position',STATS(j).BoundingBox,'EdgeColor','r'); 
        facebox = [facebox;STATS(j).BoundingBox(1),STATS(j).BoundingBox(2)...
            STATS(j).BoundingBox(3),STATS(j).BoundingBox(4)];
    end
end
facebox = floor(facebox);
%Y(facebox(i,2):facebox(i,2)+facebox(i,4),facebox(i,1):facebox(i,1)+facebox(i,3),:)
%�����������Ƭ
