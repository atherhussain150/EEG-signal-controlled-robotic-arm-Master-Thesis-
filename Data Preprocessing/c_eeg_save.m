%% eeg_save

file_path_re=fullfile(Data_save_path,Sce_re);
mkdir(file_path_re)
cd (file_path_re)

%if Sce_re=='Yes'
%cd 'D:\Masoud\MATLAB\liblsl-Matlab-master23.12\Data Set2 - Copy\filtered\Yes'

%elseif Sce_re=='No'
%cd 'D:\Masoud\MATLAB\liblsl-Matlab-master23.12\Data Set2 - Copy\filtered\No'

%end

for i=1:N_samp

%save(X2(i),'name','value')
%save(sprintf("eeg%d.mat",i),"X2(i)",'value')
%save('newstruct.mat','-struct','X2');
%Y = float(sprintf("eeg%d",i))
%sprintf("eeg%d",i)={X2(i).value}.';

eeg_handle=EEG_str_af_cl(i).value;
save(sprintf(formatSpec,i),"eeg_handle")



end

%% Going for decimation and reshaping
%addpath ('D:\Masoud\MATLAB\0_EEG_filtering_04112022\Based on eeglab\files')

if Contninue_after_filtering==1
addpath('D:\master thesis\New filtration and truncate files')
run('d_Size_re_control_new')

else
    disp('We have performed just the filtering')
end