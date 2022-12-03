
% taking the fst IC from each IC file. 
% so , reeeg er 196*1024 file er only fst 14 row nibo, cz ei 14 ta fst IC
% theke generated.

% taking the fst IC from each IC file. 

% blink IC


M = dir('ReEEG_blink*.mat');
len = length(M);

for file = 1:len

    fname = sprintf('ReEEG_blink%d.mat', file);
    load(fname);  % by default, name is IC 

    for i = 1:14
    k = min(regen(i, :));

    mn(file, i) = k;

    end

end

save('min_blink_ReEEG.mat', "mn");



%%%%%%%%%%%%%%%%%%%%%%%



% clean IC
M = dir('ReEEG_clean*.mat');
len = length(M);

for file = 1:len

    fname = sprintf('ReEEG_clean%d.mat', file);
    load(fname);  % by default, name is IC 

    for i = 1:14
    k = min(regen(i, :));

    mn(file, i) = k;

    end

end

save('min_clean_ReEEG.mat', "mn");



