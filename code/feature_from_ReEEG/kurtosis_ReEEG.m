

% taking the fst IC from each IC file. 

% ekta IC er ReEEG te all channel e kurtosis same value dei. So only fst chan
% er value nilam.

M = dir('ReEEG_blink*.mat');
len = length(M);

for file = 1:len

    fname = sprintf('ReEEG_blink%d.mat', file);
    load(fname);  % by default, name is IC 

     k = kurtosis(regen(1, :));

    kurt(file, 1) = k;

end

save('kurt_blink_ReEEG.mat', "kurt");



