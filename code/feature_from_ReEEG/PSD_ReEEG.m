                 
% taking the fst IC from each IC file. 
% so , reeeg er 196*1024 file er only fst 14 row nibo, cz ei 14 ta fst IC
% theke generated.


% ************************ HERE STARTS THA MAIN *************************%

% only Fp1 channel considering %
% 14 channel clean data

M = dir('ReEEG*.mat');
len = length(M);


for i=1:len
    p = 1;
    fname = sprintf('ReEEG_clean%d.mat', i);
    load(fname);  % by default, name is IC 

    for j = 1:14

   
    temp(1, :) = pwelch(regen(j, :));  % find psd for each row, and stores rowwise-each row corresponds one channel
    psd(i, p:p+9) = temp(1, 1:10);    % aager bar fst paper e 1-20 ta value nisi, ebar ektu kom nilam
     p = p+10;
    end
    

end

% taking only the first 20 points out of 129 from psd matrix, as freq range
% of (0-around 10)hz shows significant difference for blink and clean psd. 
% psd_main = psd(:, 1:20);



save('psd_clean_ReEEG.mat', "psd");






%**************************************************

% 14 channel blink data

M = dir('ReEEG*.mat');
len = length(M);


for i=1:len
    p = 1;
    fname = sprintf('ReEEG_blink%d.mat', i);
    load(fname);  % by default, name is IC 

    for j = 1:14

   
    temp(1, :) = pwelch(regen(j, :));  % find psd for each row, and stores rowwise-each row corresponds one channel
    psd(i, p:p+9) = temp(1, 1:10);    % aager bar fst paper e 1-20 ta value nisi, ebar ektu kom nilam
     p = p+10;
    end
    

end

% taking only the first 20 points out of 129 from psd matrix, as freq range
% of (0-around 10)hz shows significant difference for blink and clean psd. 
% psd_main = psd(:, 1:20);



save('psd_blink_ReEEG.mat', "psd");



%%%%%%%%%%%%%%%%%%%% DC value subtract korte chaile loop ta evabe change korbe. %%%%%%%%%%%%

% for i=1:len
%     p = 1;
%     fname = sprintf('ReEEG_blink%d.mat', i);
%     load(fname);  % by default, name is IC 
% 
%     for j = 1:14
% 
%    aa = regen(j, :) - mean(regen(j, :));  % DC value subtraction for normalization
% 
%     temp(1, :) = pwelch(aa);  % find psd for each row, and stores rowwise-each row corresponds one channel
%     
%     psd(i, p:p+9) = temp(1, 1:10);    % aager bar fst paper e 1-20 ta value nisi, ebar ektu kom nilam
%      p = p+10;
%     end
%     
% 
% end

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            ???