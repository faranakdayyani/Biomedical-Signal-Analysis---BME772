function bandchoosing(entropy_delta_avg,entropy_theta_avg,entropy_alpha_avg,entropy_beta_avg,rms_delta,rms_theta,rms_alpha,rms_beta,std_delta,std_theta,std_alpha,std_beta)%eeg_delta_norm,eeg_theta_norm,eeg_alpha_norm,eeg_beta_norm, fs)
%comparing the entropy avrage, choosing the smallest one and find whether patient is seizing or not:
    j=0;
    if ((entropy_delta_avg<entropy_theta_avg)&&(entropy_delta_avg<entropy_alpha_avg)&&(entropy_delta_avg<entropy_beta_avg))
        selectedsig=entropy_delta_avg;
        disp('delta');
        for i = 0:29
            rms_d = rms_delta(i+1,1); 
            std_d = std_delta(i+1,1); 
            %pwr_d = pwr_delta(i+1,1); 
            if ((rms_d>=0.5428)&&(rms_d<=0.6400)&& (std_d>=0.2127) && (std_d <= 0.3868))
                disp("the person is seizing in segment");disp(i+1);
                j=1;
            end
        end
        if (j==0)
            disp("No Seizures for YOU! What a time to be alive!");
        end
    end

    if ((entropy_theta_avg<entropy_delta_avg)&&(entropy_theta_avg<entropy_alpha_avg)&&(entropy_theta_avg<entropy_beta_avg))
        selectedsig=entropy_theta_avg;
        disp('theta');
        for i = 0:29
            rms_t = rms_theta(i+1,1); 
            std_t = std_theta(i+1,1); 
           % pwr_t = pwr_theta(i+1,1); 
            if ((rms_t>=0.5428)&&(rms_t<=0.6400)&& (std_t>=0.2127) && (std_t <= 0.3868))
                disp("the person is seizing in segment");disp(i+1);
                j=1;
            end
        end
        if (j==0)
            disp("No Seizures for YOU! What a time to be alive!");
        end
    end

    if ((entropy_alpha_avg<entropy_delta_avg)&&(entropy_alpha_avg<entropy_theta_avg)&&(entropy_alpha_avg<entropy_beta_avg))
        selectedsig=entropy_alpha_avg;
        disp('alpha');
        for i = 0:29
            rms_a = rms_alpha(i+1,1); 
            std_a = std_alpha(i+1,1); 
            %pwr_a = pwr_alpha(i+1,1); 
            if ((rms_a>=0.5428)&&(rms_a<=0.6400)&& (std_a>=0.2127) && (std_a <= 0.3868))
                disp("the person is seizing in segment");disp(i+1);
                j=1;
            end
        end
        if (j==0)
            disp("No Seizures for YOU! What a time to be alive!");
        end
    end

    if ((entropy_beta_avg<entropy_delta_avg)&&(entropy_beta_avg<entropy_alpha_avg)&&(entropy_beta_avg<entropy_theta_avg))
        selectedsig=entropy_beta_avg;
        disp('beta');
        for i = 0:29
            rms_b = rms_beta(i+1,1); 
            std_b = std_beta(i+1,1); 
           % pwr_b = pwr_beta(i+1,1); 
            if ((rms_b>=0.5428)&&(rms_b<=0.6400)&& (std_b>=0.2127) && (std_b <= 0.3868))
                disp("the person is seizing in segment");disp(i+1);
                j=1;
            end
        end
        if (j==0)
            disp("No Seizures for YOU! What a time to be alive!");
        end
    end

end