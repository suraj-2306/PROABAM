function result = minterm_bit5(a, b, c, d, e, minterm)

    bin_num = dec2bin(minterm, 5);
    % minterm_flip = flip(minterm)

    a_val =  assign_value(a, 1);
    b_val =  assign_value(b, 2);
    c_val =  assign_value(c, 3);
    d_val = assign_value(d, 4);
    e_val = assign_value(e, 5);

    result = gate_and5(a_val, b_val, c_val, d_val, e_val);

    function value = assign_value(input_bit, pos)
        if str2num(bin_num(pos)) == 1
            value = input_bit;
        else
            value = ~input_bit;
        end
    end

end
