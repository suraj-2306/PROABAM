function o_sum = full_adder(i_bit1, i_bit2, i_carry)

    w_WIRE_1 = xor(i_bit1, i_bit2);
    w_WIRE_2 = and(w_WIRE_1, i_carry);
    w_WIRE_3 = and(i_bit1, i_bit2);

    o_sum = xor(w_WIRE_1, i_carry);
end
