function td_matrix = od_to_td_ABM(od_array)
    td_matrix = 2 * ones(9, 32);
    td_matrix(1, 1:19) = od_array(1:19);

    td_matrix(2, 1) = od_array(146);
    td_matrix(2, 3:20) = od_array(20:37);

    td_matrix(3, 3) = od_array(147);
    td_matrix(3, 5:22) = od_array(38:55);

    td_matrix(4, 5)  = od_array(148);
    td_matrix(4, 7:24) = od_array(56:73);

    td_matrix(5, 7)  = od_array(149);
    td_matrix(5, 9:26) = od_array(74:91);

    td_matrix(6, 9)  = od_array(150);
    td_matrix(6, 11:28) = od_array(92:109);

    td_matrix(7, 11)  = od_array(151);
    td_matrix(7, 13:30) = od_array(110:127);

    td_matrix(8, 13)  = od_array(152);
    td_matrix(8, 15:32) = od_array(128:145);

    td_matrix(9, 15) = od_array(153);

    % td_matrix(:, 1);
end
