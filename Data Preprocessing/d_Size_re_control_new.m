
%% Order Of running of files
% -1)Size_re_eeg_extract.m
%  0)Size_re_control_panel ----- 1)Size_re_eeg_read.m ---- 2)Size_re_eeg_reshape.m -----22) Size_re_Data_Test.m  3) Size_re_unit.m 
%% Control Panell for reading, band pass filtering, reshaping, and decimating the data 

% clear
% clc
% close all

%% Test

formatSpec_base = "EEG_Data_%s.mat";

% Sce_re='Pull'; %'Nothing', 'Pull', 'Push'  /// %Rescale_EEG_Data_Nothing.mat
% Sce_re_dtype='Nothing%d'; %'Nothing%d', 'Pull%d', 'Push%d'  /// %Rescale_EEG_Data_Nothing%d.mat
Sce_re_dtype=[Sce_re,'%d'];
N_cha=64;

% Begin_sample=1;
% Begin_sample=Begin_sample-1;
% N_samp=100; it comes from above!

% formatSpec=sprintf(formatSpec_base,Sce_re_dtype);

% Data_filtered_path='D:\Masoud\MATLAB\0_EEG_filtering_04112022\Based on eeglab\Data_filtered\03112022_filtered';


% file_path_re=fullfile(Data_raw_path,Sce_re);
% cd (file_path_re)

Sam_fre=512;
Sam_du=4;
Ratio=0.5; % masx=1
Samp_size_Or=Sam_fre*Sam_du;%(512*4)
% filt_pas_flag=1;  % the data filtered or not (1-45 Hz)

des_flag=1; % the data decimated or not
des_ratio=2; % decimation ratio

% Len_Da=Samp_size_Or*Ratio;
% Da_Be=Samp_size_Or/2-Len_Da/2+1;
% Da_En=Samp_size_Or/2+Len_Da/2;


% Da_Be=4*512+1; % Omiting the first 2 seconds
% Da_En=6*512; % Omittng after 6 

file_path_ba_1=Data_save_path;
file_path_re_1=fullfile(file_path_ba_1,Sce_re);

%% Size_re_eeg_reshape.m

% file_path_ba_2='D:\Masoud\MATLAB\0_EEG_filtering_04112022\Filter_ready_4_classifier\Modified\Data_reshaped_decimated';
file_path_ba_2=Data_decimated_path;
file_path_re_2=fullfile(file_path_ba_2,Sce_re);

%mkdir('D:\Masoud\MATLAB\liblsl-Matlab-master23.12\Data Set2_26.01(Yes_No)\EEG_Pure\filtered\reduced\reshaped',Sce_re)
%rmdir(file_path_re_2)

%% Size_re_unit.m

%out_meth=-1;  % 1: Normal -1:little data set

% addpath(fullfile(file_path_ba_2,'No'));
% addpath(fullfile(file_path_ba_2,'Yes'));

addpath(file_path_ba_2);

flat_size=Samp_size_Or*Ratio*N_cha; 

formatSpec_Nothing ="eegreNothing%d.mat";
formatSpec_Pull = "eegrePull%d.mat";
formatSpec_Push = "eegrePush%d.mat";

%% some calculations_Wrong!!!

looping_var=1:N_samp;

%% running other files
addpath('D:\master thesis\New filtration and truncate files')
% Size_re_control_panel_new
e_Size_re_eeg_read_new
%Size_re_eeg_reshape_new
%Size_re_Data_Test_new
%Size_re_unit_new

