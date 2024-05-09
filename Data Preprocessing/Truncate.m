%Data_raw_sizing
clear 
clc
close all

%%
versions_list=[ "22.11.03", "22.11.11","22.11.24","22.11.28","22.12.13","22.12.15"];
size_versions_list=size(versions_list);

for i=1:size_versions_list(1,2)

Data_version=versions_list(i); 
Data_version = convertStringsToChars(Data_version);

Data_version='22.11.03'; %'22.11.03', '22.11.11' % '22.11.24' / '22.11.28'  %'22.12.13'  / '22.12.15' /
Data_type='Rescale';

Begin_sample=1;
Begin_sample=Begin_sample-1;
N_samp=100;
Sam_Fre=512; %Hz
Sec_to_Tru=6;  %changing ths variable for section of data to truncate
Trun_begin=1;  %changing ths variable for section of data to truncate
Trun_End=Sam_Fre*Sec_to_Tru-1;

Data_raw_path='D:\master thesis\New filtration and truncate files';

%%
Sce_re='Pull'; 
Data_raw_path_local=strcat(Data_raw_path,'\',Data_version,'\',Sce_re);
cd(Data_raw_path_local)
Data_resaved_path=[Data_raw_path,'\',Data_version,'\','Truncated_1_5','\',Sce_re];
mkdir(Data_resaved_path)

switch Data_type

    case 'Orig'

formatSpec=['EEG_Data_',Sce_re,'%d'];
formatSpec_resave=['EEG_Data_',Sce_re,'%d'];

    case 'Rescale'

formatSpec=['Rescale_EEG_Data_',Sce_re,'%d'];
formatSpec_resave=['Rescale_EEG_Data_',Sce_re,'%d'];

end


for i=1:N_samp
 
EEG_str(i).name=sprintf(formatSpec,Begin_sample+i);
EEG_str(i).value=load(EEG_str(i).name);


end

cd(Data_resaved_path)

for i=1:N_samp

EEG_str(i).value.EEG_Data_rescale=EEG_str(i).value.EEG_Data_rescale(Trun_begin:Trun_End,:);


% EEG_Data=EEG_str(i).value.EEG_Data_rescale;
EEG_Data_rescale=EEG_str(i).value.EEG_Data_rescale;

tem_variable_name=sprintf(formatSpec_resave,Begin_sample+i);
% tem_variable_name=[Data_resaved_path,tem_variable_name];

save(tem_variable_name,"EEG_Data_rescale")

end

cd('D:\master thesis\New filtration and truncate files')


%%
Sce_re='Nothing';   
Data_raw_path_local=strcat(Data_raw_path,'\',Data_version,'\',Sce_re);
cd(Data_raw_path_local)
Data_resaved_path=[Data_raw_path,'\',Data_version,'\','Truncated_1_5','\',Sce_re];
mkdir(Data_resaved_path)

switch Data_type

    case 'Orig'

formatSpec=['EEG_Data_',Sce_re,'%d'];
formatSpec_resave=['EEG_Data_',Sce_re,'%d'];

    case 'Rescale'

formatSpec=['Rescale_EEG_Data_',Sce_re,'%d'];
formatSpec_resave=['Rescale_EEG_Data_',Sce_re,'%d'];

end


for i=1:N_samp
 
EEG_str(i).name=sprintf(formatSpec,Begin_sample+i);
EEG_str(i).value=load(EEG_str(i).name);


end

cd(Data_resaved_path)

for i=1:N_samp

EEG_str(i).value.EEG_Data_rescale=EEG_str(i).value.EEG_Data_rescale(Trun_begin:Trun_End,:);

% EEG_Data=EEG_str(i).value.EEG_Data_rescale;
EEG_Data_rescale=EEG_str(i).value.EEG_Data_rescale;

tem_variable_name=sprintf(formatSpec_resave,Begin_sample+i);
% tem_variable_name=[Data_resaved_path,tem_variable_name];

save(tem_variable_name,"EEG_Data_rescale")

end

cd('D:\master thesis\New filtration and truncate files')


%%
Sce_re='Push';  
Data_raw_path_local=strcat(Data_raw_path,'\',Data_version,'\',Sce_re);
cd(Data_raw_path_local)
Data_resaved_path=[Data_raw_path,'\',Data_version,'\','Truncated_1_5','\',Sce_re];
mkdir(Data_resaved_path)

switch Data_type

    case 'Orig'

formatSpec=['EEG_Data_',Sce_re,'%d'];
formatSpec_resave=['EEG_Data_',Sce_re,'%d'];

    case 'Rescale'

formatSpec=['Rescale_EEG_Data_',Sce_re,'%d'];
formatSpec_resave=['Rescale_EEG_Data_',Sce_re,'%d'];

end


for i=1:N_samp
 
EEG_str(i).name=sprintf(formatSpec,Begin_sample+i);
EEG_str(i).value=load(EEG_str(i).name);


end

cd(Data_resaved_path)

for i=1:N_samp

EEG_str(i).value.EEG_Data_rescale=EEG_str(i).value.EEG_Data_rescale(Trun_begin:Trun_End,:);

% EEG_Data=EEG_str(i).value.EEG_Data_rescale;
EEG_Data_rescale=EEG_str(i).value.EEG_Data_rescale;

tem_variable_name=sprintf(formatSpec_resave,Begin_sample+i);
% tem_variable_name=[Data_resaved_path,tem_variable_name];

save(tem_variable_name,"EEG_Data_rescale")

end

% cd('D:\Masoud\MATLAB\0_EEG_filtering_04112022\Based on eeglab\files')

end
% cd('D:\Masoud\MATLAB\0_EEG_filtering_04112022\Based on eeglab\files')