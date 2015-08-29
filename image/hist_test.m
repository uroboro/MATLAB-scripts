plotRows = 4;
plotCols = 3;
plotI = 1;

% imagen original
img = imread('pout.tif');
figure(1);
subplot(plotRows, plotCols, plotI); plotI = plotI + 1;
imshow(img);

% histograma
[h, x] = imhist(img);
subplot(plotRows, plotCols, plotI); plotI = plotI + 1;
stem(x, h);

% histograma acumulado
ha = imhistac(img);
subplot(plotRows, plotCols, plotI); plotI = plotI + 1;
stem(ha);

% imagen binaria
%img2 = Image_SimulateQuantificationError(img, 1);
% img2 = (uint8(floor(double(img)/128)))*255;
% subplot(plotRows, plotCols, plotI); plotI = plotI + 1;
% imshow(img2);

% imagen ecualizada
imgeq = histeq(img);
subplot(plotRows, plotCols, plotI); plotI = plotI + 1;
imshow(imgeq);

% histograma
[h, x] = imhist(imgeq);
subplot(plotRows, plotCols, plotI); plotI = plotI + 1;
stem(x, h);

% histograma acumulado
ha = imhistac(imgeq);
subplot(plotRows, plotCols, plotI); plotI = plotI + 1;
stem(ha);


% contraste
Max = max(max(img));
Min = min(min(img));
imgEq = (img - Min) * (255 / (Max-Min));
subplot(plotRows, plotCols, plotI); plotI = plotI + 1;
imshow(imgEq);

% histograma
[h, x] = imhist(imgEq);
subplot(plotRows, plotCols, plotI); plotI = plotI + 1;
stem(x, h);

% histograma acumulado
ha = imhist(imgEq);
subplot(plotRows, plotCols, plotI); plotI = plotI + 1;
stem(ha);


% ecualizacion de histograma
imgEqualized = imeqlin(img);
subplot(plotRows, plotCols, plotI); plotI = plotI + 1;
imshow(imgEqualized);

% histograma
[h, x] = imhist(imgEqualized);
subplot(plotRows, plotCols, plotI); plotI = plotI + 1;
stem(x, h);

% histograma acumulado
ha = imhistac(imgEqualized);
subplot(plotRows, plotCols, plotI); plotI = plotI + 1;
stem(ha);

