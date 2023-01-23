function [p_carry, p_sum] = comp_42AC3(array_in)
    a = array_in(1);
    b = array_in(2);
    c = array_in(3);
    d = array_in(4);

    % the sum  array with 5 and 15 as the approximation
    minterm_sum = [1, 2, 4, 5, 7, 8, 11, 13, 14, 15];
    % the carry sum
    minterm_carry = [3, 5, 6, 7, 9, 10, 11, 12, 13, 14, 15];
    p_carry = 0;
    p_sum = 0;

    for i = 1:1:length(minterm_sum)
        p_sum = or(p_sum, minterm_bit4(a, b, c, d, minterm_sum(i)));
    end
    for i = 1:1:length(minterm_carry)
        p_carry  = or(p_carry, minterm_bit4(a, b, c, d, minterm_carry(i)));
    end
    % p_sum = ()
    % p_sum = prob_xor([prob_xor([a, b]), prob_xor([c, d])]) + a * b * c * d;
    % p_carry1 = a * b;
    % p_carry2 = a * c + b * c - 2 * a * b * c + a * d + b * d - 2 * a * b * d - a * c * d - b * c * d + 2 * a * b * c * d;
    % p_carry = p_carry1 + p_carry2 + (1 - a) * (1 - b) * c * d;
    % [p_sum,p_carry]
end
