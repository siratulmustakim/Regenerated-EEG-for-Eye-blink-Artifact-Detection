
% skewness e ekta IC theke asha 14 chan EEG er all chan same skewness value
% dei. so only fst chan er value nichchi.

% blink IC

% taking the fst IC from each IC file. 

M = dir('ReEEG*.mat');
len = length(M);

for file = 1:len

    fname = sprintf('ReEEG_blink%d.mat', file);
    load(fname);  % by default, name is IC 

    k = skewness(regen(1, :));

    skew(file, 1) = k;

end

save('skewness_blink_ReEEG.mat', "skew");


%%%%%%%%%%%%%%%%%%%


% clean IC

% taking the fst IC from each IC file. 

M = dir('ReEEG*.mat');
len = length(M);

for file = 1:len

    fname = sprintf('ReEEG_clean%d.mat', file);
    load(fname);  % by default, name is IC 

    k = skewness(regen(1, :));

    skew(file, 1) = k;

end

save('skewness_clean_ReEEG.mat', "skew");





