
% svm: https://www.mathworks.com/help/stats/fitcsvm.html
% cvpartition source: https://www.mathworks.com/help/stats/cvpartition.html#mw_a291f55c-45c6-4545-ad40-297fb69a0af4


train = m(:, :);
response = label(:, :);  % actual labeling 

% c = cvpartition(group,'KFold',k,'Stratify',stratifyOption)
rng('default') % For reproducibility
cvp = cvpartition(response,'KFold',5,'Stratify',true)  % stratification er jnno fst parameter group/ class label hote hbe, so response dilam.

 Mdl = fitcsvm(train,response,"CVPartition",cvp)
% Mdl = fitcsvm(train,response,"CVPartition",cvp, 'KernelScale', 6.672)  %
% for entropy, variance use kernelScale 6.672, for Mean use 20.672, PSD
% 83.366.


ccvloss = kfoldLoss(Mdl,"LossFun","classiferror")
    
losss = mean(ccvloss)
acc = 1 - losss  % this is accuracy, confusion thekeo accuracy pabe. 

% prediction with trained model
% https://www.mathworks.com/matlabcentral/answers/674468-confusion-matrix-of-svm-classifier-with-k-fold-cross-validation
prediction = kfoldPredict(Mdl);
conf = confusionmat(prediction, response)

accuracy = (conf(1)+conf(4))/(conf(1)+conf(2)+conf(3)+conf(4))
precision = conf(1)/(conf(1)+conf(3))
recall = conf(1)/(conf(1)+conf(2))
f1_score = (2*precision*recall)/(precision+recall)

%graphical confusion chart
confusionchart(response, prediction) 

% save the model
save('SVM_variance_ReEEG.mat', 'Mdl');


%%%%%%%%%%%%%% ADDITIONAL %%%%%%%%%%%%%%%

% If u dont get expected good result, u can optimize the hyperplane. 
% source: https://www.mathworks.com/help/stats/fitcsvm.html

% use the below code:

% rng default
% Mdl = fitcsvm(train,response,'OptimizeHyperparameters','auto', ...
%     'HyperparameterOptimizationOptions',struct('AcquisitionFunctionName', ...
%     'expected-improvement-plus'))
% 
% %%% here u will get optimized value of  BoxConstraint and   KernelScale. I
% %%% have applied kernelScale and get expected result.
% 
% % my kernelScale for entropy feature (ReEEG)
% 
% Mdl = fitcsvm(train,response,"CVPartition",cvp, 'KernelScale', 6.672)




