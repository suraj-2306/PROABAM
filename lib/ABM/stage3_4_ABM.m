function stage3_out = stage3_4_ABM(stage3_in)
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
		[array_filtered] = filter_array( stage3_in(:, i));
		fil_arr_length=		length(array_filtered);
		if fil_arr_length>2
			two_pass =0;
		end

		[arg_c(i),count_matrix] = assign_comp(fil_arr_length,count_matrix,two_pass);
		[inter_stage(i).C, inter_stage(i).S] = fit_compressor(arg_c(i), stage3_in(:, i));

	end

	stage3_out = 2 * ones(5, 32);
		%verilog_format(arg_c,inter_stage,3);

	inter_arry = inter_stage(1).S;
	stage3_out(1:length(inter_arry), 1) = inter_arry;
	for j = 2:1:32
		inter_arry = [inter_stage(j).S, inter_stage(j - 1).C];
		stage3_out(1:length(inter_arry), j) = inter_arry;
	end





	%old stage removal
		%stage3_out(4,21) =2;
	%stage3_out(4,20) =2;
	%stage3_out(4,19) =2;
	%stage3_out(4,18) =2;
	%stage3_out(4,17) =2;
	%stage3_out(4,16) =2;
	%stage3_out(4,15) =2;

	%stage3_out(2,17) =2;
	%stage3_out(2,18) =2;
	%stage3_out(2,19) =2;
	%stage3_out(2,20) =2;
	%stage3_out(2,21) =2;

	%stage3_out(3,24) =2;
	%stage3_out(3,23) =2;
	%stage3_out(3,22) =2;
	%stage3_out(3,16)=2;

end
