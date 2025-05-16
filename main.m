clc;
clear all;

% HARDCODED, CHANGES WITH MAP OF THE ENVIRONMENT
bit_count = 8; % [4 = paper, 8 = experimental]
m = 30; % Number of static obstacles,
% HARDCODED, CHANGES WITH MAP OF THE ENVIRONMENT

% Provide inputs
N = 20; % Number of candiates per generation
num_iter = 50; % How many generations to try

% HARDCODED, if you change this, you must provide a new feasible path in
% random_g1.m
s_loc = 15;
e_loc = 95;

% Input, starting location and finishing location
[point_mat, path_index, point_ls] = load_dat(s_loc,e_loc);
% Setup global varialbes
global global_elite_count;
global global_elite_path;
global global_elite_fitness;
global most_fit_candidate;
global current_candidate_fitness;
global_elite_count = 1;
global_elite_path = [];
most_fit_candidate = [];
current_candidate_fitness = 0;
global_elite_fitness = 0;
% Setup global varialbes

% Setup experiment
gen_count = 1;
plot_path = 1;

% Preallocate movie structure (DeepSeekV3)
% M(num_iter) = struct('cdata', [], 'colormap', []);

v = VideoWriter('output.mp4', 'MPEG-4'); % Create video writer object
v.FrameRate = 10; % Set frame rate to 24 fps
open(v);

% random_g1 is modified to insert some possible path.
% Possible path locations are subject to human judgement
[x_current, chromo_len] = random_g1(N,bit_count,m,point_ls(1,1), point_ls(1,2), point_ls(1,3), point_ls(1,4));
%x_current % Debug

f = figure;
f.Visible = 'off';

for i = 1:num_iter
    gen_count = i; % Track current generation number
    if (gen_count > 1)
        seed_tab = 0; % Ensure we are seeing the correct table
    end
    fprintf("---------------------------------------Generation %d -----------------------------------\n",gen_count);
    fprintf("\n")
    x_future = run_genetic_algo(gen_count,bit_count, ...
        x_current, ...
        N, ...
        path_index, ...
        point_mat, ...
        point_ls,m);
    
    % Draw path figure here
    print_best_path(f, ...
        most_fit_candidate, ...
        current_candidate_fitness, ...
        gen_count, point_mat, ...
        point_ls, path_index);
    
    % Capture frame
    % M(i) = getframe; % Capture the current figure as a frame

    % Capture and write frame
    frame = getframe(f);
    writeVideo(v, frame);

    % Update to go to next generation
    x_current = x_future;
    fprintf("")
    %fprintf("\n---------------------------------------################ -----------------------------------\n");
end