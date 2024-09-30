function [eeg_delta_norm, eeg_theta_norm, eeg_alpha_norm, eeg_beta_norm]= band(eeg_bps,t, fs)

%Seperating the bands 

%Delta Band
fc1_d = 0.5/(fs/2);
fc2_d = 4/(fs/2);
[b_d, a_d] = butter(4, [fc1_d fc2_d]);
eeg_delta = filter(b_d,a_d, eeg_bps);
% figure;
% plot(t, eeg_delta);
% title('Delta');

%Rectify the signal
eeg_rec_delta = abs(eeg_delta);
% figure;
% plot(t, eeg_rec_delta);
% title('Rectified delta signal');

%Theta Band
fc1_th = 4/(fs/2);
fc2_th = 8/(fs/2);
[b_th, a_th] = butter(4, [fc1_th fc2_th]);
eeg_theta = filter(b_th,a_th, eeg_bps);
% figure;
% plot(t, eeg_theta);
% title('Theta');

%Rectify the signal
eeg_rec_theta = abs(eeg_theta);
% figure;
% plot(t, eeg_rec_theta);
% title('Rectified theta signal');

%Alpha Band
fc1_a = 8/(fs/2);
fc2_a = 13/(fs/2);
[b_a, a_a] = butter(4, [fc1_a fc2_a]);
eeg_alpha = filter(b_a,a_a, eeg_bps);
% figure;
% plot(t, eeg_alpha);
% title('Alpha');

%Rectify the signal
eeg_rec_alpha = abs(eeg_alpha);
% figure;
% plot(t, eeg_rec_alpha);
% title('Rectified alpha signal');

%Beta Band
fc1_b = 13/(fs/2);
fc2_b = 30/(fs/2);
[b_b, a_b] = butter(4, [fc1_b fc2_b]);
eeg_beta = filter(b_b,a_b, eeg_bps);
% figure;
% plot(t, eeg_beta);
% title('Beta');

%Rectify the signal
eeg_rec_beta = abs(eeg_beta);
% figure;
% plot(t, eeg_rec_beta);
% title('Rectified beta signal');

%smooth the bands
eeg_delta_sm = smoothdata(eeg_rec_delta,'sgolay', 15000);
% figure;
% plot(t, eeg_delta_sm);
% title('smoothed delta with sgolay of 15000');

eeg_theta_sm = smoothdata(eeg_rec_theta,'sgolay', 15000);
% figure;
% plot(t, eeg_theta_sm);
% title('smoothed theta with sgolay of 15000');

eeg_alpha_sm = smoothdata(eeg_rec_alpha,'sgolay', 15000);
% figure;
% plot(t, eeg_alpha_sm);
% title('smoothed alpha with sgolay of 15000');

eeg_beta_sm = smoothdata(eeg_rec_beta,'sgolay', 15000);
% figure;
% plot(t, eeg_beta_sm);
% title('smoothed beta with sgolay of 15000');

%normalizing after smoothing
eeg_delta_norm = eeg_delta_sm./max(eeg_delta_sm);
figure;
plot(t, eeg_delta_norm);
title('normalized (delta)');
xlabel('Time(s)');ylabel('Amplitude');grid;

eeg_theta_norm = eeg_theta_sm./max(eeg_theta_sm);
figure;
plot(t, eeg_theta_norm);
title('normalized (theta)');
xlabel('Time(s)');ylabel('Amplitude');grid;

eeg_alpha_norm = eeg_alpha_sm./max(eeg_alpha_sm);
figure;
plot(t, eeg_alpha_norm);
title('normalized (alpha)');
xlabel('Time(s)');ylabel('Amplitude');grid;

eeg_beta_norm = eeg_beta_sm./max(eeg_beta_sm);
figure;
plot(t, eeg_beta_norm);
title('normalized (beta)');
xlabel('Time(s)');ylabel('Amplitude');grid;
end