
% taking the fst IC from each IC file. 


% blink IC

% taking the fst IC from each IC file. 

M = dir('blink_IC_*.mat');
len = length(M);

for file = 1:len

    fname = sprintf('blink_IC_%d.mat', file);
    load(fname);  % by default, name is IC 

    k = var(IC(1, :));

    variance(file, 1) = k;

end

save('variance_blink_IC.mat', "variance");



%%%%%%%%%%%%%%%%%%%%%%%



% clean IC
M = dir('clean_IC_*.mat');
len = length(M);

for file = 1:len

    fname = sprintf('clean_IC_%d.mat', file);
    load(fname);  % by default, name is IC 

    k = var(IC(1, :));

    variance(file, 1) = k;

end

save('variance_clean_IC.mat', "variance");



