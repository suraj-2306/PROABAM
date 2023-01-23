function answer_array = stage6_cla_R4ABM2(array_in)
    array_in(array_in == 2) = 0;
    answer_array =  cla(array_in(1, :), array_in(2, :));
end
