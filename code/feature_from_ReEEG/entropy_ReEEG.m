
% taking the fst IC from each IC file. 
% so , reeeg er 196*1024 file er only fst 14 row nibo, cz ei 14 ta fst IC
% theke generated.

%%%%%%%%%% HERE STARTS THE MAIN %%%%%%%%%%%%

% for 14 channel clean data

M = dir('ReEEG_clean*.mat');
len = length(M);



for i = 1:len      % cz total epochs 1319
    fname = sprintf('ReEEG_clean%d.mat', i);
    load(fname);

for j = 1:14    
         temp  = -(wentropy(regen(j, :), 'shannon')); 
         clean_reeeg(i, j)  = temp/10000; % entropy value gulo onk large hoe, classifier train korate jhamela. so smaller kore nilam. 
  

end
end


name = sprintf('entropy_clean_ReEEG.mat');
save(name, 'clean_reeeg');

%*****************************

% for 14 channel_blink IC

M = dir('ReEEG_blink*.mat');
len = length(M);



for i = 1:len      % cz total epochs 1319
    fname = sprintf('ReEEG_blink%d.mat', i);
    load(fname);

for j = 1:14    
         temp  = -(wentropy(regen(j, :), 'shannon')); 
         blink_reeeg(i, j)  = temp/10000; % entropy value gulo onk large hoe, classifier train korate jhamela. so smaller kore nilam. 
  

end
end


name = sprintf('entropy_blink_ReEEG.mat');
save(name, 'blink_reeeg');










