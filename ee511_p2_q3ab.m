%%--------------------------------------------------------------------------
%%Project-2:: Question - 3ab
%%To compute Goodness-of-fit test

%%The below function first generates a uniformly random distribution in 0-9
%%and then draws a sequence of 'x' samples (With replacement) and
%%checks the Goodness of Fit test to validate if the samples fit the Dist or not
%%Here NULL hypothesis is that the sample fits the distribution 0,1...,9
%%Author                Date               Revision
%%Rajasekar Raja     01/23/17         Initial Revision
%%--------------------------------------------------------------------------
function [ ] = goodness_of_fit(M)
  %Initialize
  seq = 0:(M-1);   
  %Bin count for distributing the samples for Goodness of fit test
  bin_count = [5,8,11];
  %Repeat the experiment in 3 iterations incrementing the number of samples
  trails = [50,100,500,1000];
  for expt = 1:length(trails)
      no_of_samples = trails(expt);
      %Sampling with replacement
      sample = datasample(seq,no_of_samples);
      subplot(4,1,expt);
      histogram(sample);                              
      disp('Summary for Discrete uniform distribution 0,1,2,...9 for');          
      for bin_index=1:length(bin_count)
          disp(['  -Number of samples -',num2str(no_of_samples),' with ',num2str(bin_count(bin_index)),' bins']);
          %Edges will be decided on the number of bins(default to 10) = nO_of_bins+1 
          edges = linspace(0,M-1,(bin_count(bin_index)+1));
          %To distribute the expected number of entries in each bin equally
          expectedCounts = ones(1,bin_count(bin_index));
          expectedCounts = expectedCounts.*(no_of_samples/bin_count(bin_index));
          %Results in H(reject NULL hypothesis), p-probability of the 
          %hypothesis test and stats(Expected/obsered count etc..)
          [h,p,st] = chi2gof(sample,'edges',edges,'expected',expectedCounts)
          if h == 0
              disp('  -The NULL hypothesis that "uniform dist random data fits the sample above" is NOT REJECTED');
          else
               disp('  -The NULL hypothesis that "uniform dist random data fits the sample above" is REJECTED');
          end             
      end
  end