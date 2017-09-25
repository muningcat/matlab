operation = 7;

%image_path = 'phbn1000.jpg';
%image_path = 'phbn1000_2.jpg';
%image_path = 'phbn1000_3.jpg';
%image_path = 'fake1k.jpg';

%I = imread(image_path);
%

switch (operation)
    case 1
        level = multithresh(I);
        seg_I = imquantize(I,level);
        RGB = label2rgb(seg_I); 
        
        %figure
        %imshow(level,[]);
    case 2
        B = zeros(size(I));
        B = bitset(B, 7,bitget(I,2));
        B = bitset(B, 8,bitget(I,4));
        B = uint8(B);
        figure, imshow(B);
        %B=mod(floor(c/2),2); %double
    case 3
        %histogram equalization
        J = histeq(I);
        subplot(2,2,1);
        imshow( I );
        subplot(2,2,2);
        imhist(I)
        subplot(2,2,3);
        imshow( J );
        subplot(2,2,4);
        imhist(J)
    case 4
        %motion, unsharp, sobel, prewitt
        %I = rgb2gray(I);
        h = fspecial('prewitt');
        sample_sharp= imfilter(I,h);
        figure, imshow(sample_sharp);
    case 5
        
        [em, map] = imread('emu.tif');
        e = ind2gray(em,map);
        e2=im2uint8(e);
        imshow(e);
    case 6
        I = imread('buffalo.tif');
        B = zeros(size(I));
        
        ctr = 1;
        
        for i = 1:8
            B = bitset(B, 8,bitget(I, ctr));
            B = uint8(B);
            
            subplot(3,3,i), imshow(B); title(i);
            ctr = ctr + 1;
        end
        
    case 7
        I = imread('lena.jpg');
  
        %1
        negative_I = imcomplement(I);
        
        subplot(4,4,1), imshow(negative_I); title('Negative');
        %2
        gamma = 0.8;
        gamma_low = double(I).^gamma;
        subplot(4,4,2), imshow(uint8(gamma_low)); title('Gamma 0.8');
       
        gamma = 1.2;
        gamma_high = double(I).^gamma;
        subplot(4,4,3), imshow(uint8(gamma_high)); title('Gamme 1.2');
        
        %3
        i = im2double(I);
        J = 1*log(1+i);
        subplot(4,4,4), imshow(J); title('1*log(1+image)');
        
        J1 = 2*log(1+i);
        subplot(4,4,5), imshow(J1); title('2*log(1+image)');
        
        J2 = 5*log(1+i);
        subplot(4,4,6), imshow(J2); title('5*log(1+image)');
        
        %4
        prewitt_method = fspecial('prewitt');
        prewitt_implementation = imfilter(I,prewitt_method);
        subplot(4,4,7), imshow(prewitt_implementation); title('prewitt');
        
        sobel_method = fspecial('sobel');
        sobel_implementation = imfilter(I,sobel_method);
        subplot(4,4,8), imshow(sobel_implementation); title('sobel');
        
        
        %5
        ctr = 1;
        Z = zeros(size(I));
        for ind = 1:8
            Z = bitset(Z, 8,bitget(I, ctr));
            Z = uint8(Z);
            
            subplot(4,4,ind+8), imshow(Z); title(ind);
            ctr = ctr + 1;
        end

end

%{
    should be double to slice
    types of piecews
        contrast stretch
    imfinfo

ASSIGNMENT: SLICE TO 7 DIFFERENT COLOR OR TOP DOWN SLICE


%}