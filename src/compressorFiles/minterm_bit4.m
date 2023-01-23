function result = minterm_bit4(a, b, c, d, minterm)

    bin_num = dec2bin(minterm, 4);

    a_val =  assign_value(a, 1);
    b_val =  assign_value(b, 2);
    c_val =  assign_value(c, 3);
    d_val = assign_value(d, 4);

    result = gate_and4(a_val, b_val, c_val, d_val);

    function value = assign_value(input_bit, pos)
        if str2num(bin_num(pos)) == 1
            value = input_bit;
        else
            value = ~input_bit;
        end
    end

end
