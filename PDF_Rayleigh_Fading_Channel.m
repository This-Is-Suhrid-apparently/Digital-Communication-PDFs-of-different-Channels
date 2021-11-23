%Assume 2 IID random variables each with mean=0 and variance=1/2, X1 and X2
%Now we define H = X1 + j.X2. So H is complex Gaussian with mean=0 and variance=1
%The histogram of |H| reveals that H follows Rayleigh Distribution. 

N=1000
norm_mean=0;
norm_var=1/2;
x1=norm_mean+ sqrt(norm_var)*randn(1,N);
x2=norm_mean+ sqrt(norm_var)*randn(1,N);
h = x1+j*x2; %Complex Gaussian
z=abs(h);%absolute value of h
nob=10;%Number of bins
a=min(z);
b=max(z);
aa=linspace(a,b,nob); %We take the min and max of x to plot 10 Normally distributed numbers between them.
count(size(aa))=0;%counter initialised. Since there are 10 nob so we need only 9 counters.
for i=1:length(aa)-1
    for j=1:N
        if z(j)>=aa(i) && z(j)<aa(i+1)
            count(i)=count(i)+1;
        end
    end
    y(i)=(aa(i)+aa(i+1))/2;
end

%%
%Plotting
subplot(211);
bar(y,count(1:end-1)/N);
[bin val]=hist(z,y);%This is the histogram command which directly plots the histogram
subplot(212);
bar(y,bin/length(z));
