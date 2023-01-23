function [Carry, Sum] = fit_compressor(specs_array, array_in)
	% Comp_numbers
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
	%| 22 pass through    |				 | -    | 9

	[fil_array_in] = filter_array(array_in);
	%if Exist
	for i = 1:length(specs_array.Comp_no)
		loc_temp = specs_array.Loc_num(i);
		switch specs_array.Comp_no(i)
			case 1
				Carry_inter = 2;
				Sum_inter = fil_array_in(loc_temp);
				add_to_array;
			case 2
				loc_temp_up = loc_temp + 1;
				[Carry_inter, Sum_inter] = comp_22(fil_array_in(loc_temp:loc_temp_up));
				add_to_array;
			case 3
				loc_temp_up = loc_temp + 2;
				[Carry_inter, Sum_inter] = comp_32(fil_array_in(loc_temp:loc_temp_up));
				add_to_array;
			case 4
				loc_temp_up = loc_temp + 3;
				[Cout_inter,Carry_inter, Sum_inter] = comp_42_exa(fil_array_in(loc_temp:loc_temp_up));
				if exist('Carry', 'var')
					Carry = [Carry, Carry_inter];
					Carry = [Carry,Cout_inter];
					Sum = [Sum, Sum_inter];
					%Cout = [Cout,Cout_inter];
					%Carry = [Carry,Cout];
				else
					Carry = Carry_inter;
					Sum = Sum_inter;
					Cout = Cout_inter;
					if exist('Cout', 'var')
						Carry = [Carry,Cout];
					end

				end
			case 5
				loc_temp_up = loc_temp + 3;
				[Carry_inter, Sum_inter] = comp_42AC1(fil_array_in(loc_temp:loc_temp_up));
				add_to_array;
			case 6
				loc_temp_up = loc_temp + 3;
				[Carry_inter, Sum_inter] = comp_42AC2(fil_array_in(loc_temp:loc_temp_up));
				add_to_array;
			case 7
				loc_temp_up = loc_temp + 3;
				[Carry_inter, Sum_inter] = comp_42AC3(fil_array_in(loc_temp:loc_temp_up));
				add_to_array;
			case 8
				loc_temp_up = loc_temp + 3;
				[Carry_inter, Sum_inter] = comp_42AC4(fil_array_in(loc_temp:loc_temp_up));
				add_to_array;
			case 9
				loc_temp_up =loc_temp+1;
				%if exist('Carry', 'var')
				Carry = 2;
				Sum_inter = fil_array_in(loc_temp+1);
				Sum = fil_array_in(loc_temp);
				Sum = [Sum, Sum_inter];
				%end
		end
		%else
		%Sum = 2;
		%Carry = 2;
	end

	function add_to_array
		if exist('Carry', 'var')
			Carry = [Carry, Carry_inter];
			Sum = [Sum, Sum_inter];
		else
			Carry = Carry_inter;
			Sum = Sum_inter;
		end
	end

end
