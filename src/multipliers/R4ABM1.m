function answer = R4ABM1(i, j)
	%command = "cat verilog_Code.v >> template.v";
	%diary('verilog_Code.v');
	a = con_dec_bin(i);
	b = con_dec_bin(j);

		stage1_results = od_to_td_R4ABM1(pp_gen(a, b));
		stage2_results = stage1_2_R4ABM1(stage1_results);
		stage3_results = stage2_3_R4ABM1(stage2_results);
		stage4_results = stage3_4_R4ABM1(stage3_results);
		stage5_results = stage4_5_R4ABM1(stage4_results);
		stage6_results = stage5_6_R4ABM1(stage5_results);
		stage7_results = stage6_cla_R4ABM1(stage6_results);

		print_pp(stage1_results);
		print_pp(stage2_results);
		print_pp(stage3_results);
		print_pp(stage4_results);
		print_pp(stage5_results);
		print_pp(stage6_results);
		print_pp(stage7_results);

	function answer = con_dec_bin(dec)
		bin = dec2bin(dec, 16);
		for i = 1:1:16
			answer(i) = str2double(bin(i));
		end
		answer = flip(answer);
	end

	stage7_results;
	answer = typecast(uint32(bi2de(stage7_results)), 'int32');
end
