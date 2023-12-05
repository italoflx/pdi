close all
clear all

im = imread('Imagem.png');

imMaiorListrada = zeros(size(im,1)*2,size(im,2)*2,3,'uint8');
imMaior = imMaiorListrada;

## Vizinhança mais próxima

x=0;
y=0;

for i=1 :2: size(imMaiorListrada,1)
  x+=1;
  for j=1 :2: size(imMaiorListrada,2)
    y+=1;
    imMaiorListrada(i,j,:) = im(x,y,:);
  end
  y=0;
end

figure('name', 'Listrada')
imshow(imMaiorListrada)

## Interpolação bilinear

x=0;
y=0;
imMaior = double(imMaior);
for i=1 : size(imMaior,1)
  x+=1;
  for j=1 : size(imMaior,2)
    y+=1;
    r = (im(x,y,1) + im(x+1,y,1) + im(x,y+1,1) + im(x+1,y+1,1)) / 4;
    g = (im(x,y,2) + im(x+1,y,2) + im(x,y+1,2) + im(x+1,y+1,2)) / 4;
    b = (im(x,y,3) + im(x+1,y,3) + im(x,y+1,3) + im(x+1,y+1,3)) / 4;
    imMaior(x,y,1) = r;
    imMaior(x,y,2) = g;
    imMaior(x,y,3) = b;
  end
  y=0;
end

figure('name', 'Imagem maior')
imshow(imMaior)
