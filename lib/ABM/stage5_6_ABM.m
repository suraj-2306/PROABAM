function stage5_out = stage5_6_ABM(stage5_in)
	%| Name of compressor | Approximated | cout | Associated number
	%|                    | minterms     |      |
	%| 1 bit              |              | -    | 1
	%| 22comp             |              | -    | 2
	%| 32comp             |              | -    | 3
	%| 42comp_exa         |              | yes  | 4
	%| 42comp             |              | no   | 5
	%| 42comp1            | 14           | no   | 6
	%| 42comp2            | 5            | no   | 7
	%| 42comp3            | 14,5         | no   | 8

	inter_stage = struct('C', [], 'S', []);
	arg_c = struct('Loc_num', [], 'Comp_no', []);
	count_matrix =[];


	two_pass=1;
	for i = 1:1:32
		[array_filtered] = filter_array( stage5_in(:, i));
		fil_arr_length=		length(array_filtered);
				if fil_arr_length>2
			two_pass =0;
		end

		[arg_c(i),count_matrix] = assign_comp(fil_arr_length,count_matrix,two_pass);
		[inter_stage(i).C, inter_stage(i).S] = fit_compressor(arg_c(i), stage5_in(:, i));
	end

	stage5_out = 2 * ones(3, 32);
		%verilog_format(arg_c,inter_stage,5);

	inter_arry = inter_stage(1).S;
	stage5_out(1:length(inter_arry), 1) = inter_arry;
	for j = 2:1:32
		inter_arry = [inter_stage(j).S, inter_stage(j - 1).C];
		stage5_out(1:length(inter_arry), j) = inter_arry;
	end

end
