function answer = B16Ex(i, j)
	a = con_dec_bin(i);
	b = con_dec_bin(j);
		stage1_results = od_to_td_B16Ex(pp_gen(a, b));
		stage2_results = stage1_2_B16Ex(stage1_results);
		stage3_results = stage2_3_B16Ex(stage2_results);
		stage4_results = stage3_4_B16Ex(stage3_results);
		stage5_results = stage4_5_B16Ex(stage4_results);
		stage6_results = stage5_6_B16Ex(stage5_results);
		stage7_results = stage6_cla_B16Ex(stage6_results);

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
