ii = i; clear i;
I = imread('cameraman.tif');
I = double(I);
[x,y] = gradient(I);
z = abs(x + y*i);
Z = 255 * z / max(max(z));
imshow(255 - uint8(Z))
i = ii; clear ii;