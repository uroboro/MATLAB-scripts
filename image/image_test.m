I = imread('pout.tif');

figure(1); i = 1;
displayRows = 2;
displayCols = 3;

subplot(displayRows, displayCols, i); i = i + 1;
title('Original');
imshow(I);

I2 = Image_SimulateSamplingError(I, 4);
subplot(displayRows, displayCols, i); i = i + 1;
title('Sampling Error');
imshow(I2);

I3 = Image_SimulateQuantificationError(I, 2);
subplot(displayRows, displayCols, i); i = i + 1;
title('Quantification Error');
imshow(I3);

I4 = Image_SimulateQuantificationError(I2, 4);
subplot(displayRows, displayCols, i); i = i + 1;
title('Sampling+Quantification Error');
imshow(I4);

I5 = Image_SimpleEdge(I4);
subplot(displayRows, displayCols, i); i = i + 1;
title('SimpleEdge');
imshow(I5);

subplot(displayRows, displayCols, i); i = i + 1;
title('Invert SimpleEdge');
imshow(histeq(Image_Invert(I5)));