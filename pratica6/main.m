clear all
close all

im = imread('mapa_menor.png');

imHsv = rgb2hsv(im);

matiz = imHsv(:,:,1);

escala = 239;
faixaUmHsv = 130;
faixaDoisHsv = 180;

faixaUm = faixaUmHsv / escala;
faixaDois = faixaDoisHsv / escala;

imLogica = zeros(size(matiz), 'logical');

for i=1 : size(matiz,1)
  for j=1 : size(matiz,2)
    imLogica(i,j) = matiz(i,j) > faixaUm && matiz(i,j) < faixaDois && imHsv(i,j,3) > 0.5;
  endfor
endfor

% Teste
% imHsv(:,:,2) = 1;
% imHsv(:,:,3) = 1;

im = hsv2rgb(imHsv);

imshow(imLogica)

tamanho = 0;
for i=1 : size(imLogica, 1)
  if(tamanho != 0)
    break
  end
  for j=1 : size(imLogica, 2)
    if(imLogica(i,j) == 1 && tamanho == 0)
    tamanho += 1;
      for k=i : size(im,1)-1
        if imLogica(k+1,j) == 1
          tamanho++;
        end
      end
    end
  end
end

tamanho
pixel = 10/tamanho;

primeiroPontoLinha = 0;
primeiroPontoColuna = 0;

for i=1 : size(im,1)
  for j=1 : size(im,2)
    if (imHsv(i,j,1) > 232/escala && imHsv(i,j,1) < 6/escala)
      primeiroPontoLinha = i
      primeiroPontoColuna = j
    end
  end
end
