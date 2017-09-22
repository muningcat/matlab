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
        
        %{
            a.	Photographic Negative
            b.	Gamma
            c.	Logarithmic
            d.	Contrast Stretching
            e.	fspecial (sobel & prewitt)
            f.	bit splicing (Gray)
        %}
        
        negative_I = imcomplement(I);
        
        subplot(3,3,1), imshow(negative_I); title('Negative');
        
        gamma = 0.4
        gamma_low = double(I).^gamma;
        subplot(3,3,2), imshow(B); title('Gamma 0.4');
       
        gamma = 1.9
        gamma_high= double(I).^gamma;
        subplot(3,3,3), imshow(B); title('Gamme 1.9');
        
        subplot(3,3,1), imshow(B); title('');
end

%{
    should be double to slice
    types of piecews
        contrast stretch
    imfinfo

ASSIGNMENT: SLICE TO 7 DIFFERENT COLOR OR TOP DOWN SLICE


%}