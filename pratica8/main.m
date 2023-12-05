clear all
close all

im = imread('Imagem.png');
imMaior = zeros(size(im,1)*2, size(im,2)*2, 3, 'uint8');

x=0;
y=0;

for i=1 :2: size(imMaior,1)
  x+=1;
  for j=1 :2: size(imMaior,2)
    y+=1;
    imMaior(i,j,:) = im(x,y,:);
  end
  y=0;
end

imMaior = double(imMaior);

for i=1 :2: size(imMaior,1)-2
  for j=1 :2: size(imMaior,2)-2
    imMaior(i+1,j,:) = (imMaior(i,j,:) + imMaior(i+2,j,:)) / 2;
    imMaior(i+1,j+1,:) = (imMaior(i,j,:) + imMaior(i+2,j+2,:) + imMaior(i+2,j,:) + imMaior(i,j+2,:)) / 4;
    imMaior(i,j+1,:) = (imMaior(i,j,:) + imMaior(i,j+2,:)) / 2;
  end
end

for j=2 :2: size(imMaior, 2)-1
  imMaior(size(imMaior,1)-1, j, :) = (imMaior(size(imMaior,1)-1, j-1, :) + imMaior(size(imMaior,1)-1, j+1, :))/2;
  imMaior(size(imMaior,1), j, :) = imMaior(size(imMaior,1)-1, j, :);
  imMaior(size(imMaior,1), j-1, :) = imMaior(size(imMaior,1)-1, j-1, :);
end

for i=1 :2: size(imMaior, 1)
  imMaior(i, size(imMaior,2)-1, :) = (imMaior(i, size(imMaior,2)-1, :) + imMaior(size(imMaior,1)-1, j+1, :))/2;
end

imMaior = uint8(imMaior);

imshow(imMaior)
