% peak to peak amplitude feature from meagmohit github EyeBlink Dataset_mat 

M = dir('blink_IC*.mat');
len = length(M);


for i = 1:len      % cz total epochs 1319
    fname = sprintf('blink_IC_%d.mat', i);
    load(fname);

   z = peak2peak(IC(1, :), 2);          % dimension = 2 means we select for rowwise calculation. so for each channel we get a value. 
   blink_IC(i, :) = z;

end



name = sprintf('peak2peak_blink_IC.mat');
save(name, 'blink_IC');


% ****** Clean data***************


M = dir('clean_IC*.mat');
len = length(M);


for i = 1:len      % cz total epochs 1319
    fname = sprintf('clean_IC_%d.mat', i);
    load(fname);

    % only fst IC nibo
   z = peak2peak(IC(1, :), 2);        % dimension = 2 means we select for rowwise calculation. so for each channel we get a value. 
   clean_IC(i, :) = z;

end



name = sprintf('peak2peak_clean_IC.mat');
save(name, 'clean_IC');




























