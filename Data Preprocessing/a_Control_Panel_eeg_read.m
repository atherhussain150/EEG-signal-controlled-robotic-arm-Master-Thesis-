%% read eeg files, save them in Workspace and conducting the cleane_line function

%% working scenario

Filtering=1;
Reshaping=1;

%% in case of filtering, the filter type

Bandpass_Fil=1; %   (Now is just bandstop)% [50, 100]
Bandstop_Fil=0;%    it is the notch filter based on Matlab not the eeglab
Notch_Fil_eeglab=0;
filter_band=[0.001,45];

%%
% Sce_re='Pull';  % 'Nothing' /  'Push' /  'Pull'

Data_type='Rescale'; %'Orig'.....'Rescale', %'Tr_Orig'.....'Tr_Rescale'

% formatSpec = "EEG_Data_Nothing%d.mat";  %"EEG_Data_Nothing%d.mat"  %Rescale_EEG_Data_Nothing%d.mat
% Sce_re='Push';  % 'Nothing' /  'Push' /  'Pull'

Begin_sample=1;
Begin_sample=Begin_sample-1;
N_samp=3;

%%
%addpath('D:\Masoud\MATLAB\0_EEG_filtering_04112022\Based on eeglab\files');
% GetFullPath(fullfile(cd, '..\..\..\Newssss filtration and truncate files'))
% Data_raw_path=GetFullPath('','');
Data_raw_path='D:\master thesis\New filtration and truncate files';
Data_save_path='D:\master thesis\New filtration and truncate files';
Data_decimated_path='D:\master thesis\New filtration and truncate files';
disp('Bebug');
disp(Data_raw_path)

%%

Data_raw_path=strcat(Data_raw_path,'\',data_version,'\','Truncated_1_5');
Data_save_path=strcat(Data_save_path,'\',data_version,'_filtered','\','Truncated_1_5');
Data_decimated_path=strcat(Data_decimated_path,'\',data_version,'_reshaped_decimated','\','Truncated_1_5');

mkdir(Data_save_path)
mkdir(Data_decimated_path)

%%

file_path_re=fullfile(Data_raw_path,Sce_re);
addpath(file_path_re)

%%

Da_Be=2*512+1; % Omiting the first 2 (4!) seconds
Da_En=4*512; % Omittng after 6 


%% The original data is saved in 20 seconds(20*512=10240)window. I encountered some problems filtering it, so decided to first cut the
% raw data and then filter it. I will consider the cutting window bigger than the desired window, in order to mitigate filtering effects
% on data.Additionall, it has just END!/

Da_End_cut=7*512;

%%
switch Data_type

    case 'Orig'

formatSpec=['EEG_Data_',Sce_re,'%d'];

    case 'Rescale'

formatSpec=['Rescale_EEG_Data_',Sce_re,'%d'];

end

%% intended raw data

% cd(Data_raw_path)


%% 
if Reshaping==1 && Filtering==0

% if Bandpass_Fil==0 && Notch_Fil_eeglab==0 % Beacause it would

A_Working_Flag='No_filter_but_Reshaping';


%
Contninue_after_filtering=1;

for i=1:N_samp
 
EEG_str_be_cl(i).name=sprintf(formatSpec,Begin_sample+i);
EEG_str_be_cl(i).value=load(EEG_str_be_cl(i).name);

end

if strcmp(Data_type, 'Tr_Rescale')

for i=1:N_samp
 
% EEG_str_be_cl(i).value.EEG_Data=EEG_str_be_cl(i).value.EEG_Data_rescale(Da_Be:Da_En,:);
EEG_str_be_cl(i).value.EEG_Data=EEG_str_be_cl(i).value.EEG_Data_rescale;
EEG_str_be_cl(i).value=rmfield(EEG_str_be_cl(i).value, 'EEG_Data_rescale');

end

end

addpath('D:\master thesis\New filtration and truncate files')
run('b_eeg_filter.m')

% end


A_Working_Flag='Just_Reshaping';
% Contninue_after_filtering=0;
run('d_Size_re_control_new')

elseif Reshaping==0 && Filtering==1
A_Working_Flag='Just_Filtering'; 
Contninue_after_filtering=0;


% reading data

for i=1:N_samp
 
EEG_str_be_cl(i).name=sprintf(formatSpec,Begin_sample+i);
EEG_str_be_cl(i).value=load(EEG_str_be_cl(i).name);


end

if strcmp(Data_type, 'Rescale')

for i=1:N_samp
 
% EEG_str_be_cl(i).value.EEG_Data=EEG_str_be_cl(i).value.EEG_Data_rescale(Da_Be:Da_En,:);

EEG_str_be_cl(i).value.EEG_Data=EEG_str_be_cl(i).value.EEG_Data_rescale;
EEG_str_be_cl(i).value=rmfield(EEG_str_be_cl(i).value, 'EEG_Data_rescale');


end


 end


run('b_eeg_filter.m')


elseif Reshaping==1 && Filtering==1

A_Working_Flag='Filtering_and_Reshaping';
Contninue_after_filtering=1;

% reading data

for i=1:N_samp
 
EEG_str_be_cl(i).name=sprintf(formatSpec,Begin_sample+i);
EEG_str_be_cl(i).value=load(EEG_str_be_cl(i).name);


end

%%

if strcmp(Data_type, 'Rescale')


for i=1:N_samp
 
% EEG_str_be_cl(i).value.EEG_Data=EEG_str_be_cl(i).value.EEG_Data_rescale(Da_Be:Da_En,:);
EEG_str_be_cl(i).value.EEG_Data=EEG_str_be_cl(i).value.EEG_Data_rescale;

EEG_str_be_cl(i).value=rmfield(EEG_str_be_cl(i).value, 'EEG_Data_rescale');


end


end

addpath("D:\master thesis\New filtration and truncate files")
run('b_eeg_filter.m')

end                  