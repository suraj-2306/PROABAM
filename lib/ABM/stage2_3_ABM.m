function stage2_out = stage2_3_ABM(stage2_in)
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
	%count_matrix =[8,8,7,7];
	%count_matrix = [5,6,6,7];
	count_matrix =[];

	arg_c = struct('Loc_num', [], 'Comp_no', []);

	two_pass =1;

	%stage2_in(7,20)=2;
	%stage2_in(7,19)=2;
	%stage2_in(7,18)=2;
	%stage2_in(7,17)=2;
	%stage2_in(7,16) =2;

	for i = 1:1:32
		[array_filtered] = filter_array( stage2_in(:, i));
		fil_arr_length=		length(array_filtered);
		if fil_arr_length>2
			two_pass =0;
		end
		[arg_c(i),count_matrix] = assign_comp(fil_arr_length,count_matrix,two_pass);
		[inter_stage(i).C, inter_stage(i).S] = fit_compressor(arg_c(i), stage2_in(:, i));
	end

	stage2_out = 2 * ones(6, 32);
	%verilog_format(arg_c,inter_stage,2);

	inter_arry = inter_stage(1).S;
	stage2_out(1:length(inter_arry), 1) = inter_arry;
	for j = 2:1:32
		inter_arry = [inter_stage(j).S, inter_stage(j - 1).C];
		stage2_out(1:length(inter_arry), j) = inter_arry;
	end

	%stage2_out(4,15)=2;
	%stage2_out(4,21)=2;
	%stage2_out(4,22)=2;
	%stage2_out(4,23)=2;

	%stage2_out(4,15) =2;
	%stage2_out(4,16) =2;
	%stage2_out(4,17) =2;
	%stage2_out(4,18) =2;
	%stage2_out(4,19) =2;
	%stage2_out(4,20) =2;
	%stage2_out(4,21) =2;
	%stage2_out(4,22) =2;
	%stage2_out(4,23) =2;

end
