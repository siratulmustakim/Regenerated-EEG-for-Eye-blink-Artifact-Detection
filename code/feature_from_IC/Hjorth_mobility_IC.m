
% This is the Hjorth mobility feature extraction. 
% Hjporth = std_dev(1st derivative/gradiant of signal) / std_dev(signal)
% for calculating fst derivative, while the indep var (time) difference is constant,
% gradient can be used. Source: 

% source Hjprth: https://en.wikipedia.org/wiki/Hjorth_parameters

M = dir('clean_IC_*.mat');
len = length(M);

for file = 1:len

    fname = sprintf('clean_IC_%d.mat', file);
    load(fname);  % by default, name is IC 

   dr = gradient(IC(1, :));  % fst derivative 

up = std(dr);   % std_dev of fst derivative

down = std(IC(1, :)); % std_dev of IC signal

mob = up/down;  % Hjorth mobility

mobility(file, 1) = mob;  % storing all mobility values

end

save('Hjorth_clean_IC.mat', "mobility");



