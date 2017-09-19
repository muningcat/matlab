operation = 7;

%image_path = 'turtle_bread.jpg';

%image_path = 'phbn500.jpg';

%image_path = 'phbn1000.jpg';
%image_path = 'phbn1000_2.jpg';
image_path = 'phbn1000_3.jpg';

I = imread(image_path);

switch(operation) 
    case 0
        imshow(I);
    case 1
        I = rgb2gray(I);
        imshow(edge(I, 'canny'));
    case 2
        greyI = rgb2gray( I(:,:,1:3) );
        J = histeq( greyI );
        subimage(J);
    case 3
        I = im2bw(I);
        imshow(I);
    case 4
        I = rgb2ind(I, 64);
        imshow(I);
    case 5
        I = rgb2gray( I );
        I = dither(I);
        imshow(I);
    case 6
        mapping = [ 1 1 1; 0 0 0; 1 1 1 ];
        I = dither(I,mapping);
        imshow(I, mapping);
    case 7
        I = rgb2gray(I);
        imshow(I);
end

% 0 -> im show
% 1 -> canny edge
% 2 -> histeq (contrast)
% 3 -> im bw (black and white)
% 