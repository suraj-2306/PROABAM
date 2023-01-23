function [array_out] = filter_array(array_in)
    j = 1;
    for i = 1:1:length(array_in)
        if array_in(i) ~= 2
            array_out(j) = array_in(i);
            j = j + 1;
        end
    end
end
