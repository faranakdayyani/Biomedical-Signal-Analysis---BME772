function [eeg_avg,eeg_bps] = preprossesing(eeg, row, coloumn, time, fs)

%synchronized aveaging for a subject to reduce noise
eeg_sum = 0;
for i = 1:row;
    eeg_sum = eeg_sum + eeg(i,:);
end
eeg_avg = eeg_sum./row;
figure;
plot(time,eeg_avg);xlabel('Time(s)');ylabel('Amplitude');
title('EEG Signal after Synchronized Averaging'); grid on; 

%BPS
fc1 = 0.4/(fs/2);
fc2 = 30/(fs/2);
[b, a] = butter(6, [fc1 fc2]);
eeg_bps = filter(b,a, eeg_avg);
figure;
plot(time, eeg_bps);xlabel('Time(s)');ylabel('Amplitude');
title('EEG Signal after Band-Pass filter added'); grid;

% eeg_avg_s = snr(eeg_avg)
% eeg_bps_s = snr(eeg_bps)
end
