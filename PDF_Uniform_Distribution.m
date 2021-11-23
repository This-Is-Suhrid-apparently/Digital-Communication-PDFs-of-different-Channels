%Matlab program to plot uniformly distributed random variables.
%Histogram approach.

%%
% rand function structure: x= a + (b-a)*rand(r,c)
% Here r and c are the number of rows and columns of the randomly generated
% matrix, and a and b are the lower and upper limits of the random numbers
% to be generated respectively.
a=2;%lower limit
b=5;%upper limit
x=a+(b-a).*rand(1,20);%generates a 1x20 matrix of uniformly distributed random numbers between 2 and 5.


%%
%linspace(p,q,r) generated r linearly/equally spaced points between p and q in a vector 

k=linspace(1,10,10);
f=linspace(1,2,5);

%%
%Now we used the above functions to plot uniformly distributed random
%variables using Histogram approach.
a=2;b=3;N=100000;
x=a+(b-a).*rand(1,N);
nob=10;%Number of bins in Histogram
aa=linspace(a,b,nob);%linearly spaced vectors
count(size(aa))=0;%Initialising 10 counters to count the number of values randomly falling into the 
                  %respective ranges. Hence, between 10 numbers we need
                  %only 9 counters and we will omit the last usless counter
                  %while typing the loop!
% i:Bin Index; j:Index for Input random variable
for i=1:length(aa)-1 %bin index
    for j=1:length(x) %input Random Number Index
        if x(j)>=aa(i) && x(j)<aa(i+1)
            count(i)=count(i)+1;
        end
    end
    y(i)=(aa(i)+aa(i+1))/2;%for x-axis
end
subplot(221);
bar(y,count(1:end-1)/length(x))%We divide the count by N to get the 
                               %probability of the number falling in that range
                               
[bin val]=hist(x,y);%This is the histogram command which directly plots the histogram
subplot(212);
bar(y,bin/length(x));