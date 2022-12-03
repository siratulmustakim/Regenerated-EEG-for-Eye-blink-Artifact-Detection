
% topo

% see for dir function: https://www.mathworks.com/help/matlab/ref/dir.html
M = dir('*.mat');
len = length(M);

for j = 1:len   % total epoch/file is 1319

    fname = sprintf('clean_IC_%d.mat', j); % creating dynamic file nam
load(fname);  % loading the data in M(i).name
% regenerated file gulo create korar shomoe 'regen' variable use kora hoechilo, so load(M(i).name) er data by default 'regen' var e store hochche. 
a = IC;  % regen theke a te nilam, na nileo hoto, direct regen e use kora jeto. 

p = 1;

    Max = max(a(p, :));
    F = find(a(p, :)==Max);   % this is the location of Max
    array(j, 1:14)  = a(p:p+13, F); % all channel values of a patient  at highest-peak-moment, per 14 row is for one patient 


% fname is dynamically selected set file name.


end

name = sprintf('topo_IC_clean.mat'); % creating dynamic file name. 

save(name, 'array');

