function o_result = cla(i_add1, i_add2)

    w_C(bin_index(0)) = 0;
    for jj = 0:1:31
        w_G(bin_index(jj))   = and(i_add1(bin_index(jj)), i_add2(bin_index(jj)));
        w_P(bin_index(jj))   = or(i_add1(bin_index(jj)), i_add2(bin_index(jj)));
        w_C(bin_index(jj + 1)) = or(w_G(bin_index(jj)), and(w_P(bin_index(jj)), w_C(bin_index(jj))));
    end
    for ii = 0:1:31
        w_SUM(bin_index(ii)) = full_adder (i_add1(bin_index(ii)), i_add2(bin_index(ii)), w_C(bin_index(ii)));
    end
    o_result = w_SUM;
end
