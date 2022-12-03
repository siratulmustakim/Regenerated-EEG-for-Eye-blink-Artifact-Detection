
% taking the fst IC from each IC file. 


% blink IC

% taking the fst IC from each IC file. 

M = dir('blink_IC_*.mat');
len = length(M);

for file = 1:len

    fname = sprintf('blink_IC_%d.mat', file);
    load(fname);  % by default, name is IC 

    k = std(IC(1, :));

    std_dev(file, 1) = k;

end

save('std_dev_blink_IC.mat', "std_dev");



%%%%%%%%%%%%%%%%%%%%%%%



% clean IC
M = dir('clean_IC_*.mat');
len = length(M);

for file = 1:len

    fname = sprintf('clean_IC_%d.mat', file);
    load(fname);  % by default, name is IC 

    k = std(IC(1, :));

    std_dev(file, 1) = k;

end

save('std_dev_clean_IC.mat', "std_dev");



