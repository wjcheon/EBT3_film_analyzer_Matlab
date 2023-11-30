function varargout = gui_generate_calcurve(varargin)
% GUI_GENERATE_CALCURVE MATLAB code for gui_generate_calcurve.fig
%      GUI_GENERATE_CALCURVE, by itself, creates a new GUI_GENERATE_CALCURVE or raises the existing
%      singleton*.
%
%      H = GUI_GENERATE_CALCURVE returns the handle to a new GUI_GENERATE_CALCURVE or the handle to
%      the existing singleton*.
%
%      GUI_GENERATE_CALCURVE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_GENERATE_CALCURVE.M with the given input arguments.
%
%      GUI_GENERATE_CALCURVE('Property','Value',...) creates a new GUI_GENERATE_CALCURVE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gui_generate_calcurve_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gui_generate_calcurve_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gui_generate_calcurve

% Last Modified by GUIDE v2.5 28-Mar-2018 20:34:59

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gui_generate_calcurve_OpeningFcn, ...
                   'gui_OutputFcn',  @gui_generate_calcurve_OutputFcn, ...
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


% --- Executes just before gui_generate_calcurve is made visible.
function gui_generate_calcurve_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gui_generate_calcurve (see VARARGIN)

% Choose default command line output for gui_generate_calcurve
handles.output = hObject;

set(hObject, 'Name', 'EbtFilmCalibrator_1.3 --- Developer: Wonjoong Cheon (wjcheon@catholic.ac.kr)');

% Update handles structure
guidata(hObject, handles);



