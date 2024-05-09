
%% Normal_uniting the data
%switch out_meth

%%
Data_decimated_path_unit_1='D:\master thesis\New filtration and truncate files';
Data_decimated_path_unit_1=strcat(Data_decimated_path_unit_1,'\',data_version,'_reshaped_decimated', '\', 'Truncated_1_5');

% % Data_decimated_path_unit_2=

%%
cd(Data_decimated_path_unit_1)
addpath(fullfile(Data_decimated_path_unit_1,'Push'));
addpath(fullfile(Data_decimated_path_unit_1,'Nothing'));
addpath(fullfile(Data_decimated_path_unit_1,'Pull'));

% i=looping_var(1,:)

for i=1:N_samp

Lables_Nothing{i}='Nothing';
Lables_Pull{i}='Pull';
Lables_Push{i}='Push';

end

for i=1:N_samp

eeg_big_data_Nothing(i,:)=load(sprintf(formatSpec_Nothing,i)).eeg_handle_re;
eeg_big_data_Pull(i,:)=load(sprintf(formatSpec_Pull,i)).eeg_handle_re;
eeg_big_data_Push(i,:)=load(sprintf(formatSpec_Nothing,i)).eeg_handle_re;


%eeg_big_data_N(i,:)=load(sprintf(formatSpec2,i)).eeg_re;

%EEG_str(i).value=load(EEG_str(i).name);
%EEG_str(i).name=sprintf(formatSpec2,i);
%EEG_str(i).value=load(EEG_str(i).name);

end


% cd(Data_decimated_path_unit_2)
% addpath(fullfile(Data_decimated_path_unit_2,'Push'));
% addpath(fullfile(Data_decimated_path_unit_2,'Nothing'));
% addpath(fullfile(Data_decimated_path_unit_2,'Pull'));
% 
% % i=looping_var(1,:)
% 
% for i=1+N_samp:N_samp+N_samp
% 
% Lables_Nothing{i}='Nothing';
% Lables_Pull{i}='Pull';
% Lables_Push{i}='Push';
% 
% end
% 
% for i=1+N_samp:N_samp+N_samp
% 
% eeg_big_data_Nothing(i,:)=load(sprintf(formatSpec_Nothing,i)).eeg_handle_re;
% eeg_big_data_Pull(i,:)=load(sprintf(formatSpec_Pull,i)).eeg_handle_re;
% eeg_big_data_Push(i,:)=load(sprintf(formatSpec_Nothing,i)).eeg_handle_re;
% 
% end



%% finalizing

% eeg_big_data=[eeg_big_data_Push; eeg_big_data_Nothing;eeg_big_data_Pull];
% Lables=[Lables_Push';Lables_Nothing';Lables_Pull'];
% EEGData_unit=load('EEGData_GoogLeNet.mat').EEGData;

%out_put
% EEGData_unit.Labels=Lables;
% EEGData_unit.Data=eeg_big_data;

%cd('D:\Masoud\MATLAB\0_EEG_filtering_04112022\Based on eeglab\files')

%%
% Filter_ID=sprintf('Filterd_%d',Filtering);
% Reshaped_ID=sprintf('Reshaped_%d',Reshaping);

% Saving_format=strcat('EEGData_unit_',data_version,'_',Filter_ID,'_',Reshaped_ID,'.mat');

                    % save('EEGData_unit.mat')

% save(Saving_format, 'EEGData_unit')
