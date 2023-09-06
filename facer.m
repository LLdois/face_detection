function varargout = facer(varargin)
% FACER MATLAB code for facer.fig
%      FACER, by itself, creates a new FACER or raises the existing
%      singleton*.
%
%      H = FACER returns the handle to a new FACER or the handle to
%      the existing singleton*.
%
%      FACER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FACER.%M with the given input arguments.
%
%      FACER('Property','Value',...) creates a new FACER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before facer_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to facer_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help facer

% Last Modified by GUIDE v2.5 15-Jun-2022 09:14:44

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @facer_OpeningFcn, ...
                   'gui_OutputFcn',  @facer_OutputFcn, ...
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
% End initialization code - DO NOT EDIT


% --- Executes just before facer is made visible.
function facer_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to facer (see VARARGIN)

% Choose default command line output for facer
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes facer wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = facer_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in SelectPicture.
function SelectPicture_Callback(hObject, eventdata, handles)
% hObject    handle to SelectPicture (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
warning off all;
% ����ͼ��
[FileName,PathName,FilterIndex] = uigetfile({'*.jpg;*.tif;*.png;*.gif', ...
    '����ͼ���ļ�';...
    '*.*','�����ļ�' },'����ͼ��',...
    '.\image');
if isequal(FileName, 0) || isequal(PathName, 0)
    return;
end
Img1 = imread(fullfile(PathName, FileName));
axes(handles.axes1);
imshow(Img1, []);
handles.Img1 = Img1;
handles.finalImage = 0;
guidata(hObject, handles);

% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2


% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --------------------------------------------------------------------
function File_Callback(hObject, eventdata, handles)
% hObject    handle to File (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function RF_Callback(hObject, eventdata, handles)
% hObject    handle to RF (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function RecognizeFace_Callback(hObject, eventdata, handles)
% hObject    handle to RecognizeFace (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
image = handles.Img1;
% faceDetector = vision.CascadeObjectDetector(); % ������������i
% % image = imread('1.jpg'); % ��ȡ�����沿��ͼ��
% 
% facebox = step(faceDetector, image); % ��ʼ��⣬������洢��facebox������
% 
% finalImage = insertShape(image, 'Rectangle', facebox,'LineWidth',5,'color','red');
%% ͼ��Ԥ����
image_small=image;%����Сͼ��
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
finalImage = image;
%��ʾYcbCr����������
axes(handles.axes8);
imshow(image_Probability_diagram, []);
%��һ����ֵ����
axes(handles.axes9);
imshow(p1, []);
%�Ŵ�10��
axes(handles.axes10);
imshow(p2, []);
%��ѧ��̬���������㣩
axes(handles.axes11);
imshow(f1, []);
%��ʾ������
axes(handles.axes2);
imshow(finalImage, []);
facebox = [];%�洢���е�����
for j = 1:num
    if (STATS(j).BoundingBox(3)*STATS(j).BoundingBox(4) > 10000)%ɸѡ���
        rectangle('Position',STATS(j).BoundingBox,'EdgeColor','r'); 
        facebox = [facebox;STATS(j).BoundingBox(1),STATS(j).BoundingBox(2)...
            STATS(j).BoundingBox(3),STATS(j).BoundingBox(4)];
    end
end
facebox = floor(facebox);
set(handles.text2, 'String', ...
    'ʶ��ɹ�');
handles.finalImage=finalImage;
handles.facebox = facebox;
guidata(hObject, handles);
function Save_Callback(hObject, eventdata, handles)
% hObject    handle to Save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Exist_Callback(hObject, eventdata, handles)
% hObject    handle to Exist (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close();

% --------------------------------------------------------------------
function Untitled_2_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function File_no_Callback(hObject, eventdata, handles)
% hObject    handle to File_no (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function RecognizeFace_no_Callback(hObject, eventdata, handles)
% hObject    handle to RecognizeFace_no (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function SaveGUI_Callback(hObject, eventdata, handles)
% hObject    handle to SaveGUI (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
SnapImage1();
set(handles.text2, 'String', ...
    '��ͼ�ɹ���');

% % --------------------------------------------------------------------
% function SavePicture_Callback(hObject, eventdata, handles)
% % hObject    handle to SavePicture (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% if isequal(handles.finalImage, 0)
%     set(handles.text2, 'String', ...
%     '���������ʶ��');
%     return;
% end
% SaveImage1(handles.finalImage);
% set(handles.text2, 'String', ...
%     '����ɹ���');


% --------------------------------------------------------------------
function SaveFaces_Callback(hObject, eventdata, handles)
% hObject    handle to SaveFaces (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if isequal(handles.finalImage, 0)
    set(handles.text2, 'String', ...
    '���������ʶ��');
    return;
end
facebox=handles.facebox; 
SaveImage2(facebox,handles.Img1);
%for i=1:facenumber
%    SaveImage1(handles.Img1(facebox(i,2):facebox(i,2)+facebox(i,4),facebox(i,1):facebox(i,1)+facebox(i,3),:));
%end
set(handles.text2, 'String', ...
    '�������������ɹ���');
