function [p_carry, p_sum] = comp_22(array_in)
    a = array_in(1);
    b = array_in(2);
    p_carry = a & b;
    p_sum = xor(a, b);
end
