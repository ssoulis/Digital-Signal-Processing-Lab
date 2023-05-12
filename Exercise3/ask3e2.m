% fortwsh video

v = VideoReader('500fps.m4v');

i = 0;

while hasFrame(v)
    i = i+1;
    I = rgb2gray(im2double(readFrame(v)));
    x(i) = I(293,323);
end

% fourier eyresh sync

NumFFT = 1024;
F = linspace(-255, 255, NumFFT);


Fx = abs(fftshift(fft(x, NumFFT)));

figure
plot(F, Fx);
title("DFT");

% fortwsh video me noise

v_noisy = VideoReader('500fps_noisy.m4v');
N = 5;
i = 0;

yn = [];
yd = [];
while hasFrame(v_noisy)
    i = i+1;
    I = rgb2gray(im2double(readFrame(v_noisy)));
    H = filter2(h,img);
    yn(i) = I(293,323);
    yd(i) = H(293,323);
end


% fourier eyresh sync

NumFFT = 1024;
F = linspace(-255, 255, NumFFT);

Fx_noisy = abs(fftshift(fft(yn, NumFFT)));
Fx_denoised = abs(fftshift(fft(yd, NumFFT)));



figure
plot(F, Fx_noisy);
title("DFT on noisy video");



figure
plot(F, Fx_denoised);
title("DFT on  Video without noise");
