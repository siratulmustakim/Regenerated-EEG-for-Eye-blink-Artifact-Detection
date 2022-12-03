
% taking the fst IC from each IC file. 

M = dir('clean_IC_*.mat');
len = length(M);

for file = 1:len

    fname = sprintf('clean_IC_%d.mat', file);
    load(fname);  % by default, name is IC 

    k = kurtosis(IC(1, :));

    kurt(file, 1) = k;

end

save('kurt_clean_IC.mat', "kurt");



