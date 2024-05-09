
%% Initials
St=2048;
En=3072;
Chn_num=10;
filter_band=[1,45];

%% Ploting
%filtered
plot(eeg_handle.EEG_Data(St:En,Chn_num))

hold on

%raw_data
plot(EEG_Data(St:En,Chn_num))

a=EEG_Data(St+1:En,Chn_num);
b=bandpass(a,filter_band,512);% [1 45]
 

plot(a)
hold on
plot (b)

%% 
x=1:0.001:10;
a=sin(x);
plot(a)
b=bandstop(a,[40],512);% [1 45]
plot(a)
hold on
plot (b)


%%

plot(EEG_Data_rescale(100:1000,13),'b')
hold on
plot(eeg_handle(100:1000,13),'r')
hold on
plot(eeg_handle.EEG_Data(100:1000,13),'g')