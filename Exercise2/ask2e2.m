load chirp

y0=y;

noise =0.5*randn(size(y));

Fs = 8919;

yw_ask2 = y0 + noise;

figure
subplot(121);plot(y0)
subplot(122);plot(yw_ask2)

NumFFT = 4096;

F = linspace(-Fs/2,Fs/2,NumFFT);

b1 = fir1(34,0.48,'high',chebwin(35,30));

figure
freqz(b1,1,512);
yf1 = filtfilt(b1,1,yw_ask2);
b2 = firls(34,[0, 0.45, 0.5, 1] , [0 0 1 1]);

figure
freqz(b2,1,512);
yf2 = filtfilt(b2,1,yw_ask2);
b3 = firpm(34,[0, 0.45, 0.5, 1] , [0 0 1 1]);

figure
freqz(b3,1,512);
yf3 = filtfilt(b3,1,yw_ask2);

figure

title('Filter frequency response (dB)')

hold on

plot(F, 20*log10(abs(fftshift(fft(b1,NumFFT)))));

plot(F, 20*log10(abs(fftshift(fft(b2,NumFFT)))));

plot(F, 20*log10(abs(fftshift(fft(b3,NumFFT)))));

legend('fir1','firls','firpm')

hold off

grid on

figure
title('Filter frequency response (dB)')

subplot(131);plot(F, 20*log10(abs(fftshift(fft(b1,NumFFT)))));
legend('fir1')

figure

plot(F, 20*log10(abs(fftshift(fft(b2,NumFFT)))));
legend('firls')

figure

plot(F, 20*log10(abs(fftshift(fft(b3,NumFFT)))));
legend('firpm')

figure

plot(F, abs(fftshift(fft(y0,NumFFT))))
legend('Original Signal')

figure

plot(F, abs(fftshift(fft(yw_ask2,NumFFT))),'r')
legend('Signal + Noise')

figure

plot(F, abs(fftshift(fft(yf3,NumFFT))),'g')
legend('Filtered Signal')

figure

plot(y0(1:100))

figure

plot(y0(end-100:end))

figure

plot(yf1(1:100))
figure

plot(yf1(end-100:end))

figure
plot(yf2(1:100))

figure
plot(yf2(end-100:end))

subplot(427); plot(yf3(1:100))

subplot(428); plot(yf3(end-100:end))

r1 = y0-yf1;

r2 = y0-yf2;

r3 = y0-yf3;

MSE = [mean(r1.^2) mean(r2.^2) mean(r3.^2) ]