function pp_out_stage1 = pp_gen(num_a, num_b)

    % num_a_padded = pad_no(num_a)
    % num_b_padded = pad_no(num_b)
    num_a_padded = [0, num_a];
    num_b_padded = [0, num_b];

    for j = 0:2:15
        % w(bin_index(j), :) = signal_gen ([num_b_padded(bin_index(j + 2)), num_b_padded(bin_index(j + 1)), num_b_padded(bin_index(j)), num_a_padded(9)]);
        w(bin_index(j), :) = [num_b_padded(bin_index(j + 2)), num_b_padded(bin_index(j + 1)), num_b_padded(bin_index(j))];
        sign_array(bin_index(j), :) =  signal_gen ([num_b_padded(bin_index(j + 2)), num_b_padded(bin_index(j + 1)), num_b_padded(bin_index(j)), num_a_padded(17)]);
        % sign_array(bin_index(j), :) =  signal_gen ([num_b_padded(bin_index(j + 2)), num_b_padded(bin_index(j + 1)), num_b_padded(bin_index(j))]);
        for i = 0:1:15
            if j == 0
                % w(bin_index(j), :);
                % num_a_padded(bin_index(i));
                % num_a_padded(bin_index(i + 1));
                ppij_output(bin_index(i)) =  ppij([w(bin_index(j), :), num_a_padded(bin_index(i + 1)), num_a_padded(bin_index(i))]);
            elseif j == 2
                ppij_output(bin_index(8 * j + i + 3)) = ppij([w(bin_index(j), :), num_a_padded(bin_index(i + 1)), num_a_padded(bin_index(i))]);
            else
                ppij_output(bin_index(8 * j + i + 1 + j)) = ppij([w(bin_index(j), :), num_a_padded(bin_index(i + 1)), num_a_padded(bin_index(i))]);
            end

        end
        %
        % - - - -     s_b s s x x x x
        % - - - 1     s_b x x x x - neg1
        % - - 1 s_b x     x x x - neg2
        if j == 0
            ppij_output(bin_index(16)) = not(sign_array(bin_index(0), bin_index(3)));
            ppij_output(bin_index(17)) = not(sign_array(bin_index(0), bin_index(3)));
			ppij_output(bin_index(18)) = sign_array(bin_index(0), bin_index(3)); 
			%//actual expressoin temp arrangement
            %ppij_output(bin_index(18)) = 0;

        else
			ppij_output(bin_index(8 * j + j + 15 + 2)) = sign_array(bin_index(j), bin_index(3)); 
			%actual expression
            %ppij_output(bin_index(8 * j + j + 15 + 2)) = 1;
            ppij_output(bin_index(8 * j + j + 15 + 3)) = 1;
			%temp arrangement should be 1
        end
    end

    % sign correction at each row
    % ppij_output(bin_index(41)) = sign_array(bin_index(0), bin_index (0));
    % ppij_output(bin_index(42)) = sign_array(bin_index(2), bin_index (0));
    % ppij_output(bin_index(43)) = sign_array(bin_index(4), bin_index (0));
    % ppij_output(bin_index(44)) = sign_array(bin_index(6), bin_index (0));
    ppij_output(bin_index(145)) = sign_array(bin_index(0), bin_index (0));
    ppij_output(bin_index(146)) = sign_array(bin_index(2), bin_index (0));
    ppij_output(bin_index(147)) = sign_array(bin_index(4), bin_index (0));
    ppij_output(bin_index(148)) = sign_array(bin_index(6), bin_index (0));
    ppij_output(bin_index(149)) = sign_array(bin_index(8), bin_index (0));
    ppij_output(bin_index(150)) = sign_array(bin_index(10), bin_index (0));
    ppij_output(bin_index(151)) = sign_array(bin_index(12), bin_index (0));
    ppij_output(bin_index(152)) = sign_array(bin_index(14), bin_index (0));
    % ppij_output(bin_index(153)) = sign_array(bin_index(9), bin_index (0));

    pp_out_stage1 =  ppij_output;

    function result = pad_no(unpad_no)
        if unpad_no(16)
            padding = 1;
        else
            padding = 0;
        end
        result = [padding, unpad_no];

    end

end
