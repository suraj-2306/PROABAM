% two_pass is for either passthrough of the 22 compressor
% 9 is for two pass
function [arg_struct, count_matrix]  = assign_comp(array_length, count_matrix, two_pass)
    arg_struct = struct('Loc_num', [], 'Comp_no', []);

    loc_i = 1;
    while array_length ~= 0
        if array_length >= 4
            if isequal(count_matrix,   zeros(size(count_matrix)))
                arg_struct.Loc_num = [arg_struct.Loc_num, loc_i];
                arg_struct.Comp_no = [arg_struct.Comp_no, 4];
                loc_i = loc_i + 4;
                array_length = array_length - 4;
            else
                arg_struct.Comp_no = [arg_struct.Comp_no, count_matrix(rnonz(count_matrix))];
                arg_struct.Loc_num = [arg_struct.Loc_num, loc_i];
                count_matrix(rnonz(count_matrix)) = 0;
                loc_i = loc_i + 4;
                array_length = array_length - 4;
            end
        else
            if array_length == 2
                if two_pass
                    arg_struct.Comp_no = [arg_struct.Comp_no, 9];
                else
                    arg_struct.Comp_no = [arg_struct.Comp_no, array_length];
                end
            else
                arg_struct.Comp_no = [arg_struct.Comp_no, array_length];
            end
            arg_struct.Loc_num = [arg_struct.Loc_num, loc_i];
            array_length = 0;
        end
    end

    % //return the first non zero element's postion in the array
    function element = rnonz(c_matrix)
        i = 1;
        while c_matrix(i) == 0
            i = i + 1;
        end
        element = i;
    end

end
