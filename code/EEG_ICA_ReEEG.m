
% % My code: ICA decomposition of EEG, then IC to EEG regeneration. For
% each IC (14 ICs), a 14 channel EEG will generate. Thus a total of 14*14
% EEG signals, 1024 sample point matrix will be strored in mat file. 

% take .set formated epochs, mat formated is getting "old format problem'.

% see for dir function: https://www.mathworks.com/help/matlab/ref/dir.html
M = dir('*.set')   % jei folder er file excess korte chai, must oi folder matlab directory te open rakhte hbe/ add path korte hbe. 
%M(3).name

% excluding IC from 14 ICs by setdiff in A
% resource: https://www.mathworks.com/matlabcentral/answers/78589-how-to-exclude-specific-values-from-a-vector
A = [1  2   3   4   5   6   7   8   9  10  11  12  13  14]
% B = 1
% C = setdiff(A, B);


for file = 1:1319  % 1319 is number of files that we want to explore

% loading EEGlab 
[ALLEEG EEG CURRENTSET ALLCOM] = eeglab;

m = 1;
n = 14

    % EEGlab file loading
    EEG = pop_loadset('filename', M(file).name);
    [ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0 );
    EEG = eeg_checkset( EEG );

    % ICA decompose
    EEG = pop_runica(EEG, 'icatype', 'runica', 'extended',1,'interrupt','on');
    [ALLEEG EEG] = eeg_store(ALLEEG, EEG, CURRENTSET);
    EEG = eeg_checkset( EEG );
   
    % IC to EEG regeneration
    for i = 1:14
    C = setdiff(A, i); % excluding element from vector by setdiff
    % resource: https://www.mathworks.com/matlabcentral/answers/78589-how-to-exclude-specific-values-from-a-vector

    EEG = pop_subcomp( ALLEEG(1), C, 0);  % original code  e EEG chilo, EEG holo current dataset, we want to do IC to EEG from initial dataset. So replaced EEG with ALLEEG(1). 
    [ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, 1,'setname','pruned with ICA','gui','off'); 
    
        % storing regenerated EEG values in regen variable
    
    regen(m:n, :) = ALLEEG(i+1).data;  % ALLEEG er 1st file ta origibal EEG file, jetake ICA kori. then regenerated EEG gulo ALLEEG er 2nd row theke accomodate kora hoe. 
    m = m + 14; 
    n = n + 14, 
    end
    
    fname = sprintf('ReEEG_clean%d.mat', file); % creating dynamic file name. 
    save(fname,'regen');  % save as .mat file. 
end

eeglab redraw;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%% TEST CODE %%%%%%%%%%%%

% auto-sequential numbering in .mat files
% resource: https://www.mathworks.com/matlabcentral/answers/390896-how-to-save-dynamic-file-name

% i = 1
% fname = sprintf('regen%d.mat', i);
% save(fname,'regen');
% 
% % a trial for csv file
% fname = sprintf('regen%d.csv', i);
% writematrix(regen, fname);









