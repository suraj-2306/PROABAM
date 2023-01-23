% Error_distance                 ED
% Sumof_Error_distances          SED
% Squareof_Sumof_Error_distances SSED
% Error_cases_counter            ECC
% Mean_error_distance            MED
% Normalized_error_distance      NED % Relative_error_distance        RED
% Sumof_Relative_error_distance  SRED
% Mean_relative_error_distance   MRED
% Error_Array EA

clc;
clear;
format long;

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

print = 0;
for i = -128:1:127
    for j = -128:1:127
        if i ~= 0 && j ~= 0
            result = double(pp_gen_test(i, j, print));
            acc_result = double(i * j);
            ED = abs(acc_result - result);
            if ED > 0
                ED;
                SED  = ED  + SED;
                ECC  = ECC + 1;
                RED  = ED / abs(acc_result);
                SRED = RED + SRED;
                SSED = ED^2 + SSED;
                EA(i + 129, j + 129) = ED;
            end
        end
    end
end

MED = SED / (2^(32));
NED = MED / (32767 * 32767);
MRED = SRED / (2^(32));
MSE = SSED / (2^(32));

save("Approx_prob_compressor_max.mat");
