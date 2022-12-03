% taking the fst IC from each IC file. 
% so , reeeg er 196*1024 file er only fst 14 row nibo, cz ei 14 ta fst IC
% theke generated.

% peak to peak amplitude feature from meagmohit github EyeBlink Dataset_mat 

M = dir('ReEEG_blink*.mat');
len = length(M);


for i = 1:len      % cz total epochs 1319
    fname = sprintf('ReEEG_blink%d.mat', i);
    load(fname);

    for j =1:14
   z = peak2peak(regen(j, :), 2);          % dimension = 2 means we select for rowwise calculation. so for each channel we get a value. 
   blink_reeeg(i, j) = z;

    end

end



name = sprintf('peak2peak_blink_ReEEG.mat');
save(name, 'blink_reeeg');


% ****** Clean data***************


M = dir('ReEEG_clean*.mat');
len = length(M);


for i = 1:len      % cz total epochs 1319
    fname = sprintf('ReEEG_clean%d.mat', i);
    load(fname);

    for j =1:14
   z = peak2peak(regen(j, :), 2);          % dimension = 2 means we select for rowwise calculation. so for each channel we get a value. 
   clean_reeeg(i, j) = z;

    end

end



name = sprintf('peak2peak_clean_ReEEG.mat');
save(name, 'clean_reeeg');




























