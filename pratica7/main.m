clear all
close all

im = imread('space_invaders.png');
imResul = zeros(size(im), 'uint8');
imshow(im)

regiao = 1;

matrizErros = [0, 0, 0];

for i=2 : size(im,1)
  for j=2 : size(im,2)
    if im(i,j)
      if (im(i-1,j) && im(i,j-1)) && (imResul(i-1,j) != imResul(i,j-1))
        matrizErros = [matrizErros; i, j , min(imResul(i-1,j), imResul(i,j-1))];
      end
      if im(i-1,j)
        imResul(i,j) = imResul(i-1, j);
      elseif im(i,j-1)
        imResul(i,j) = imResul(i, j-1);
      else
        imResul(i,j) = regiao;
        regiao++;
      end
    end
  end
end

for i=2 : size(matrizErros,1)
  imResul(matrizErros(i,1), matrizErros(i,2)) = matrizErros(i,3);
end

figure('name', 'figura 2')
imshow(imResul, [0, regiao])
