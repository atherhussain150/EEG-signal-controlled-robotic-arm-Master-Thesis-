%data_test

tt = 0:1/512:4;
t1=1:2048;
t2=1:1024;

Drawing_Begin=Da_Be;
Drawing_End=Da_En;

% Drawing_Begin=1;
% Drawing_End=4242;

sample_num=3; %sample number
chanel_num=61;
%%
formatSpec_orig_data_load=['Rescale_EEG_Data_',Sce_re,'%d'];
formatSpec_orig_data_load=sprintf(formatSpec_orig_data_load,sample_num);

% formatSpec_orig_data_load=sprintf(formatSpec_orig_data_load,sample_num);

Raw_data_path='D:\master thesis\New filtration and truncate files';
Raw_data_path=strcat(Raw_data_path,'\',data_version);
Raw_data_path=strcat(Raw_data_path,'\',Sce_re);
cd(Raw_data_path)

Load_data_path=strcat(Raw_data_path,'\',formatSpec_orig_data_load);
Orig_file=load(Load_data_path); % raw eeg signal which goes to o

 o1 = Orig_file.EEG_Data_rescale(500:2000,chanel_num); 
 o2 = Orig_file.EEG_Data_rescale(Drawing_Begin:Drawing_End,chanel_num); 

%%

formatSpec_filtered_data_load=['Rescale_EEG_Data_',Sce_re,'%d'];
formatSpec_filtered_data_load=sprintf(formatSpec_filtered_data_load,sample_num);
Filtered_data_path='D:\master thesis\New filtration and truncate files';
Filtered_data_path=strcat(Filtered_data_path,'\',data_version,'_filtered', '\', 'Truncated_1_5');
Filtered_data_path=strcat(Filtered_data_path,'\',Sce_re);
cd(Filtered_data_path)

Load_data_path=strcat(Filtered_data_path,'\',formatSpec_filtered_data_load);
disp('Debug')
disp(Load_data_path)
filtered_file=load(Load_data_path); % raw eeg signal which goes to 

f1 = filtered_file.eeg_handle.EEG_Data(500:2000,chanel_num); 
f2 = filtered_file.eeg_handle.EEG_Data(Drawing_Begin:Drawing_End,chanel_num); 

%%

%z = EEG_str2(samp_num).value.eeg_handle(:,chan_num); % after filtering and reducing 
z = EEG_str2(sample_num).value.eeg_handle.EEG_Data(:,chanel_num); % after filtering and reducing 

%m = EEG_str_des(samp_num).value.eeg_handle(:,chan_num); % after filtering, reducing, and decimating
m = EEG_str_des(sample_num).value.eeg_handle.EEG_Data(:,chanel_num); % after filtering, reducing, and decimating


% plot(o2)
% hold on
% plot(f2)


subplot(6,1,1)
plot(o1) %x(513:1536)
grid on

subplot(6,1,2)
plot(f1) %x(513:1536)
grid on


subplot(6,1,3)
plot(o2) %x(513:1536)
grid on


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

subplot(6,1,4)
plot(f2) %x(513:1536)
grid on


subplot(6,1,5)
plot(z,'b')
grid on

subplot(6,1,6)
plot(m,'b')
grid on

%% running other files

% Size_re_control_panel_new
% Size_re_eeg_read_new
% Size_re_eeg_reshape_new
% Size_re_Data_Test_new
% Size_re_unit_new

%%

