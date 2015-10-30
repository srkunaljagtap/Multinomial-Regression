function [Weights] = Multinomial_Regression_training(Xtrain, Ltrain,k,maxIter, lambdaMax)
%% Input arguments
% Xtrain: trianing samples
% Ltrain: Labels of the training samples as 1,2,3 .... , k
% k: total number of classes
%%
[N1,L1]= size(Xtrain);
for i= 1 : k
    Indx{:,i} = find (Ltrain == i);
end

L2 = length(Ltrain);
T = zeros(L2,3);
for i= 1: k
    T(Indx{:,i},i)=1;
end



%% consider intial weight vector
Wnew = 0.1 * eye(k,L1);  
S = zeros(N1,k);
%%
for j = 1: maxIter
   
 for m=1:k
  for i=1:N1
S(i,m) = exp((Wnew(m,:))*Xtrain(i,:)');
  end
 end
 
    
%Posteriors for each sample for each class
 for m = 1:k
   for i = 1:N1             
S(i,m) = S(i,m)/sum(S(i,:));      
   end
 end
      
E(j,1) = -trace (T'*log(S)) ;     % cross_entropy for each iteration
GD = Xtrain'*(S-T);               % gradient descent

GDnew = GD';
% Update the Weights
Wnew =  Wnew(1:m-1,:) - lambdaMax * GDnew(1:m-1,:) ;
Wadd = zeros(1,L1);
% calculate weight vector for next and return final weights for 
% test set to predict samples
Wnew = [Wnew;Wadd];             
Weights = Wnew;                                               
L = length(E);
x=1:L;
CEvalues = E ;                  % return cross entropy

end
% plot cros entropy vs no. of iterations
% figure(1)
% plot(x,E)                      
% xlabel('Number of Iterations')
% ylabel('Cross_entropy')                               
% interation
end