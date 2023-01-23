% num_a_fir is aj
% num_a_sec is aj_1

% probabilty of ppij_out for this is 3/8
function ppij_out = ppij(ppij_in)
    % //module ppij (input ( 2:0 )signal_gen,input ( 1:0 )aj,output ppij_out);

    % //multiplxer output
    % signal_in_neg = ppij_in(1);
    % signal_in_two = ppij_in(2);
    % signal_in_zero = ppij_in(3);
    % num_a_fir = ppij_in(4);
    % num_a_sec = ppij_in(5);
    num_b_fir = ppij_in(1);
    num_b_sec = ppij_in(2);
    num_b_thi = ppij_in(3);
    num_a_fir = ppij_in(4);
    num_a_sec = ppij_in(5);
    ppij_out = (num_a_sec & ~num_b_fir & num_b_sec & num_b_thi) | (~num_a_fir & num_b_fir & ~num_b_sec & num_b_thi) | (~num_a_fir & num_b_fir & num_b_sec & ~num_b_thi) | (num_a_fir & ~num_b_fir & ~num_b_sec & num_b_thi) | (num_a_fir & ~num_b_fir & num_b_sec & ~num_b_thi) | (~num_a_sec & num_b_fir & ~num_b_sec & ~num_b_thi);

    % mi = (num_a_fir & (~signal_in_two)) | (num_a_sec & signal_in_two);

    % ppij_out  = (~signal_in_zero)& xor(signal_in_neg,mi)
    % ppij_out  = (~signal_in_zero) & ((signal_in_neg & (~mi)) | ((~signal_in_neg) & mi));

end
