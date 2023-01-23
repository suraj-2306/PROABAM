function print_index(pp_matrix)

	pp_matrix(1,1) =100;
    size_matrix = size(pp_matrix);
    count = 1;
    for i = 0:1:size_matrix(1, 1) - 1
        for j = 0:1:size_matrix(1, 2) - 1
            if pp_matrix(i + 1, j + 1) == 0 | pp_matrix(i + 1, j + 1) == 1
                pp_matrix(i + 1, j + 1) = count;
                count = count + 1;
            end
        end
    end

    formatSpec = '%d ';
    txt = ' 2 ';
    rep = '   ';
    pp_matrix = fliplr(pp_matrix);
    inter_string = num2str(pp_matrix, formatSpec);

    for i = 1:1:size_matrix(1, 1)
        converted_pp_matrix(i, :) = (replace(inter_string(i, :), txt, rep));
    end

	%txt = '2';
	%rep = ' ';
	%inter_string = num2str(pp_matrix, formatSpec);

	%for i = 1:1:size_matrix(1, 1)
		%converted_pp_matrix(i, :) = (replace(inter_string(i, :), txt, rep));
	%end

    for i = 1:1:size_matrix(1, 1)
        fprintf("%s \n", converted_pp_matrix(i, :));
        % converted_pp_matrix
    end
    fprintf("\n");

end
