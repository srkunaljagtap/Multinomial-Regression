
function [Lpred,Scores] = Multinomial_Regression_testing(Xtest, Weights,k)

% add these fields to output correctpredictions,error,
Wnew = Weights;
[N1,L1]= size(Xtest);
  
Stest = zeros(N1,k);
%% 
 for m=1:k
  for i=1:N1
Stest(i,m) = exp((Wnew(m,:))*Xtest(i,:)');
  end
 end
  
%Posteriors for each sample for each class
 for m = 1:k
   for i = 1:N1             
Stest(i,m) = Stest(i,m)/sum(Stest(i,:));      
   end
 end
Scores = Stest ;
Lpred= zeros(N1,1);

 for i=1:N1
 [~,col] =(max(Scores(i,:),[],2));
        Lpred(i,1) =  col;
 end
 

 
end
 

