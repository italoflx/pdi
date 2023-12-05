clear all
close all

im = imread('Imagem.png');

imMenor = zeros(size(im,1)/2, size(im,2)/2,3,'uint8');
% Subamostragem (downsampling) simples

%x=0;
%y=0;
%for i=1 :2: size(im,1)
%  x+=1;
%  for j=1 :2: size(im,2)
%    y+=1;
%    imMenor(x,y,1) = im(i,j,1);
%    imMenor(x,y,2) = im(i,j,2);
%    imMenor(x,y,3) = im(i,j,3);
%  end
%  y=1;
%end

% Interpolação média ponderada

x=0;
y=0;
imCalc = double(im);
for i=1 :2: size(im,1)
  x+=1;
  for j=1 :2: size(im,2)
    y+=1;
    r = (imCalc(i,j,1) + imCalc(i+1,j,1) + imCalc(i,j+1,1) + imCalc(i+1,j+1,1)) / 4;
    g = (imCalc(i,j,2) + imCalc(i+1,j,2) + imCalc(i,j+1,2) + imCalc(i+1,j+1,2)) / 4;
    b = (imCalc(i,j,3) + imCalc(i+1,j,3) + imCalc(i,j+1,3) + imCalc(i+1,j+1,3)) / 4;
    imMenor(x,y,1) = r;
    imMenor(x,y,2) = g;
    imMenor(x,y,3) = b;
  end
  y=0;
end

figure('name', 'Figura menor')
imshow(imMenor)
figure('name', 'Figura original')
imshow(im)
