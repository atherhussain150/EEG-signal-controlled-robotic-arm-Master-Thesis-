%% eeg_filter_No
%cd 'D:\Masoud\MATLAB\liblsl-Matlab-master23.12\Data Set2 - Copy\Pure eeg\No'
%cd 'D:\Masoud\MATLAB\liblsl-Matlab-master23.12\Data Set2 - Copy\Pure eeg\Yes'
%addpath('D:\Masoud\MATLAB\liblsl-Matlab-master23.12\Data Set2 - Copy\Pure eeg\No')
addpath('D:\master thesis\Yes')
%addpath 'D:\Masoud\MATLAB\eeglab_current\eeglab2021.1'
%eeglab

%if sce==1
%cd 'D:\Masoud\MATLAB\liblsl-Matlab-master23.12\Data Set2 - Copy\Pure eeg\Yes'

%elseif sce==0
%cd 'D:\Masoud\MATLAB\liblsl-Matlab-master23.12\Data Set2 - Copy\Pure eeg\No'

%end


load('EEG.mat');
for i=1:N_samp

EEG.data=EEG_str_be_cl(i).value.eeg';


EEG = pop_cleanline(EEG, 'Bandwidth',2,'ChanCompIndices',[1:EEG.nbchan],                  ...
                           'SignalType','Channels','ComputeSpectralPower',true,             ...
                           'LineFrequencies',[50 100] ,'NormalizeSpectrum',false,           ...
                           'LineAlpha',0.01,'PaddingFactor',2,'PlotFigures',false,          ...
                           'ScanForLines',true,'SmoothingFactor',100,'VerboseOutput',1,    ...
                           'SlidingWinLength',EEG.pnts/EEG.srate,'SlidingWinStep',EEG.pnts/EEG.srate);

EEG_str_af_cl(i).name=EEG_str_be_cl(i).name;
EEG_str_af_cl(i).value=EEG.data';

end


%% new changes, made for filtering between 1 to 45 







