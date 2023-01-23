function [p_carry, p_sum] = comp32(array_in)

    a  = array_in(1);
    b  = array_in(2);
    c  = array_in(3);
    p_sum = xor(a, xor(b, c));
    p_carry = a & b | b & c | a & c;
    % s1 = xor(in_pin(bin_index(1)), in_pin(bin_index(0)));
    % out_pin(bin_index(0)) = xor(in_pin(bin_index(2)), s1);

    % c1 = and(bin_index(in_pin(bin_index(0))), in_pin(bin_index(1)));
    % c2 = and(in_pin(bin_index(2)), s1);
    % out_pin(bin_index(1)) = or(c1, c2);

end
