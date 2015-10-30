function [correctpredictions,error] = MR_missclassfication_error( Lpred, Label)
%% Input parameters
% Lpred: predicted labels
% Label: true labels of test samples
% output paramters:
% correctpredictions: total correctly predicted test samples
% error: miscalssification error

L = length(Label);
L1 = length(Lpred);

if L~=L1
    error('total number of arguments nto equal');
end

count = 0 ;

for i = 1:L
   if(Lpred(i,1)==Label(i,1))
    count = count+1;
   end
end

correctpredictions = count ;
error = (L-count)/L ;
disp('misclassification rate')
disp(error)
end
