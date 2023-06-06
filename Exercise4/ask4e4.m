n=0:1000;
phi = rand(1)*2*pi;
s = sin(0.25*n+phi);

w = randn(1,length(n));
v = filter(1,[1,-0.6],w);

figure;plot(abs(fftshift(fft(w,2^10))))

figure;plot(abs(fftshift(fft(v,2^10))))

x = s+w;

v0 = v;
w0 = w;

%find the cross correlation
rsx=[0;0];
for n=6:length(v)
    rsx(1)=rsx(1)+v(n)*w(n);
    rsx(2)=rsx(2)+v(n-1)*w(n);
end
rsx=rsx/(length(v)-1);


%find the autocorrelation
v1 = v0;
v2 = v0;

v1(end) = [];
v2(1) = [];

X = [v2;v1];
Rxx = X*X'/length(v1);


hW =  rsx' * inv(Rxx);

w_hat = filter(hW,1,v);

%check to see the whitening
figure;plot(abs(fftshift(fft(w_hat,2^10))))

norm(w-w_hat); 
x_hat = x-w_hat;

subplot(131);plot(s);title('original');
subplot(132);plot(x);title('Noisy');
subplot(133);plot(x_hat);title('Filtered');


rms_noise_2 = norm(x-s)
rms_filtered_noise_2 = norm(x-s-w_hat)

%filtro mhkos 3

n = 0:1000;
phi = rand(1)*2*pi;
s = sin(0.25*n+phi);

w = randn(1,length(n));
v = filter(1,[1,-0.6],w); 

% check
figure; plot(abs(fftshift(fft(w,2^10))))
figure; plot(abs(fftshift(fft(v,2^10))))

x = s + w;


v0 = v;
w0 = w;

% find the cross correlation
rsx = zeros(3, 1);
for n = 5:length(v)
    rsx(1) = rsx(1) + v(n)' * w(n);
    rsx(2) = rsx(2) + v(n-1)' * w(n);
    rsx(3) = rsx(3) + v(n-2)' * w(n);
end
rsx = rsx / (length(v)-2);

% find the autocorrelation
v3 = v0(1:end-2);
v2 = v0(2:end-1);
v1 = v0(3:end);

X = [v1; v2; v3;]; 

Rxx = X * X' / length(v3);

hW = rsx' * inv(Rxx);

w_hat = filter(hW, 1, v);

% check to see the whitening
figure; plot(abs(fftshift(fft(w_hat, 2^10))))

norm(w - w_hat);
x_hat = x - w_hat;

subplot(131); plot(s); title('original');
subplot(132); plot(x); title('Noisy');
subplot(133); plot(x_hat); title('Filtered');

rms_noise_3 = norm(x - s)
rms_filtered_noise_3 = norm(x - s - w_hat)

%filtro mhkos 4

n = 0:1000;
phi = rand(1)*2*pi;
s = sin(0.25*n+phi);

w = randn(1,length(n));
v = filter(1,[1,-0.6],w);

figure; plot(abs(fftshift(fft(w,2^10))))
figure; plot(abs(fftshift(fft(v,2^10))))

x = s + w;

v0 = v;
w0 = w;

rsx = zeros(4, 1);
for n = 5:length(v)
    rsx(1) = rsx(1) + v(n)' * w(n);
    rsx(2) = rsx(2) + v(n-1)' * w(n);
    rsx(3) = rsx(3) + v(n-2)' * w(n);
    rsx(4) = rsx(4) + v(n-3)' * w(n);
end
rsx = rsx / (length(v)-3);


v4 = v0(1:end-3);
v3 = v0(2:end-2);
v2 = v0(3:end-1);
v1 = v0(4:end);

X = [v1; v2; v3; v4;]; 

Rxx = X * X' / length(v4);

hW = rsx' * inv(Rxx);

w_hat = filter(hW, 1, v);

figure; plot(abs(fftshift(fft(w_hat, 2^10))))

norm(w - w_hat); 
x_hat = x - w_hat;

subplot(131); plot(s); title('original');
subplot(132); plot(x); title('Noisy');
subplot(133); plot(x_hat); title('Filtered');

rms_noise_4 = norm(x - s)
rms_filtered_noise_4 = norm(x - s - w_hat)

%filtro mhkos 5

n = 0:1000;
phi = rand(1)*2*pi;
s = sin(0.25*n+phi);

w = randn(1,length(n));
v = filter(1,[1,-0.6],w);

figure; plot(abs(fftshift(fft(w,2^10))))
figure; plot(abs(fftshift(fft(v,2^10))))

x = s + w;


v0 = v;
w0 = w;


rsx = zeros(5, 1); 
for n = 5:length(v)
    rsx(1) = rsx(1) + v(n)' * w(n);
    rsx(2) = rsx(2) + v(n-1)' * w(n);
    rsx(3) = rsx(3) + v(n-2)' * w(n);
    rsx(4) = rsx(4) + v(n-3)' * w(n);
    rsx(5) = rsx(5) + v(n-4)' * w(n);
end
rsx = rsx / (length(v)-4);


v5 = v0(1:end-4);
v4 = v0(2:end-3);
v3 = v0(3:end-2);
v2 = v0(4:end-1);
v1 = v0(5:end);

X = [v1; v2; v3; v4; v5]; 

Rxx = X * X' / length(v5);

hW = rsx' * inv(Rxx);

w_hat = filter(hW, 1, v);


figure; plot(abs(fftshift(fft(w_hat, 2^10))))

norm(w - w_hat); 
x_hat = x - w_hat;

subplot(131); plot(s); title('original');
subplot(132); plot(x); title('Noisy');
subplot(133); plot(x_hat); title('Filtered');

rms_noise_5 = norm(x - s)
rms_filtered_noise_5 = norm(x - s - w_hat)

%filtro mhkos 6

n = 0:1000;
phi = rand(1)*2*pi;
s = sin(0.25*n+phi);

w = randn(1,length(n));
v = filter(1,[1,-0.6],w);


figure; plot(abs(fftshift(fft(w,2^10))))
figure; plot(abs(fftshift(fft(v,2^10))))

x = s + w;


v0 = v;
w0 = w;


rsx = zeros(6, 1); 
for n = 6:length(v)
    rsx(1) = rsx(1) + v(n)' * w(n);
    rsx(2) = rsx(2) + v(n-1)' * w(n);
    rsx(3) = rsx(3) + v(n-2)' * w(n);
    rsx(4) = rsx(4) + v(n-3)' * w(n);
    rsx(5) = rsx(5) + v(n-4)' * w(n);
    rsx(6) = rsx(6) + v(n-5)' * w(n);
end
rsx = rsx / (length(v)-5);

v6 = v0(1:end-5);
v5 = v0(2:end-4);
v4 = v0(3:end-3);
v3 = v0(4:end-2);
v2 = v0(5:end-1);
v1 = v0(6:end);

X = [v1; v2; v3; v4; v5; v6];

Rxx = X * X' / length(v6);

hW = rsx' * inv(Rxx);

w_hat = filter(hW, 1, v);


figure; plot(abs(fftshift(fft(w_hat, 2^10))))

norm(w - w_hat);
x_hat = x - w_hat;

subplot(131); plot(s); title('original');
subplot(132); plot(x); title('Noisy');
subplot(133); plot(x_hat); title('Filtered');

rms_noise_6 = norm(x - s)
rms_filtered_noise_6 = norm(x - s - w_hat)
