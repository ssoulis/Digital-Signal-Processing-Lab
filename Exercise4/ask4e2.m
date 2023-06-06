K = 2000;
n = -50:200;
A = randn(K,1);


mask = ((n > 0) - (n - 100 > 0));


x = A* mask ;

mask2D = repmat(mask,K,1);

x = A .* mask2D;

mean_val = mean(x);

Acor = x'*x/K;

Sd = 20*log10(fftshift(abs(fft2(Acor))));

figure;
plot(n,x);

figure;
plot(n,mean_val);

figure; imagesc(n,n,Acor)

figure; imagesc(Sd)