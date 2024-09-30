%% Seizure Detection by supervised ML and binary classification
close all
clear all

[header, recorddata] = edfread('chb01_09.edf');
header = struct2cell(header);
fs=header{19};
fs = fs(1,1);
[M,N] = size(recorddata);
% figure;
t=(0:length(recorddata(1,:))-1)/fs;
% plot(t(1,586240), recorddata(1,758784:778496)); %cut the sesiur part
% title('Sezier section');
figure;
plot(t, recorddata(1,:));
title('Original signal');

%Denoise the signal
[eeg_avg,eeg_bps] = preprossesing(recorddata, M, N, t, fs);

%band seperation:
[eeg_delta_norm, eeg_theta_norm, eeg_alpha_norm, eeg_beta_norm]= band(eeg_bps, t, fs);

%entropy calculation:
%[entropy_delta_avg,entropy_theta_avg,entropy_alpha_avg,entropy_beta_avg]=entcalc(eeg_delta_norm,eeg_theta_norm,eeg_alpha_norm,eeg_beta_norm,fs);
[entropy_delta_avg,entropy_theta_avg,entropy_alpha_avg,entropy_beta_avg,rms_delta,rms_theta,rms_alpha,rms_beta,std_delta,std_theta,std_alpha,std_beta]=entcalc(eeg_delta_norm,eeg_theta_norm,eeg_alpha_norm,eeg_beta_norm,fs);

%band choosing based on the lowest entropy and also RMS and std calculation
%for that band:
bandchoosing(entropy_delta_avg,entropy_theta_avg,entropy_alpha_avg,entropy_beta_avg,rms_delta,rms_theta,rms_alpha,rms_beta,std_delta,std_theta,std_alpha,std_beta);%eeg_delta_norm,eeg_theta_norm,eeg_alpha_norm,eeg_beta_norm, fs);

%% upper and lower quartile extraction:
Rms= [0.3251,0.7552,0.2191,0.595,0.5428,0.6032,0.5921,0.5625,0.567,0.60012462,0.639996036,0.721108809,0.615198452,0.647104439,0.639961637,0.25375,0.461242961,0.62193869];
standdev=[0.1735,0.1609,0.0219,0.2732,0.2945,0.2308,0.2887,0.3125,0.3071,0.36014956,0.409594926,0.519997914,0.378469135,0.418744155,0.409550896,0.0645,0.212745069,0.386807734];
% power=[0.1057,0.5703,0.048,0.354,0.2946,0.3639,0.3505,0.3164,0.3215,0.248158678,0.240597561,0.149682216,0.218077311,0.257226005,0.288817277,0.03025,0.312342482,0.267913077,0.356366381,0.366423226,0.29005,0.15205,0.09858426,0.241129258];

boxplot(Rms);
boxplot(standdev);
% boxplot(power);

rms_25 = prctile(Rms, 25);
rms_75 = prctile(Rms, 75);
std_25 = prctile(standdev, 25);
std_75 = prctile(standdev, 75);
% pwr_25 = prctile(power, 25);
% pwr_75 = prctile(power, 75);

%% Select the training, validation, testing sets from the list
 
training = randperm(30,18);
% valdation = randperm(30,6);
% testing = randperm(30,6);

% list = ones(1,30);
% for i = 1:18
%     training(1,i) = randi(length(list));
%     for i = 1:6
%         if (training(1,i) ~= randi(length(list)))
%             valid(1, i) = randi(length(list));
%             testing(1, i) = randi(length(list));
%         end
%     end
% end

%% First trial
Rms_AN = [0.60012462, 0.5625, 0.7552, 0.6032, 0.5921, 0.639996036, 0.2191, 0.5428, 0.615198452];
Std_AN = [0.248158678, 0.3125, 0.1609, 0.2308, 0.2887, 0.240597561, 0.0219, 0.2945, 0.218077311];

rms_AN25 = prctile(Rms_AN, 25);
rms_AN75 = prctile(Rms_AN, 75);
std_AN25 = prctile(Std_AN, 25);
std_AN75 = prctile(Std_AN, 75);