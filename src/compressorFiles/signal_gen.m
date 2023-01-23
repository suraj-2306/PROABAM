% 210
% num_b_fir was MSB
function  signal_gen_out = signal_gen(b_in)
    b_in;
    % [num_b_fir, num_b_sec, num_b_thi] = b_in(1:3)
    num_b_fir = logical(b_in(1));
    num_b_sec = logical(b_in(2));
    num_b_thi = logical(b_in(3));
    a9 = logical(b_in(4));
    % b_in

    % b_in(1)
    % w = [];
    w(bin_index(0)) = and(num_b_sec, num_b_thi);
    w(bin_index(1)) = and(not(num_b_sec), not(num_b_thi));

    % //for two
    w(bin_index(2)) = and(w(bin_index(0)), not(num_b_fir));
    w(bin_index(3)) = and(w(bin_index(1)), num_b_fir);
    signal_out_two = or(w(bin_index(3)), w(bin_index(2)));

    % //for zero
    w(bin_index(4)) = and (w(bin_index(0)), num_b_fir);
    w(bin_index(5)) = and (w(bin_index(1)), not(num_b_fir));
    w_z_c = or (w(bin_index(4)), w(bin_index(5)));
    signal_out_zero = w_z_c;

    % //for neg
    w(bin_index(6)) = not(and(w_z_c, 0));
    w(bin_index(7)) = not(and(not(w_z_c), num_b_fir));
    signal_out_neg = not(and(w(bin_index(6)), w(bin_index(7))));
    % signal_out_neg =    (~a9 & num_b_fir & ~num_b_sec) | (~a9 & num_b_fir & ~num_b_thi) | (a9 & ~num_b_fir & num_b_thi) | (a9 & ~num_b_fir & num_b_sec);

    % for E bitsignal_out_E = (~num_b_fir & ~a9) | (num_b_fir & a9) | (~num_b_fir & ~num_b_sec & ~num_b_thi) | (num_b_fir & num_b_sec & num_b_thi);
    % signal_out_E = (~num_b
    % signal_out_E = (~num_b_fir& ~a9) | (num_b_fir& ~num_b_sec & a9) | (num_b_fir & ~num_b_thi & a9)
    % signal_out_E  = (~num_b_fir & ~a9) | (num_b_fir & a9) | (~num_b_fir & ~num_b_sec & ~num_b_thi);
    % signal_out_E = (~num_b_fir & ~a9) | (num_b_fir & ~num_b_sec & a9) | (num_b_fir & ~num_b_thi & a9) | (~num_b_fir & ~num_b_sec & ~num_b_thi);
    signal_out_E = (~num_b_fir & ~a9) | (num_b_fir & a9) | (~num_b_fir & ~num_b_sec & ~num_b_thi) | (num_b_fir & num_b_sec & num_b_thi);
    % signal_out_E = (~num_b_fir & ~a9) | (num_b_fir & a9);
    % signal_out_E  = or(or(and(not(num_b_fir),not(a9)),and(and(num_b_fir,not(num_b_sec)),a9)),and(and(num_b_fir,not(num_b_thi)),a9));
    % signal_out_E = or(and(~signal_out_neg,~a9),and(signal_out_neg,a9));
    signal_gen_out(3) = signal_out_zero;
    signal_gen_out(2) = signal_out_two;
    signal_gen_out(1) = signal_out_neg;
    signal_gen_out(4) = signal_out_E;
end
