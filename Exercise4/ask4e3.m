
load eye
approx = zeros(size(I(:,:,1)));

for counter = 1 : 100
    approx = approx + I(:, :, counter);
end

approx = approx/100;

figure;
subplot(121);imshow(approx/max(approx(:)));

subplot(122);imshow(I(:,:,1))

noise = I(:,:,1) - approx;
figure;
histogram(noise, 100);



m = mean(noise(:));
s = std(noise(:));

I2 = zeros(size(I(:,:,1)));
for counter = 1 : 100
    I2 =  I2 + I(:, :, counter) -  approx;
end


I2 = I2/(10*s);

m=mean(I(:)); 
s = std(I(:));

figure;
samples = (I(:)-m)/(s*sqrt(100^3));
histogram(samples, 100);

variance = mean(var(noise))