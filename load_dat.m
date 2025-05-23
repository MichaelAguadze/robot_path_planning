function [point_mat, path_index, point_ls, bit_count] = load_dat(start_loc, finish_loc)

% HARDCODED, CHANGES WITH MAP OF THE ENVIRONMENT
bit_count = 7; % [4 = paper, 8 = experimental]
m = 30; % Number of static obstacles, 
start_point = start_loc; % Location in point index
finish_point = finish_loc; % Location in point index

% HARDCODED, CHANGES WITH MAP OF THE ENVIRONMENT
% Range for point index
min_point_index = 1;
max_point_index = 100;

% Return an array of useful points for later use
point_ls = [start_point,finish_point,min_point_index,max_point_index];

% Function to load point_mat and path_index [LATER]
% Generate tables showing point encoding and admissible path
% HARCODED, needs to be adjusted for each static map
point_mat_ls = linspace(1,max_point_index,max_point_index);
point_mat_ls = transpose(point_mat_ls);



loc_xy = [
    2.1 23.6;
    6.4 30.0;
    6.4 2.1;
    10.7 17.1;
    12.9 23.6;
    12.9 8.6;
    17.1 8.6;
    21.4 2.1;
    21.4 15.0;
    21.4 23.6;
    23.6 30.0;
    27.9 25.7;
    25.7 4.3;
    30.0 17.1;
    0.0 0.0;
    3.8 0.0;
    7.5 0.0;
    11.2 0.0;
    15.0 0.0;
    18.8 0.0;
    22.5 0.0;
    26.2 0.0;
    30.0 0.0;
    0.0 3.8;
    3.8 3.8;
    7.5 3.8;
    11.2 3.8;
    15.0 3.8;
    18.8 3.8;
    22.5 3.8;
    26.2 3.8;
    30.0 3.8;
    0.0 7.5;
    3.8 7.5;
    7.5 7.5;
    11.2 7.5;
    15.0 7.5;
    18.8 7.5;
    22.5 7.5;
    26.2 7.5;
    30.0 7.5;
    0.0 11.2;
    3.8 11.2;
    7.5 11.2;
    11.2 11.2;
    15.0 11.2;
    18.8 11.2;
    22.5 11.2;
    26.2 11.2;
    30.0 11.2;
    0.0 15.0;
    3.8 15.0;
    7.5 15.0;
    11.2 15.0;
    15.0 15.0;
    18.8 15.0;
    22.5 15.0;
    26.2 15.0;
    30.0 15.0;
    0.0 18.8;
    3.8 18.8;
    7.5 18.8;
    11.2 18.8;
    15.0 18.8;
    18.8 18.8;
    22.5 18.8;
    26.2 18.8;
    30.0 18.8;
    0.0 22.5;
    3.8 22.5;
    7.5 22.5;
    11.2 22.5;
    15.0 22.5;
    18.8 22.5;
    22.5 22.5;
    26.2 22.5;
    30.0 22.5;
    0.0 26.2;
    3.8 26.2;
    7.5 26.2;
    11.2 26.2;
    15.0 26.2;
    18.8 26.2;
    22.5 26.2;
    26.2 26.2;
    30.0 26.2;
    0.0 30.0;
    3.8 30.0;
    7.5 30.0;
    11.2 30.0;
    15.0 30.0;
    18.8 30.0;
    22.5 30.0;
    26.2 30.0;
    30.0 30.0;
    2.0 28.5;
    27.0 28.5;
    27.0 13.0;
    21.0 27.5;
    2.1 15.0;
];


point_mat = [point_mat_ls, loc_xy];

path_index = [
    1 69 70 79 0 0;
    2 88 89 0 0 0;
    3 16 26 17 0 0;
    4 53 63 0 0 0;
    5 72 82 0 0 0;
    6 36 46 0 0 0;
    7 37 48 38 0 0;
    8 20 30 21 0 0;
    9 56 57 0 0 0;
    10 74 85 0 0 0;
    11 93 94 0 0 0;
    12 76 85 86 0 0;
    13 31 40 41 0 0;
    14 59 68 0 0 0;
    15 24 16 0 0 0;
    16 15 3 17 0 0;
    17 16 3 18 0 0;
    18 17 19 0 0 0;
    19 18 28 20 0 0;
    20 19 8 21 0 0;
    21 8 20 22 0 0;
    22 21 23 0 0 0;
    23 22 32 0 0 0;
    24 15 33 25 0 0;
    25 24 26 0 0 0;
    26 25 27 0 0 0;
    27 26 28 0 0 0;
    28 19 27 37 29 0;
    29 28 30 0 0 0;
    30 29 39 31 8 0;
    31 30 13 32 0 0;
    32 31 41 23 0 0;
    33 24 42 34 0 0;
    34 33 35 0 0 0;
    35 34 36 0 0 0;
    36 35 6 37 0 0;
    37 36 46 7 38 28; 
    38 37 7 39 0 0;
    39 38 40 30 0 0;
    40 39 41 13 0 0;
    41 40 50 32 13 0;
    42 33 51 43 0 0;
    43 42 44 0 0 0;
    44 43 45 0 0 0;
    45 44 46 0 0 0;
    46 45 47 55 0 0;
    47 46 48 0 0 0;
    48 47 49 7 0 0;
    49 48 98 50 0 0;
    50 49 59 41 0 0;
    51 42 60 100 0 0;
    52 100 53 0 0 0;
    53 52 4 54 0 0;
    54 53 55 0 0 0;
    55 54 64 56 46 0;
    56 55 9 0 0 0;
    57 9 58 0 0 0;
    58 57 67 59 98 0;
    59 58 14 50 0 0;
    60 51 69 61 0 0;
    61 60 62 0 0 0;
    62 61 71 63 0 0;
    63 62 64 4 0 0;
    64 63 65 55 73 0;
    65 64 66 0 0 0;
    66 65 67 75 0 0;
    67 66 77 68 58 0;
    68 67 14 77 0 0;
    69 60 78 1 0 0;
    70 1 71 0 0 0;
    71 70 72 62 0 0;
    72 71 5 73 0 0;
    73 72 74 84 64 0;
    74 73 75 10 0 0;
    75 74 76 66 0 0;
    76 75 12 0 0 0;
    77 67 68 86 0 0;
    78 69 87 0 0 0;
    79 96 80 1 0 0;
    80 79 81 0 0 0;
    81 80 82 0 0 0;
    82 81 91 83 5 73;
    83 82 99 84 0 0;
    84 83 85 0 0 0;
    85 84 97 12 10 0;
    86 12 77 95 0 0;
    87 78 88 0 0 0;
    88 87 2 0 0 0;
    89 2 90 0 0 0;
    90 89 91 0 0 0;
    91 90 92 0 0 0;
    92 91 93 0 0 0;
    93 92 99 11 0 0;
    94 11 95 0 0 0;
    95 94 86 97 0 0;
    96 88 79 0 0 0;
    97 85 95 0 0 0;
    98 49 58 0 0 0;
    99 83 93 0 0 0; 
    100 51 52 0 0 0;
    ]
end


