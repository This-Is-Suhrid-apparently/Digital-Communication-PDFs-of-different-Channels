%Matlab program for plotting the PDF of Normal Distribution 
%using HISTOGRAM approach.
%w= mean + sqrt(variance)*randn(r,c), where r,c: size of the matrix
%If we don't input any mean and variance, then MATLAB assumes mean= 0 and
%var=1 i.e Standard Normal Distribution.
%FACT: sqrt(variance)=standard deviation
N=1000
norm_mean=1;
norm_var=2;
x=norm_mean+ sqrt(norm_var)*randn(1,N);
%Now applying Histogram approach
nob=10;%Number of bins
a=min(x);
b=max(x);
aa=linspace(a,b,nob); %We take the min and max of x to plot 10 Normally distributed numbers between them.
count(size(aa))=0;%counter initialised. Since there are 10 nob so we need only 9 counters.
for i=1:length(aa)-1
    for j=1:length(x)
        if x(j)>=aa(i) && x(j)<aa(i+1)
            count(i)=count(i)+1;
        end
    end
    y(i)=(aa(i)+aa(i+1))/2;
end

%%
%Plotting
subplot(211);
bar(y,count(1:end-1)/N);
[bin val]=hist(x,y);%This is the histogram command which directly plots the histogram
subplot(212);
bar(y,bin/length(x));
