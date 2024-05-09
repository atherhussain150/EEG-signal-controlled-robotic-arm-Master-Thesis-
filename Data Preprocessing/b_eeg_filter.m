%% eeg_filter
%%
% just Bandpass_Fil

if Bandpass_Fil==1 && Notch_Fil_eeglab==0

    A_flag_filter_type='Band Filtering';
    looping_var=1:N_samp;
    size_mat=size(EEG_str_be_cl(1).value.EEG_Data);
    EEG_str_bf_cl_band=EEG_str_be_cl;   % Just bandpath filter

    for j=looping_var(1,:)
        for kk=1:size_mat(1,2)
                EEG_str_af_cl_band(j).value.EEG_Data(:,kk)=bandpass(EEG_str_bf_cl_band(j).value.EEG_Data(:,kk),filter_band,512);% [1 45]

        end
    end


EEG_str_af_cl=EEG_str_af_cl_band;

end
%%
% just Notch_Fil_eeglab

if  Bandpass_Fil==0 && Notch_Fil_eeglab==1
    A_flag_filter_type='Notch';
    %addpath('D:\Masoud\MATLAB\eeglab_current\eeglab2021.1')
    eeglab
    load('EEG.mat'); % the acceptable format of EEGlab

    for i=1:N_samp

        EEG.data=EEG_str_be_cl(i).value.EEG_Data';

        EEG = pop_cleanline(EEG, 'Bandwidth',2,'ChanCompIndices',[1:EEG.nbchan],                  ...
            'SignalType','Channels','ComputeSpectralPower',true,             ...
            'LineFrequencies',[50 100] ,'NormalizeSpectrum',false,           ...
            'LineAlpha',0.01,'PaddingFactor',2,'PlotFigures',false,          ...
            'ScanForLines',true,'SmoothingFactor',100,'VerboseOutput',1,    ...
            'SlidingWinLength',EEG.pnts/EEG.srate,'SlidingWinStep',EEG.pnts/EEG.srate);

        EEG_str_af_cl_notch(i).name=EEG_str_be_cl(i).name;
        EEG_str_af_cl_notch(i).value=EEG.data';

    end 

EEG_str_af_cl=EEG_str_af_cl_notch;

end

%%
%Notch_Fil_eeglab and Bandpass_Fil

if Notch_Fil_eeglab==1 && Bandpass_Fil==1

    looping_var=1:N_samp;
    size_mat=size(EEG_str_be_cl(1).value.EEG_Data);
    EEG_str_bf_cl_band=EEG_str_be_cl;   % Just bandpath filter

    for j=looping_var(1,:)
        for kk=1:size_mat(1,2)
            EEG_str_af_cl_band(j).value.EEG_Data(:,kk)=bandpass(EEG_str_bf_cl_band(j).value.EEG_Data(:,kk),filter_band,512);

        end
    end

    A_flag_filter_type='Notch (eeglab) and Bandstop!!';
    %addpath('D:\Masoud\MATLAB\eeglab_current\eeglab2021.1')
    eeglab
    load('EEG.mat'); % the acceptable format of EEGlab


    for i=1:N_samp

        EEG.data=EEG_str_af_cl_band(i).value.EEG_Data';


        EEG = pop_cleanline(EEG, 'Bandwidth',2,'ChanCompIndices',[1:EEG.nbchan],                  ...
            'SignalType','Channels','ComputeSpectralPower',true,             ...
            'LineFrequencies',[50 100] ,'NormalizeSpectrum',false,           ...
            'LineAlpha',0.01,'PaddingFactor',2,'PlotFigures',false,          ...
            'ScanForLines',true,'SmoothingFactor',100,'VerboseOutput',1,    ...
            'SlidingWinLength',EEG.pnts/EEG.srate,'SlidingWinStep',EEG.pnts/EEG.srate);

        EEG_str_af_cl_band_notch(i).name=EEG_str_be_cl(i).name;
        EEG_str_af_cl_band_notch(i).value=EEG.data';

    end

    EEG_str_af_cl=EEG_str_af_cl_band_notch;

end


if Notch_Fil_eeglab==0 && Bandpass_Fil==0 && Notch_Fil_eeglab==0

 A_flag_filter_type='No any type of filtering';

    looping_var=1:N_samp;
    size_mat=size(EEG_str_be_cl(1).value.EEG_Data);
    EEG_str_af_cl=EEG_str_be_cl;


end

%%

if Bandstop_Fil==1 && Bandpass_Fil==0 && Notch_Fil_eeglab==0

    A_flag_filter_type='Band Filtering';
    looping_var=1:N_samp;
    size_mat=size(EEG_str_be_cl(1).value.EEG_Data);
    EEG_str_bf_cl_band=EEG_str_be_cl;   % Just bandpath filter

    for j=looping_var(1,:)
        for kk=1:size_mat(1,2)

            EEG_str_af_cl_band(j).value.EEG_Data(:,kk)=bandstop(EEG_str_bf_cl_band(j).value.EEG_Data(:,kk),[50 100],512);
            [b,a] = iirnotch(Wo,BW); % Should be completed



        end
    end


EEG_str_af_cl=EEG_str_af_cl_band;

end

%%


if Notch_Fil_eeglab==1 && Bandpass_Fil==0 && Bandstop_Fil==1

    looping_var=1:N_samp;
    size_mat=size(EEG_str_be_cl(1).value.EEG_Data);
    EEG_str_bf_cl_band=EEG_str_be_cl;   % Just bandpath filter

    for j=looping_var(1,:)
        for kk=1:size_mat(1,2)
            
              EEG_str_af_cl_band(j).value.EEG_Data(:,kk)=bandstop(EEG_str_bf_cl_band(j).value.EEG_Data(:,kk),[50 100],512);% [1 45]
              [b,a] = iirnotch(Wo,BW); % Should be completed
        end
    end

    A_flag_filter_type='Notch (eeglab) and Bandstop!!';
    %addpath('D:\Masoud\MATLAB\eeglab_current\eeglab2021.1')
    eeglab
    load('EEG.mat'); % the acceptable format of EEGlab


    for i=1:N_samp

        EEG.data=EEG_str_af_cl_band(i).value.EEG_Data';


        EEG = pop_cleanline(EEG, 'Bandwidth',2,'ChanCompIndices',[1:EEG.nbchan],                  ...
            'SignalType','Channels','ComputeSpectralPower',true,             ...
            'LineFrequencies',[50 100] ,'NormalizeSpectrum',false,           ...
            'LineAlpha',0.01,'PaddingFactor',2,'PlotFigures',false,          ...
            'ScanForLines',true,'SmoothingFactor',100,'VerboseOutput',1,    ...
            'SlidingWinLength',EEG.pnts/EEG.srate,'SlidingWinStep',EEG.pnts/EEG.srate);

        EEG_str_af_cl_band_notch(i).name=EEG_str_be_cl(i).name;
        EEG_str_af_cl_band_notch(i).value=EEG.data';

    end

    EEG_str_af_cl=EEG_str_af_cl_band_notch;

end




%% next file

run('c_eeg_save.m')
