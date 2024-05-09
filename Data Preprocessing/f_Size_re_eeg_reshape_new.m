%% eeg_ reshape and save

mkdir(file_path_re_2)
cd (file_path_re_2)
delete *.mat

%% decimation

EEG_str_re=EEG_str2;

if des_flag==1

%defining EEG_str_des
EEG_str_des=struct;

for m=1:numel(EEG_str2) 

EEG_str_des(m).name=EEG_str2(m).name;

end

for j=looping_var(1,:)

for k=1:N_cha

EEG_str_des(j).value.eeg_handle.EEG_Data(:,k)=decimate(EEG_str2(j).value.eeg_handle.EEG_Data(:,k),des_ratio);
%EEG_str_des(j).value.eeg(:,k)=decimate(EEG_str2(j).value.eeg(:,k),des_ratio);


end

end

EEG_str_re=EEG_str_des;

end


%%

for i=looping_var(1,:)

eeg_handle=EEG_str_re(i).value.eeg_handle;
%eeg=EEG_str_re(i).value.eeg;

AA=eeg_handle';
%AA=eeg';

eeg_handle_re=reshape(AA.',1,[]);
%eeg_re=reshape(AA.',1,[]);

save(sprintf("eegre%s%d.mat",Sce_re,i),"eeg_handle_re")
%save(sprintf("eegre%s%d.mat",Sce_re,i),"eeg_re")


end

%cd ('D:\Masoud\MATLAB\0_EEG_filtering_04112022\Based on eeglab\files')
%% running other files
addpath('D:\master thesis\New filtration and truncate files')
% Size_re_control_panel_new
% Size_re_eeg_read_new
%Size_re_eeg_reshape_new
g_Size_re_Data_Test_new
%Size_re_unit_new


