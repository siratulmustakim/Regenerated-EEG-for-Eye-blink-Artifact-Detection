
% blink IC

% taking the fst IC from each IC file. 

M = dir('blink_IC_*.mat');
len = length(M);

for file = 1:len

    fname = sprintf('blink_IC_%d.mat', file);
    load(fname);  % by default, name is IC 

    k = skewness(IC(1, :));

    skew(file, 1) = k;

end

save('skewness_blink_IC.mat', "skew");


%%%%%%%%%%%%%%%%%%%


% clean IC

% taking the fst IC from each IC file. 

M = dir('clean_IC_*.mat');
len = length(M);

for file = 1:len

    fname = sprintf('clean_IC_%d.mat', file);
    load(fname);  % by default, name is IC 

    k = skewness(IC(1, :));

    skew(file, 1) = k;

end

save('skewness_clean_IC.mat', "skew");





