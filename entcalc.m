function[entropy_delta_avg,entropy_theta_avg,entropy_alpha_avg,entropy_beta_avg,rms_delta,rms_theta,rms_alpha,rms_beta,std_delta,std_theta,std_alpha,std_beta]=entcalc(eeg_delta_norm,eeg_theta_norm,eeg_alpha_norm,eeg_beta_norm,fs)
    %Feature extraction section: 
    n =(length(eeg_delta_norm)/30); % dividing the Delta into 32 even pieces to seperate each pulse
    segmented_eeg_delta_norm = zeros(30, n);% allocating space
    %entropy_delta = zeros(30, 1);
    %rms_delta = zeros(30, 1);
    %std_delta = zeros(30, 1);
    for i = 0:29
        segmented_eeg_delta_norm(i+1,:) = eeg_delta_norm(1+(n*i):(n*(i+1)));
        entropy_delta(i+1,1) = entropy(segmented_eeg_delta_norm(i+1,:)); %Calculate Entropy for each segments 
        %for i = 0:29
         %   segmented_eeg_delta_norm(i+1,:) = eeg_delta_norm(1+(n*i):(n*(i+1)));
            rms_delta(i+1,1) = rms(segmented_eeg_delta_norm(i+1,:)); %Calculate RMS for each segment
            std_delta(i+1,1) = std(segmented_eeg_delta_norm(i+1,:)); %Calculate STD for each segment
            %pwr_delta(i+1,1) = bandpower(segmented_eeg_delta_norm(i+1,:)); %Calculate Power for each segment
        %end
        %rms_delta1=rms_delta;
        %std_delta1=std_delta;
    end 
    entropy_delta_avg = mean(entropy_delta);

    n =(length(eeg_theta_norm)/30); % dividing the Theta into 10 even pieces to seperate each pulse
    segmented_eeg_theta_norm = zeros(30, n);% allocating space
    %entropy_theta = zeros(30, 1);
    %rms_theta = zeros(30, 1);
    %std_theta = zeros(30, 1);
    for i = 0:29
        segmented_eeg_theta_norm(i+1,:) = eeg_theta_norm(1+(n*i):(n*(i+1)));
        entropy_theta(i+1,1) = entropy(segmented_eeg_theta_norm(i+1,:));
        %for i = 0:29
         %   segmented_eeg_theta_norm(i+1,:) = eeg_theta_norm(1+(n*i):(n*(i+1)));
            rms_theta(i+1,1) = rms(segmented_eeg_theta_norm(i+1,:)); %Calculate RMS for each segment
            std_theta(i+1,1) = std(segmented_eeg_theta_norm(i+1,:)); %Calculate STD for each segment
            %pwr_theta(i+1,1) = bandpower(segmented_eeg_theta_norm(i+1,:)); %Calculate Power for each segment
        %end
        %rms_theta1=rms_theta;
        %std_theta1=std_theta;
    end
    entropy_theta_avg = mean(entropy_theta);

    n =(length(eeg_alpha_norm)/30); % dividing the Alpha into 10 even pieces to seperate each pulse
    segmented_eeg_alpha_norm = zeros(30, n);% allocating spac
    %entropy_alpha = zeros(30, 1);
    %rms_alpha = zeros(30, 1);
    %std_alpha = zeros(30, 1);
    for i = 0:29
        segmented_eeg_alpha_norm(i+1,:) = eeg_alpha_norm(1+(n*i):(n*(i+1)));
        entropy_alpha(i+1,1) = entropy(segmented_eeg_alpha_norm(i+1,:));
        %for i = 0:29
         %   segmented_eeg_alpha_norm(i+1,:) = eeg_alpha_norm(1+(n*i):(n*(i+1)));
            rms_alpha(i+1,1) = rms(segmented_eeg_alpha_norm(i+1,:)); %Calculate RMS for each segment
            std_alpha(i+1,1) = std(segmented_eeg_alpha_norm(i+1,:)); %Calculate STD for each segment
            %pwr_alpha(i+1,1) = bandpower(segmented_eeg_alpha_norm(i+1,:)); %Calculate Power for each segment
        %end
        %rms_alpha1=rms_alpha;
        %std_alpha1=std_alpha;
    end
    entropy_alpha_avg = mean(entropy_alpha);

    n =(length(eeg_beta_norm)/30); % dividing the Theta into 10 even pieces to seperate each pulse
    segmented_eeg_beta_norm = zeros(30, n);% allocating spac
    %entropy_beta = zeros(30, 1);
    %rms_beta = zeros(30, 1);
    %std_beta = zeros(30, 1);
    for i = 0:29
        segmented_eeg_beta_norm(i+1,:) = eeg_beta_norm(1+(n*i):(n*(i+1)));
        entropy_beta(i+1,1) = entropy(segmented_eeg_beta_norm(i+1,:));
        %for i = 0:29
         %   segmented_eeg_beta_norm(i+1,:) = eeg_beta_norm(1+(n*i):(n*(i+1)));
            rms_beta(i+1,1) = rms(segmented_eeg_beta_norm(i+1,:)); %Calculate RMS for each segment
            std_beta(i+1,1) = std(segmented_eeg_beta_norm(i+1,:)); %Calculate STD for each segment
            %pwr_beta(i+1,1) = bandpower(segmented_eeg_beta_norm(i+1,:)); %Calculate Power for each segment
        %end
        %rms_beta1=rms_beta;
        %std_beta1=std_beta;
    end
    entropy_beta_avg = mean(entropy_beta);

end