%I = imread('phbn1000_2.jpg');
%J = histeq(I);
%imshowpair(I,J,'montage');
%axis off
%imshow(J);
%J = histeq(I,n);
%[J,T] = histeq(I);

I = imread('phbn1000_2.jpg');
%imshow(I);
greyI = rgb2gray( I(:,:,1:3) );
J = histeq( greyI );
subimage(J);
%imshow(J);