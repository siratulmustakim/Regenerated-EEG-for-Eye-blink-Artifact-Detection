% dataset: github_meagmohit->my_csv



%%%%%%%%%% HERE STARTS THE MAIN %%%%%%%%%%%%

% for 14 channel clean data
M = dir('clean_IC*.mat');
len = length(M);



for i = 1:len      % cz total epochs 1319
    fname = sprintf('clean_IC_%d.mat', i);
    load(fname);

   
         temp  = -(wentropy(IC(1, :), 'shannon')); 
         clean_IC(i, 1)  = temp/10000; % entropy value gulo onk large hoe, classifier train korate jhamela. so smaller kore nilam. 
 
end


name = sprintf('entropy_clean_IC.mat');
save(name, 'clean_IC');

%*****************************

% for 14 channel_blink IC

M = dir('blink_IC*.mat');
len = length(M);



for i = 1:len      % cz total epochs 1319
    fname = sprintf('blink_IC_%d.mat', i);
    load(fname);

    
         temp  = -(wentropy(IC(1, :), 'shannon')); 
         blink_IC(i, 1)  = temp/10000; % entropy value gulo onk large hoe, classifier train korate jhamela. so smaller kore nilam. 
  
end


name = sprintf('entropy_blink_IC.mat');
save(name, 'blink_IC');










