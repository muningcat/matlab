

%image_path = 'turtle_bread.jpg';

%image_path = 'phbn500.jpg';

%image_path = 'phbn1000.jpg';
%image_path = 'phbn1000_2.jpg';
%image_path = 'phbn1000_3.jpg';


image_path = 'black.jpg';

I = imread(image_path);

operation = 9;
switch(operation) 
    case 0
        col = 256;
        row = 256;
        img = ones(row, col);
        img (100:110,:) = 0.5;
        img (:,100:110) = 0;

        imshow(img);
    case 1
        x = imtool(I);
        rect = [96 122 75 90];
        i = imcrop(I, rect);
        imshow(i);
    case 2
        
       i = imrotate(I, 180, 'bilinear');
       i2 = imrotate(I, 45, 'nearest');
       subplot(2,1,1), imshow(i);
       subplot(2,1,2), imshow(i2);
      
    case 3
        b = double(I) + 50;
        imshow(I), title('Original Image');
        figure, imshow(uint8(b)),title('New Image');
    
    case 4
        % low intensity and high intensity, low out and high out. J = imadjust(I,[low_in; high_in],[low_out; high_out])
        %subplot(1,3,1), imshow(i1), (1,3,2), imshow(i2), (1,3,3), imshow(i2)
        %   
        J = imadjust(I, [], [], 1);
        Jg = imadjust(I, [], [], 0.4);
        darker = imadjust(I, [], [], 3);
        subplot(1,3,1), imshow(J), subplot(1,3,2), imshow(Jg), subplot(1,3,3), imshow(darker)
  
    case 5
        [b,c] = Udemy(I);
        b = I;
        s = 255;
        n = s - b;
        figure(1)
        colormap(gray)
        imagesc(b)
        figure(2)
        colormap(gray)
        imagesc(n)
    case 6
        imshow(I);
        I = rgb2gray(I);
        J = imcomplement(I);
        imshow(J);
    
    case 7
        i = im2double(I);
        J = 1*log(1+i);
        J1 = 2*log(1+i);
        J2 = 5*log(1+i);
        imshow(I)
        figure, imshow(J)
        figure, imshow(J1)
        figure, imshow(J2)
        
    case 8
        J = 255/log10(1+I);
        J1 = J/log10(1+double(J));
        imshow(I), title('O');
        figure, imshow(uint8(J1)),title('F');
        
    case 9
        b = rgb2gray(I);
        gamma = 1.1
        d = double(I).^gamma;
        imshow(I), title('Orginal')
        figure, imshow(uint8(d)), title('gamma = 1.1');
        
        gamma1 = .9;
        d1 = double(I).^gamma1;
        figure, imshow(uint8(d1)), title('gamma = .9');
        
        gamma2 = 5;
        d2 = double(I).^gamma2;
        figure, imshow(uint8(d2)), title('gamma = 5');
        
        gamma3 = 3;
        d3 = double(I).^gamma3;
        figure, imshow(uint8(d3)), title('gamma = 5');
        
        gamma4 = 5;
        d4 = double(gamma3).sqrt(gamma4);
        figure, imshow(uint8(d4)), title('Restoration');
        
end

