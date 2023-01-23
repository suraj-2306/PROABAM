function stage1_out = stage1_2_R4ABM1(stage1_in)
	%Compressor Layout
	%| - | - | - | - | 7 | - | 6 | - | - | - | - | - | - | - | - | - |

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
	% Structure idea
	% coloumn number 1d
	% location of starting compressor 2d
	% type of compressors 2d

	arg_c = struct('Loc_num', [], 'Comp_no', []);

	%count_matrix = [8,8,8,8,8,8,8,8,7,7,7,7,6,6,6,6,5,5,5,5];

	count_matrix =[];

	two_pass =1;
	for i = 1:1:32
		[array_filtered] = filter_array( stage1_in(:, i));
		fil_arr_length=		length(array_filtered);

		if fil_arr_length>2
			two_pass =0;
		end

		[arg_c(i),count_matrix] = assign_comp(fil_arr_length,count_matrix,two_pass);
		[inter_stage(i).C, inter_stage(i).S] = fit_compressor(arg_c(i), stage1_in(:, i));
	end

	stage1_out = 2* ones(7,32);
	%verilog_format(arg_c,inter_stage,1);

	inter_arry = inter_stage(1).S;
	stage1_out(1:length(inter_arry), 1) = inter_arry;

	for j = 2:1:32
		inter_arry = [inter_stage(j).S, inter_stage(j - 1).C];
		stage1_out(1:length(inter_arry), j) = inter_arry;
	end
	%stage1_out(6,16) = 2;
	%stage1_out(6,17) = 2;
	%stage1_out(6,18) = 2;
	%stage1_out(6,19) = 2;
	%stage1_out(6,20) = 2;

end