% UIWAIT makes gui_generate_calcurve wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = gui_generate_calcurve_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pb_load_BG_images.
function pb_load_BG_images_Callback(hObject, eventdata, handles)
% hObject    handle to pb_load_BG_images (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=0;
[filename, pathname] = uigetfile({'*.tif'}, 'Select Background Images');
filelists_struct = dir(fullfile(pathname, '*.tif'));
for iter1 = 1: size(filelists_struct, 1)
    filelists{iter1} = filelists_struct(iter1).name;
end
set(handles.listbox_BG_filelists, 'String', filelists);
handles.BG_pathname = pathname;
handles.BG_filelists = filelists;
guidata(hObject, handles);


% --- Executes on button press in pb_load_IR_images.
function pb_load_IR_images_Callback(hObject, eventdata, handles)
% hObject    handle to pb_load_IR_images (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=0;
[filename, pathname] = uigetfile({'*.tif'}, 'Select Irrdiated Images');
filelists_struct = dir(fullfile(pathname, '*.tif'));
for iter1 = 1: size(filelists_struct, 1)
    filelists{iter1} = filelists_struct(iter1).name;
end
set(handles.listbox_IR_filelists, 'String', filelists);
handles.Irr_pathname = pathname;
handles.Irr_filelists = filelists;
guidata(hObject, handles);


% --- Executes on selection change in listbox_BG_filelists.
function listbox_BG_filelists_Callback(hObject, eventdata, handles)
% hObject    handle to listbox_BG_filelists (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox_BG_filelists contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox_BG_filelists
a=0;
lists_in_listbox = cellstr(get(handles.listbox_BG_filelists,'String'));
sel_val=get(handles.listbox_BG_filelists,'value');
sel_item=lists_in_listbox(sel_val);
sel_item_filename = sel_item;
handles.sel_filename_BG_listbox = sel_item_filename;
guidata(hObject, handles);




% --- Executes during object creation, after setting all properties.
function listbox_BG_filelists_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox_BG_filelists (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in listbox_IR_filelists.
function listbox_IR_filelists_Callback(hObject, eventdata, handles)
% hObject    handle to listbox_IR_filelists (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox_IR_filelists contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox_IR_filelists
lists_in_listbox = cellstr(get(handles.listbox_IR_filelists,'String'));
sel_val=get(handles.listbox_IR_filelists,'value');
sel_item=lists_in_listbox(sel_val);
sel_item_filename = sel_item;
handles.sel_filename_Irr_listbox = sel_item_filename;
guidata(hObject, handles);
%
%
BG_img = imread(fullfile(handles.BG_pathname, handles.sel_filename_BG_listbox{1}));
Irr_img = imread(fullfile(handles.Irr_pathname, handles.sel_filename_Irr_listbox{1}));
%
%
a=0
if (get(handles.radiobutton_r, 'Value') == 1)
    BG_img = BG_img(:,:,1);
    Irr_img = Irr_img(:,:,1);
    disp('r')
elseif (get(handles.radiobutton_g, 'Value') == 1)
    BG_img = BG_img(:,:,2);
    Irr_img = Irr_img(:,:,2);    
    disp('g')
elseif (get(handles.radiobutton_b, 'Value') == 1)
    BG_img = BG_img(:,:,3);
    Irr_img = Irr_img(:,:,3);
    disp('b')
elseif (get(handles.radiobutton_gray, 'Value') == 1)
    BG_img = rgb2gray(BG_img);
    Irr_img = rgb2gray(Irr_img);
    disp('gray')
end
       
figure(1), 
subplot(1,2,1), imshow(BG_img, [])
subplot(1,2,2), imshow(Irr_img, [])
%
Subtraction_img = BG_img - Irr_img;
handles.Subtraction_img = Subtraction_img;
guidata(hObject, handles);
imshow(handles.Subtraction_img, [], 'Parent', handles.axes_SubtractionImg);


% --- Executes during object creation, after setting all properties.
function listbox_IR_filelists_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox_IR_filelists (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pb_Calculate_fitting_curve.
function pb_Calculate_fitting_curve_Callback(hObject, eventdata, handles)
% hObject    handle to pb_Calculate_fitting_curve (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=0;
a=0
old_table = get(handles.uitable1,'Data');    
old_table_mat = cell2mat(old_table);
old_table_cGy = old_table_mat(:,1);
old_table_OD_mean = old_table_mat(:,2);
%
axes(handles.axes_OD2cGy), hold off
plot(old_table_OD_mean, old_table_cGy, 'r*--')
grid on

%% Fit: 'untitled fit 1'.

[xData, yData] = prepareCurveData( old_table_OD_mean, old_table_cGy );

% Set up fittype and options.
ft = fittype( 'poly3' );

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft );
% Plot fit with data.
formular_fit = formula(fitresult);
coeffnames_fit = coeffnames(fitresult);
coeffvalues_fit = coeffvalues(fitresult);
assign_symbol = '=';
for iter1 = 1:size(coeffnames_fit,1)
    coeffvalues_buffer = coeffvalues_fit(iter1);
    eval(sprintf('p%d=coeffvalues_buffer',iter1))
end

x_set= 0: max(old_table_OD_mean);
for iter2 = 1: size(x_set,2)
    x = x_set(iter2);
    eval(sprintf('y_val(%d) = eval(formular_fit);', iter2))
%     eval('a = formular_fit')
end
axes(handles.axes_OD2cGy), hold on
plot(x_set, y_val, 'b--')
   
legend('Measured data', 'Fitting data', 'Location', 'NorthWest' );
% Label axes
xlabel('Optical density:mean')
ylabel('Dose [cGy]')
grid on
xlim([0 max(old_table_OD_mean)])
ylim([0 max(old_table_cGy)])
hold off
%
%
handles.final_table = old_table_mat;
handles.fitresult = fitresult;
guidata(hObject, handles);

% --- Executes on button press in pb_save_calbration_curve.
function pb_save_calbration_curve_Callback(hObject, eventdata, handles)
% hObject    handle to pb_save_calbration_curve (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=0;
d1 = datetime('now')
d1_str = datestr(d1)
d1_str = strrep(d1_str ,' ','_')
d1_str = strrep(d1_str ,'-','_')
d1_str = strrep(d1_str ,':','_')
%
%
filename_calcurve = ['CalibrationCurve_', d1_str, '.mat']
final_calibration_data = handles.final_table;
fitresult = handles.fitresult;
uisave({'final_calibration_data', 'fitresult'}, filename_calcurve)






% --- Executes on button press in pb_generate_roi_box.
function pb_generate_roi_box_Callback(hObject, eventdata, handles)
% hObject    handle to pb_generate_roi_box (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=0;
current_roi = [];
colormap_set = 'jet'
mean_val = [];
std_val = [];
Subtraction_img = handles.Subtraction_img;

h = imrect(handles.axes_SubtractionImg,[10 10 100 100]);
addNewPositionCallback(h,@(p) title(mat2str(p,3)));
addNewPositionCallback(h, @(p) yourCallbackFunction(p, handles));
% addNewPositionCallback(h,@(p) disp(p))
% addNewPositionCallback(h,@(p) eval('handles.current_roi = imcrop(handles.Subtraction_img, p);'));
% addNewPositionCallback(h,@(p) eval('mean_val = mean2(imcrop(handles.Subtraction_img, p));'));
% addNewPositionCallback(h,@(p) eval('std_val = std2(imcrop(handles.Subtraction_img, p));'));
% addNewPositionCallback(h,@(p) eval('axes(handles.axes_ZoomIn), imshow(handles.current_roi, []), colormap(colormap_set)'));
% addNewPositionCallback(h,@(p) set(handles.edit_mean_val, 'string', mean2(imcrop(handles.Subtraction_img, p))))
% addNewPositionCallback(h,@(p) set(handles.edit_std_val, 'string', std2(imcrop(handles.Subtraction_img, p))))
% addNewPositionCallback(h,@(p) eval('handles.mean_val = mean2(imcrop(handles.Subtraction_img, p))'))
% addNewPositionCallback(h,@(p) eval('handles.std_val = std2(imcrop(handles.Subtraction_img, p))'))
% cGy_input = get(handles.edit_cGy_input, 'string');
%
% handles.cGy_val = str2double(cGy_input);
handles.instance_roibox = h;
guidata(hObject, handles);

function yourCallbackFunction(p, handles)
    % p�� ����Ͽ� �ʿ��� �۾� ����
    % ��: �̹������� ���õ� ������ �ڸ���
    croppedImage = imcrop(handles.Subtraction_img, p);

    % ���� �����͸� GUI�� �ݿ�
    % ��: ��հ� ǥ������ ǥ��
    mean_val = mean2(croppedImage);
    std_val = std2(croppedImage);
    set(handles.edit_mean_val, 'String', num2str(mean_val));
    set(handles.edit_std_val, 'String', num2str(std_val));
    axes(handles.axes_ZoomIn), imshow(croppedImage, []), colormap(handles.axes_ZoomIn, 'jet')



function edit_roibox_width_Callback(hObject, eventdata, handles)
% hObject    handle to edit_roibox_width (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_roibox_width as text
%        str2double(get(hObject,'String')) returns contents of edit_roibox_width as a double


% --- Executes during object creation, after setting all properties.
function edit_roibox_width_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_roibox_width (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_roibox_height_Callback(hObject, eventdata, handles)
% hObject    handle to edit_roibox_height (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_roibox_height as text
%        str2double(get(hObject,'String')) returns contents of edit_roibox_height as a double


% --- Executes during object creation, after setting all properties.
function edit_roibox_height_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_roibox_height (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_mean_val_Callback(hObject, eventdata, handles)
% hObject    handle to edit_mean_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_mean_val as text
%        str2double(get(hObject,'String')) returns contents of edit_mean_val as a double


% --- Executes during object creation, after setting all properties.
function edit_mean_val_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_mean_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_std_val_Callback(hObject, eventdata, handles)
% hObject    handle to edit_std_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_std_val as text
%        str2double(get(hObject,'String')) returns contents of edit_std_val as a double


% --- Executes during object creation, after setting all properties.
function edit_std_val_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_std_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_cGy_input_Callback(hObject, eventdata, handles)
% hObject    handle to edit_cGy_input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_cGy_input as text
%        str2double(get(hObject,'String')) returns contents of edit_cGy_input as a double


% --- Executes during object creation, after setting all properties.
function edit_cGy_input_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_cGy_input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pb_caldata_take.
function pb_caldata_take_Callback(hObject, eventdata, handles)
% hObject    handle to pb_caldata_take (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=0;
raw_table = get(handles.uitable1,'Data');

s_check = 0;
for k = 1 : size(raw_table,1)
    if ~isempty(raw_table{k,1})
        s_check = k;
        break;
    end
end

Table = cell(1,2);
cGy_val = str2double(get(handles.edit_cGy_input, 'string'));
OD_mean_val = str2double(get(handles.edit_mean_val, 'string'));
Table{1,1} = cGy_val ;
Table{1,2} = OD_mean_val;

if s_check == 0
    new_table = Table;
else
    if ~isempty(find([raw_table{:}] == cGy_val, 1))
        index_cGy = find([raw_table{:}] == cGy_val);
        index_cGy = index_cGy(1)
        raw_table{index_cGy, 1} = cGy_val;
        raw_table{index_cGy, 2} = OD_mean_val;
        new_table = raw_table;
        disp('working')
    else
        new_table = [raw_table;Table];
    end
end

new_table = sortrows(new_table);
set(handles.uitable1,'Data',new_table)
%
%
% Draw table 
table_mat = cell2mat(new_table);
cGy_table = table_mat(:,1);
OD_mean_table = table_mat(:,2);
axes(handles.axes_OD2cGy), hold off
plot(OD_mean_table, cGy_table, 'r*--')
grid on
guidata(hObject, handles);







% --- Executes on button press in pb_caldata_delete.
function pb_caldata_delete_Callback(hObject, eventdata, handles)
% hObject    handle to pb_caldata_delete (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

aa =0
if ~isempty(handles.datatable_row)
    old_table = get(handles.uitable1,'Data');    
    old_table(handles.datatable_row,:) = [];
    old_table = sortrows(old_table);
    set(handles.uitable1,'Data',old_table);
    guidata(hObject, handles);
else
    old_table = get(handles.uitable1,'Data');
    sz_old_table = size(old_table,1);
    old_table(sz_old_table,:) = [];
    old_table = sortrows(old_table);
    set(handles.uitable1,'Data',old_table);
    guidata(hObject, handles);
end

% Draw table 
table_mat = cell2mat(old_table);
cGy_table = table_mat(:,1);
OD_mean_table = table_mat(:,2);
axes(handles.axes_OD2cGy), hold off
plot(OD_mean_table, cGy_table, 'r*--')
grid on


% --- Executes on button press in pb_set_roi_parameters.
function pb_set_roi_parameters_Callback(hObject, eventdata, handles)
% hObject    handle to pb_set_roi_parameters (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=0;
h_imrect = handles.instance_roibox;
current_pos = h_imrect.getPosition;
%
roibox_width = str2double(get(handles.edit_roibox_width, 'String'));
roibox_height = str2double(get(handles.edit_roibox_height, 'String'));
new_pos = current_pos;
new_pos(3) = roibox_width
new_pos(4) = roibox_height
h_imrect.setPosition(new_pos)


% --- Executes when selected cell(s) is changed in uitable1.
function uitable1_CellSelectionCallback(hObject, eventdata, handles)
% hObject    handle to uitable1 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Indices: row and column indices of the cell(s) currently selecteds
% handles    structure with handles and user data (see GUIDATA)

handles.datatable_row = eventdata.Indices(1);
handles.datatable_col = eventdata.Indices(2);
guidata(hObject, handles);


% --- Executes when entered data in editable cell(s) in uitable1.
function uitable1_CellEditCallback(hObject, eventdata, handles)
% hObject    handle to uitable1 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Indices: row and column indices of the cell(s) edited
%	PreviousData: previous data for the cell(s) edited
%	EditData: string(s) entered by the user
%	NewData: EditData or its converted form set on the Data property. Empty if Data was not changed
%	Error: error string when failed to convert EditData to appropriate value for Data
% handles    structure with handles and user data (see GUIDATA)
a=0
new_table = get(handles.uitable1,'Data');
new_table = sortrows(new_table);
set(handles.uitable1,'Data',new_table)
%
new_table_mat = cell2mat(new_table)
OD_mean_table = new_table_mat(:,1)
cGy_table = new_table_mat(:,2)
axes(handles.axes_OD2cGy), hold off
plot(OD_mean_table, cGy_table, 'r*--')
grid on
guidata(hObject, handles);
