%%--------------------------------------------------------------------------
%%Project-2:: Question - 2
%%To find Covariance of Xk and Xk1 and also Xk and Yk(a function of X)

%%The below function uses a rand function to get Xk and then right shifts by 1
%%to get Xk1 and computes covariance of them.  It also computes Yk-a func of Xk
%%and computes covariance of Xk and Yk as well.
%%Author                Date               Revision
%%Rajasekar Raja     01/23/17         Initial Revision
%%--------------------------------------------------------------------------
function [ ] = covariance()
  %Repeat the experiment in 3 iterations incrementing the number of samples
  trails = [100,10000,1000000];
  for expt = 1:3
      no_of_samples = trails(expt);
      seq_Xk = rand(1,no_of_samples);
      %Initializing all vectors with 0's 
      [seq_Xk_plus_1, seq_Xk_minus_1, seq_Xk_minus_2, seq_Xk_minus_3] = deal(zeros(1,no_of_samples));
      %Right and Left shifting vectors so as to get the shifted vectors 
      seq_Xk_plus_1(1:no_of_samples)  = [seq_Xk(2:no_of_samples) 0];
      seq_Xk_minus_1(2:no_of_samples) = seq_Xk(1:no_of_samples-1);
      seq_Xk_minus_2(3:no_of_samples) = seq_Xk(1:no_of_samples-2);
      seq_Xk_minus_3(4:no_of_samples) = seq_Xk(1:no_of_samples-3);
      %Covariance of Xk and the Right shifted Xk1 vector is
      cov_Xk_Xk1 = cov(seq_Xk,seq_Xk_plus_1);
      for k=1:no_of_samples
          seq_Yk(1,k)= seq_Xk(1,k)- 2*seq_Xk_minus_1(1,k)+ 0.5*seq_Xk_minus_2(1,k)- seq_Xk_minus_3(1,k);
      end
      %Covariance of Xk and Yk where Y(k) = x(k)-2x(k-1)+0.5x(k-2)-x(k-3)
      cov_Xk_Yk = cov(seq_Xk,seq_Yk);
      disp(['Summary of ',num2str(no_of_samples),' random samples ']);
      disp(['  -Covariance of Xk and Xk1 is ',num2str(cov_Xk_Xk1(1,2))]);
      disp(['  -Covariance of Xk and Yk is ',num2str(cov_Xk_Yk(1,2))]);      
  end