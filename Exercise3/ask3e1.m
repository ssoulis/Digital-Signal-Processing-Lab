% askhsh 1 erwthma 1

freqz([1 -1],1);
n = 0:1000;
x = cos(pi/32*n);
y = filter([1 -1],1,x);


figure
subplot(211);plot(x);
subplot(212);plot(y);

figure
plot(x(1:100));

figure
plot(y(1:100));

% askhsh 1 erwthma 2

img = imread('photo.jpg');
img_deg = imread('photo-deg.jpg');

% ∂I(x,y)/∂x 

dy = filter([1 -1],1,img);

figure
subplot(121); imagesc(img); colormap gray; 
subplot(122);  imagesc(dy); colormap gray;

% ∂I(x,y)/∂y

dx = filter([1 -1],1,img')';

figure
subplot(121); imagesc(img); colormap gray;
subplot(122);  imagesc(dx); colormap gray;

% (∂^2 I(x,y))/(∂x^2 )

dxdx = filter([1 -1],1,dx')';

figure
subplot(121);   imagesc(img); colormap gray;
subplot(122);  imagesc(dxdx); colormap gray;

% (∂^2 I(x,y))/(∂y^2 )

dydy = filter([1 -1],1,dy);

figure
subplot(121);  imagesc(img); colormap gray;
subplot(122); imagesc(dydy); colormap gray;

% (∂^2 I(x,y))/∂x∂y

dxdy = filter([1 -1],1,dx);

figure
subplot(121);  imagesc(img); colormap gray;
subplot(122); imagesc(dxdy); colormap gray;

% (∂^2 I(x,y))/∂y∂x

dydx = filter([1 -1],1,dy')';

figure
subplot(121);  imagesc(img); colormap gray;
subplot(122); imagesc(dydx); colormap gray;

% filter2 

% allazoume to N apo 2 se 10 kai apo 10 se 20 gia oles tis eikones

N=20;

h = ones(2*N+1, 2*N+1) / (2*N+1)^2;

y = filter2(h,img);

figure
imshow(y/max(y(:)));


h = ones(2*N+1, 2*N+1) / (2*N+1)^2;
y = filter2(h,img_deg);

figure
imshow(y/max(y(:)));

