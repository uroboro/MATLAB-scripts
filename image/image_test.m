I = imread('pout.tif');
figure(1);
imshow(I);

I2 = sampling_error(I, 10);
figure(2);
imshow(I2);

I3 = cuantification_error(I, 255);
figure(3);
imshow(I3);

I4 = cuantification_error(I2, 255);

figure(4);
imshow(I4);


I5 = I4;
[f_, c_] = size(I5);
for ii = 1:1:f_ - mod(f_, 2)
	for jj = 1:1:c_ - mod(c_, 2) - 1
		a = I5(ii,jj);
		b = I5(ii,jj+1);
		c = I5(ii+1,jj);
		d = (a-b)+(a-c);
		if (d > 255)
			d = 255;
		end
		I5(ii,jj) = d;
	end
end

figure(5);
imshow(I5);
