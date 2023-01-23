function print_pp(pp_matrix)
    formatSpec = '%d ';
    txt = '2';
    rep = ' ';
    inter_string = num2str(pp_matrix, formatSpec);

    size_matrix =     size(pp_matrix);
    for i = 1:1:size_matrix(1, 1)
        converted_pp_matrix(i, :) = flip(replace(inter_string(i, :), txt, rep));

    end
    for i = 1:1:size_matrix(1, 1)
        fprintf("%s \n", converted_pp_matrix(i, :));
        % converted_pp_matrix
    end
    fprintf("\n");

end
