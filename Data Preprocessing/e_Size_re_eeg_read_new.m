%% The data get read and filtered between 1 to 30 Hz

%%

addpath(file_path_re_1)

for i=looping_var(1,:)

EEG_str(i).name=sprintf(formatSpec,(i+Begin_sample));

EEG_str(i).value=load(EEG_str(i).name);

end

EEG_str1=EEG_str;

% if filt_pas_flag ==1
% 
% for j=looping_var(1,:)
% 
%     for kk=1:N_cha
% 
% EEG_str1(j).value.eeg_handle(:,kk)=bandpass(EEG_str1(j).value.eeg_handle(:,kk),[1 45],512);
% %EEG_str1(j).value.eeg(:,kk)=bandpass(EEG_str1(j).value.eeg(:,kk),[1 45],512);
% 
%     end
% 
% end
% 
% end

%% output

EEG_str2=EEG_str;

% Commenting choosing part

for j=looping_var(1,:)

EEG_str2(j).value.eeg_handle.EEG_Data=EEG_str2(j).value.eeg_handle.EEG_Data(Da_Be:Da_En,:);
%EEG_str2(j).value.eeg=EEG_str2(j).value.eeg(Da_Be:Da_En,:);


end

%% going to next file

%addpath('D:\Masoud\MATLAB\0_EEG_filtering_04112022\Filter_ready_4_classifier\Modified')

%% running other files
addpath('D:\master thesis\New filtration and truncate files')
% Size_re_control_panel_new
% Size_re_eeg_read_new
f_Size_re_eeg_reshape_new
%Size_re_Data_Test_new
%Size_re_unit_new
