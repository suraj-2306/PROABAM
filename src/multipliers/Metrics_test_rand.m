% Error_distance                 ED
% Sumof_Error_distances          SED
% Squareof_Sumof_Error_distances SSED
% Error_cases_counter            ECC
% Mean_error_distance            MED
% Normalized_error_distance      NED
% Relative_error_distance        RED
% Sumof_Relative_error_distance  SRED
% Mean_relative_error_distance   MRED
% Error_Array EA

clc;
clear;
format long;

% 1000 iterations will take 7.8 minutes
tStart = cputime;
N = 5000;
N2 = 1;
for count_2 = 1:1:N2
    % count_2 =1
    ED   = 0.0;
    SED  = 0.0;
    SSED = 0.0;
    ECC  = 0.0;
    MED  = 0.0;
    NED  = 0.0;
    RED  = 0.0;
    SRED = 0.0;
    MRED = 0.0;
    EA = 0;
    print = 1;

    for count = 1:1:N
        i = randi([-2^15, 2^15 - 1]);
        j = randi([-2^15, 2^15 - 1]);
        if i ~= 0 && j ~= 0
            result = double(pp_gen_test(i, j, print));
            acc_result = double(i * j);
            ED = abs(acc_result - result);
            if ED > 0
                SED  = ED  + SED;
                ECC  = ECC + 1;
                RED  = ED / abs(acc_result);
                SRED = RED + SRED;
                % SSED = ED^2 + SSED;
                % if(ED>0)
                % fprintf("%d , %d \n",i,j);
                % end
                % EA(i + 1000 + 1, j + 1000 + 1) = ED;
            end
        end
        if mod(count, 100) == 0
            fprintf("%d \n", count);
        end
    end

    MED_array(count_2) = SED / (N);
    NMED_array(count_2) =  MED_array(count_2) / (32767 * 32767);
    MRED_array(count_2) =  SRED / (N);
    % MED= SED / (N);
    % NMED= MED / (32767 * 32767);
    % MRED=  SRED / (N);

    % MSE = SSED / (2^(32));
end

tEnd = cputime - tStart;
save("Proposed_design_2.mat");
