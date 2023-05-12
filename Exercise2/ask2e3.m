load Noisy.mat

load myfilter.mat

load inverse_filter.mat

NumFFT = 4096;

Freqs = linspace(-Fs/2,Fs/2,NumFFT);

figure

plot(yw)

figure

plot(Freqs,20*log10(abs(fftshift(fft(yw,NumFFT)))))

figure

freqz(yw)

filtered = filtfilt(myfilter,1,yw);

freqz(myfilter);

figure
plot(Freqs,20*log10(abs(fftshift(fft(filtered,NumFFT)))));

sound(filtered,Fs);

noise = filtfilt(inversefilter,1,yw);

figure
subplot(2,3,1:2);plot(noise);
subplot(2,3,3);plot(Freqs,20*log10(abs(fftshift(fft(noise,NumFFT)))));

figure
plot(filtered);

figure
plot(Freqs,20*log10(abs(fftshift(fft(filtered,NumFFT)))));

figure
plot(noise(10000:10250));

figure
plot(Freqs,20*log10(abs(fftshift(fft(noise(10000:10250),NumFFT)))));

figure
plot(filtered(10000:10250));

figure
plot(Freqs,20*log10(abs(fftshift(fft(filtered(10000:10250),NumFFT)))));