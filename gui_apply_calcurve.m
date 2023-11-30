function varargout = gui_apply_calcurve(varargin)
% gui_apply_calcurve MATLAB code for gui_apply_calcurve.fig
%      gui_apply_calcurve, by itself, creates a new gui_apply_calcurve or raises the existing
%      singleton*.
%
%      H = gui_apply_calcurve returns the handle to a new gui_apply_calcurve or the handle to
%      the existing singleton*.
%
%      gui_apply_calcurve('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in gui_apply_calcurve.M with the given input arguments.
%
%      gui_apply_calcurve('Property','Value',...) creates a new gui_apply_calcurve or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gui_apply_calcurve_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gui_apply_calcurve_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gui_apply_calcurve

% Last Modified by GUIDE v2.5 29-Mar-2018 13:49:02

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gui_apply_calcurve_OpeningFcn, ...
                   'gui_OutputFcn',  @gui_apply_calcurve_OutputFcn, ...
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


% --- Executes just before gui_apply_calcurve is made visible.
function gui_apply_calcurve_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gui_apply_calcurve (see VARARGIN)

% Choose default command line output for gui_apply_calcurve
handles.output = hObject;

% Initialise tabs
handles.tabManager = TabManager( hObject );
set(hObject, 'Name', 'EbtFilmAnalyzer_1.3 --- Developer: Wonjoong Cheon (wjcheon@catholic.ac.kr)');

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes gui_apply_calcurve wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = gui_apply_calcurve_OutputFcn(hObject, eventdata, handles) 
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
set(handles.listbox_IR_filelist, 'String', filelists);
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


% --- Executes on selection change in listbox_IR_filelist.
function listbox_IR_filelist_Callback(hObject, eventdata, handles)
% hObject    handle to listbox_IR_filelist (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox_IR_filelist contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox_IR_filelist
lists_in_listbox = cellstr(get(handles.listbox_IR_filelist,'String'));
sel_val=get(handles.listbox_IR_filelist,'value');
sel_item=lists_in_listbox(sel_val);
sel_item_filename = sel_item;
handles.sel_filename_Irr_listbox = sel_item_filename;
guidata(hObject, handles);
%
%
BG_img = imread(fullfile(handles.BG_pathname, handles.sel_filename_BG_listbox{1}));
Irr_img = imread(fullfile(handles.Irr_pathname, handles.sel_filename_Irr_listbox{1}));
% Irr_img_info = imageinfo(fullfile(handles.Irr_pathname, handles.sel_filename_Irr_listbox{1}));
%
%
% a=0;
if (get(handles.radiobutton_r, 'Value') == 1)
    BG_img = BG_img(:,:,1);
    Irr_img = Irr_img(:,:,1);
%     disp('r')
%     disp('what?')
elseif (get(handles.radiobutton_g, 'Value') == 1)
    BG_img = BG_img(:,:,2);
    Irr_img = Irr_img(:,:,2);    
%     disp('g')
elseif (get(handles.radiobutton_b, 'Value') == 1)
    BG_img = BG_img(:,:,3);
    Irr_img = Irr_img(:,:,3);
%     disp('b')
elseif (get(handles.radiobutton_gray, 'Value') == 1)
    BG_img = rgb2gray(BG_img);
    Irr_img = rgb2gray(Irr_img);
%     disp('gray')
end
       
figure(1),
subplot(1,2,1), imshow(BG_img, []),  title('Left: Background')
subplot(1,2,2), imshow(Irr_img, []), title('Right: Irradiated')

%
Subtraction_img = BG_img - Irr_img;
handles.Subtraction_img = Subtraction_img;
guidata(hObject, handles);
imshow(handles.Subtraction_img, [], 'Parent', handles.axes_SubtractionImg);


% --- Executes during object creation, after setting all properties.
function listbox_IR_filelist_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox_IR_filelist (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pb_load_calibration_curve.
function pb_load_calibration_curve_Callback(hObject, eventdata, handles)
% hObject    handle to pb_load_calibration_curve (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=0;

[filename, pathname] = uigetfile({'*.mat'},' Select calibratoin curve ')
calibration_result = load(fullfile(pathname, filename))   % 231129
% calibration_result = open(fullfile(pathname, filename))  % not working on
% deployed application
calibration_raw_data = calibration_result.final_calibration_data;
calibration_fit_result = calibration_result.fitresult;


% Set up fittype and options.
ft = fittype( 'poly3' );

% % Fit model to data.    231129 for new fit
% old_table_OD_mean = calibration_raw_data(:,2);
% old_table_cGy = calibration_raw_data(:,1);
% [xData, yData] = prepareCurveData( old_table_OD_mean, old_table_cGy );
% [fitresult, gof] = fit( xData, yData, ft );
% % Plot fit with data.
% calibration_fit_result = fitresult;
coeff_calib = coeffvalues(calibration_fit_result);
c = cfit(ft,coeff_calib(1),coeff_calib(2), coeff_calib(3), coeff_calib(4))
% c = fitresult;
%
cla(handles.axes_calibratioin_curve)
axes(handles.axes_calibratioin_curve), grid on

%hold on  % not working deployed application

hold(handles.axes_calibratioin_curve,'on');
h2 = plot(handles.axes_calibratioin_curve, calibration_raw_data(:,2), calibration_raw_data(:,1), 'b--.')
axes(handles.axes_calibratioin_curve), h1 = plot(c),   % can not use for standard alone

legend([h1, h2], {'fitted curve', 'measured data'})
% legend([h2], {'measured data'})
xlim([0, max(calibration_raw_data(:,2))])
ylim([0, max(calibration_raw_data(:,1))])
xlabel('Optical density')
ylabel('Dose [cGy]')
hold(handles.axes_calibratioin_curve,'off');

%
coeff_calib = coeffvalues(calibration_fit_result);
handles.p1 = coeff_calib(1);
handles.p2 = coeff_calib(2);
handles.p3 = coeff_calib(3);
handles.p4 = coeff_calib(4);
handles.formula = formula(calibration_fit_result);
handles.fitresult = calibration_fit_result;
% axes(handles.axes_calibratioin_curve), hold off
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

h = imrect(handles.axes_DoseDistribution,[10 10 100 100]);
addNewPositionCallback(h,@(p) title(mat2str(p,3)));
% addNewPositionCallback(h,@(p) disp(p))
addNewPositionCallback(h,@(p) eval('current_roi = imcrop(handles.Subtraction_img, p);'));
addNewPositionCallback(h,@(p) eval('mean_val = mean2(imcrop(handles.Subtraction_img, p));'));
addNewPositionCallback(h,@(p) eval('std_val = std2(imcrop(handles.Subtraction_img, p));'));
addNewPositionCallback(h,@(p) eval('axes(handles.axes_ZoomIn), imshow(current_roi, []), colormap(colormap_set)'));
addNewPositionCallback(h,@(p) set(handles.edit_mean_val, 'string', mean2(imcrop(handles.Subtraction_img, p))))
addNewPositionCallback(h,@(p) set(handles.edit_std_val, 'string', std2(imcrop(handles.Subtraction_img, p))))
addNewPositionCallback(h,@(p) eval('handles.mean_val = mean2(imcrop(handles.Subtraction_img, p))'))
addNewPositionCallback(h,@(p) eval('handles.std_val = std2(imcrop(handles.Subtraction_img, p))'))
cGy_input = get(handles.edit_cGy_input, 'string');
%
handles.cGy_val = str2double(cGy_input);
handles.instance_roibox = h;
guidata(hObject, handles);



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


% --- Executes on button press in pb_apply_calibration_curve.
function pb_apply_calibration_curve_Callback(hObject, eventdata, handles)
% hObject    handle to pb_apply_calibration_curve (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=0;
set(handles.figure1, 'HandleVisibility', 'off');
close all;
set(handles.figure1, 'HandleVisibility', 'on');

SubtractionImg = double(handles.Subtraction_img);
fitresult = handles.fitresult;
formula_cal = formula(fitresult)
%
formula_cal = strrep(formula_cal, 'p1', num2str(handles.p1));
formula_cal = strrep(formula_cal, 'p2', num2str(handles.p2));
formula_cal = strrep(formula_cal, 'p3', num2str(handles.p3));
formula_cal = strrep(formula_cal, 'p4', num2str(handles.p4));
formula_cal = strrep(formula_cal, '*', '.*');
%
fn_calibration_curve = str2func(['@(x)' formula_cal])
%
%
SubtractionImg_onevec = SubtractionImg(:);
[sx, sy] = size(SubtractionImg);
Dose_onevec = SubtractionImg_onevec.*0;
for iter1 = 1:size(SubtractionImg_onevec ,1)
    Dose_onevec(iter1) = fn_calibration_curve(SubtractionImg_onevec(iter1));    
end
DoseDistribution = reshape(Dose_onevec, [sx, sy]);
% figure, imshow(DoseDistribution,[])
cla(handles.axes_DoseDistribution)
axes(handles.axes_DoseDistribution), hold off
imshow(DoseDistribution, []), colormap('jet'), colorbar
handles.DoseDistribution = DoseDistribution;
%
%
% debug
% figure(100)
% imshow(DoseDistribution, []), colormap('jet'), colorbar
%
% initialization
handles.Dosemap_align = [];
handles.Dosemap_crop = []
%
guidata(hObject, handles);
h = msgbox('Operation Completed');






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
axes(handles.axes_calibratioin_curve), hold off
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
axes(handles.axes_calibratioin_curve), hold off
plot(OD_mean_table, cGy_table, 'r*--')
grid on
guidata(hObject, handles);


% --- Executes on button press in pb_horizontal_profile.
function pb_horizontal_profile_Callback(hObject, eventdata, handles)
% hObject    handle to pb_horizontal_profile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=0     
current_pos = [];
current_vertical_line = [];
vertical_plot_op = 'r--';
horizontal_plot_op = 'b--';
colormap_set = 'jet'
% target_dosemap 
target_dosemap = getimage(handles.axes_DoseDistribution);
% figure, imshow(target_dosemap , []), colormap('jet')

h = impoint(handles.axes_DoseDistribution,[100 100]);
addNewPositionCallback(h,@(p) title([num2str(target_dosemap(round(p(2)),round(p(1))),6), ' cGy']));
% addNewPositionCallback(h,@(p) eval('title(num2str(target_dosemap(round(p(2)),round(p(1))),3))'));
% addNewPositionCallback(h,@(p) disp(p))
% addNewPositionCallback(h,@(p) disp(round(p(1))))
% addNewPositionCallback(h,@(p) eval('current_pos = p'))
%
% % horizontal line
% addNewPositionCallback(h,@(p) eval('axes(handles.axes_tab_plot_horizontal), plot(target_dosemap(round(p(2)),:), horizontal_plot_op), grid on'))
% % vertical line
% addNewPositionCallback(h,@(p) eval('axes(handles.axes_tab_plot_vertical), plot(target_dosemap(:,round(p(1))), vertical_plot_op), grid on'))

% horizontal 
addNewPositionCallback(h,@(p) yourCallbackFunction_drawProfile(p, target_dosemap, handles));


function yourCallbackFunction_drawProfile(p, target_dosemap, handles)
    % p�� ����Ͽ� �ʿ��� �۾� ����
    % ��: �̹������� ���õ� ������ �ڸ���
    vertical_plot_op = 'r--';
    horizontal_plot_op = 'b--';
    axes(handles.axes_tab_plot_horizontal), plot(target_dosemap(round(p(2)),:), horizontal_plot_op), grid on
    axes(handles.axes_tab_plot_vertical), plot(target_dosemap(:,round(p(1))), vertical_plot_op), grid on
    axes(handles.axes_DoseDistribution), title([num2str(target_dosemap(round(p(2)),round(p(1))),6), ' cGy']);
    


% addNewPositionCallback(h,@(p) eval('current_roi = imcrop(handles.Subtraction_img, p);'));
% addNewPositionCallback(h,@(p) eval('mean_val = mean2(imcrop(handles.Subtraction_img, p));'));
% addNewPositionCallback(h,@(p) eval('std_val = std2(imcrop(handles.Subtraction_img, p));'));
% addNewPositionCallback(h,@(p) eval('axes(handles.axes_ZoomIn), imshow(current_roi, []), colormap(colormap_set)'));
% addNewPositionCallback(h,@(p) set(handles.edit_mean_val, 'string', mean2(imcrop(handles.Subtraction_img, p))))
% addNewPositionCallback(h,@(p) set(handles.edit_std_val, 'string', std2(imcrop(handles.Subtraction_img, p))))
% addNewPositionCallback(h,@(p) eval('handles.mean_val = mean2(imcrop(handles.Subtraction_img, p))'))
% addNewPositionCallback(h,@(p) eval('handles.std_val = std2(imcrop(handles.Subtraction_img, p))'))
% cGy_input = get(handles.edit_cGy_input, 'string');
% %
% handles.cGy_val = str2double(cGy_input);
% handles.instance_roibox = h;
% guidata(hObject, handles);




% --- Executes on button press in pb_vertical_profile.
function pb_vertical_profile_Callback(hObject, eventdata, handles)
% hObject    handle to pb_vertical_profile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pb_dose_rot_ccw.
function pb_dose_rot_ccw_Callback(hObject, eventdata, handles)
    % hObject    handle to pb_dose_rot_ccw (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
a=0;
if isempty(handles.Dosemap_crop)
    figure(2), 
    imshow(handles.DoseDistribution, []), colormap('jet')
    h = imline;
    pause
    GetLinePosition = h.getPosition;
    Coordi1 = GetLinePosition(2,:) - GetLinePosition(1,:);
    Coordi2 = [1 0];
    degree_line = CalRotationDegree(Coordi1,Coordi2);
    Dosemap_align = imrotate(handles.Subtraction_img, 1*degree_line);
    handles.Dosemap_align = Dosemap_align;
else
    figure(2), hold off
    imshow(handles.Dosemap_crop, []), colormap('jet')
    h = imline;
    pause
    GetLinePosition = h.getPosition;
    Coordi1 = GetLinePosition(2,:) - GetLinePosition(1,:);
    Coordi2 = [1 0];
    degree_line = CalRotationDegree(Coordi1,Coordi2);
    Dosemap_align = imrotate(handles.Dosemap_crop, 1*degree_line);
    %
    handles.Dosemap_align = Dosemap_align;
    figure, imshow(Dosemap_align, []), colormap('jet')
end
%
%
axes(handles.axes_DoseDistribution)
imshow(Dosemap_align, []), colormap('jet'), colorbar
%
axes(handles.axes_tab_figure)
imshow(handles.Dosemap_align, []), colormap('jet'), colorbar
%
guidata(hObject, handles);




% --- Executes on button press in pb_dose_crop.
function pb_dose_crop_Callback(hObject, eventdata, handles)
% hObject    handle to pb_dose_crop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=0;
if isempty(handles.Dosemap_align)
    figure(2), 
    imshow(handles.DoseDistribution, []), colormap('jet')
    Dosemap_crop = imcrop();
    handles.Dosemap_crop = Dosemap_crop;
else
    figure(2), 
    imshow(handles.Dosemap_align, []), colormap('jet')
    Dosemap_crop = imcrop();
    handles.Dosemap_crop = Dosemap_crop;
end
axes(handles.axes_DoseDistribution)
imshow(handles.Dosemap_crop, []), colormap('jet'), colorbar
%
axes(handles.axes_tab_figure)
imshow(handles.Dosemap_crop, []), colormap('jet'), colorbar
%
guidata(hObject, handles);





% --- Executes on button press in pushbutton13.
function pushbutton13_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pb_save_dosemap2rit.
function pb_save_dosemap2rit_Callback(hObject, eventdata, handles)
% hObject    handle to pb_save_dosemap2rit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=0;
dpi_op = 72;
inch2cm = 2.54;
pixel_size = inch2cm/dpi_op;
%
%
% img2rit( B_align_cGy ,17.25,fullfile(result_save_path, [FileName_import_data(1:end-4), TimeForSave, '_F1_img2rit.mat']))
im = getimage(handles.axes_DoseDistribution);
figure, imshow(im, [])
%
debug_flag = true;
if(debug_flag)
    shape_im = size(im);
    [x_axis, y_axis] = meshgrid(1:shape_im(2), 1:shape_im(1));
    x_axis_cm = x_axis.*pixel_size;
    y_axis_cm = y_axis.*pixel_size;
    center_point = round(shape_im./2);
    median_filter_size =  [5, 5];
    im_median = medfilt2(im,median_filter_size);
    colormap_dose = 'hsv';
    figure, 
    subplot(2,3,1), hold on, imshow(im, []), colormap(colormap_dose), title(sprintf('Pixel value at center: %1.4f\nOriginal image',im(center_point(1), center_point(2)))), ...
        plot(x_axis(center_point(1), :), center_point(1)*ones(1,shape_im(2)),  'b--', 'LineWidth', 1), ...
        plot(center_point(2)*ones(1,shape_im(1)), y_axis(:, center_point(2)), 'r--', 'LineWidth', 1), hold off
        
    subplot(2,3,2), plot(x_axis_cm(center_point(1), :) ,im(center_point(1), :), 'b--'), ...
        title('Horozontal profile'), xlabel('[cm]'), ylabel('Absorbed dose [cGy]'), grid on, xlim([0, max(x_axis_cm(center_point(1), :))]);
    subplot(2,3,3), plot(y_axis_cm(:, center_point(2)) ,im(:, center_point(2)), 'r--'), ...
        title('Vertical profile'), xlabel('[cm]'), ylabel('Absorbed dose [cGy]'), grid on, xlim([0, max(y_axis_cm(:, center_point(2)))]);
    %
    subplot(2,3,4), hold on, imshow(im_median, []), colormap(colormap_dose), title(sprintf('Pixel value at center: %1.4f\nApplied median filter [%d, %d]',im_median(center_point(1), center_point(2)), median_filter_size(1), median_filter_size(2))), ...
        plot(x_axis(center_point(1), :), center_point(1)*ones(1,shape_im(2)),  'b--', 'LineWidth', 1), ...
        plot(center_point(2)*ones(1,shape_im(1)), y_axis(:, center_point(2)), 'r--', 'LineWidth', 1), hold off
    subplot(2,3,5), plot(x_axis_cm(center_point(1), :) ,im_median(center_point(1), :), 'b--'), ...
        title('Horozontal profile'), xlabel('[cm]'), ylabel('Absorbed dose [cGy]'), grid on, xlim([0, max(x_axis_cm(center_point(1), :))]);
    subplot(2,3,6), plot(y_axis_cm(:, center_point(2)) ,im_median(:, center_point(2)), 'r--'), ...
        title('Vertical profile'), xlabel('[cm]'), ylabel('Absorbed dose [cGy]'), grid on, xlim([0, max(y_axis_cm(:, center_point(2)))]);
end
%
im_type = 'RIT113 V4.x';
%
ip.row = size(im,1);
ip.col = size(im,2);
ip.ps = [inch2cm/dpi_op, inch2cm/dpi_op];
ip.unit = 'cm';
ip.data_format = 'double';
ip.data_scan = [];
ip.version = 4.00;
ip.def_filt ='';
%
a=0;
d1 = datetime('now');
d1_str = datestr(d1);
d1_str = strrep(d1_str ,' ','_');
d1_str = strrep(d1_str ,'-','_');
d1_str = strrep(d1_str ,':','_');
%
%
strsplit_set = strsplit(handles.Irr_pathname,'\');
pathname_up =[sprintf('%s\\', strsplit_set{1:end-2})];
foldername_result = 'result_dose';
pathname_result = fullfile(pathname_up, foldername_result);
mkdir(pathname_result)
%
final_dosemap_filename = handles.sel_filename_Irr_listbox{1}(1:end-4);
final_filename = [final_dosemap_filename, '_Dosemap_', d1_str, '.mat'];
    
uisave({'im','im_type','ip'}, fullfile(pathname_result, final_filename))



% --- Executes on button press in pb_dose_rot_cw.
function pb_dose_rot_cw_Callback(hObject, eventdata, handles)
% hObject    handle to pb_dose_rot_cw (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

a=0;
if isempty(handles.Dosemap_crop)
    figure(2), 
    imshow(handles.DoseDistribution, []), colormap('jet')
    h = imline;
    pause
    GetLinePosition = h.getPosition;
    Coordi1 = GetLinePosition(2,:) - GetLinePosition(1,:);
    Coordi2 = [1 0];
    degree_line = CalRotationDegree(Coordi1,Coordi2);
    Dosemap_align = imrotate(handles.Subtraction_img, -1.0*degree_line);
    handles.Dosemap_align = Dosemap_align;
else
    figure(2), hold off
    imshow(handles.Dosemap_crop, []), colormap('jet')
    h = imline;
    pause
    GetLinePosition = h.getPosition;
    Coordi1 = GetLinePosition(2,:) - GetLinePosition(1,:);
    Coordi2 = [1 0];
    degree_line = CalRotationDegree(Coordi1,Coordi2);
    Dosemap_align = imrotate(handles.Dosemap_crop, -1.0*degree_line);
    %
    handles.Dosemap_align = Dosemap_align;
    figure, imshow(Dosemap_align, []), colormap('jet')
end
%
%
axes(handles.axes_DoseDistribution)
imshow(Dosemap_align, []), colormap('jet'), colorbar
%
axes(handles.axes_tab_figure)
imshow(handles.Dosemap_align, []), colormap('jet'), colorbar
%
guidata(hObject, handles);
