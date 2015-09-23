%IMAGE_BLUR Summary of this function goes here
%   ExceptionType 0: Echo
%   ExceptionType 1: Mirror
%   ExceptionType 2: Toroid
function [ output_args ] = Image_Blur( image, blurRadius, varargin )
	defaults = [0];
	for i = 1:length(varargin)
		% copio los argumentos que existen.
		defaults(i) = varargin{i};
	end
	exceptionType = defaults(1);

	image = uint16(image);
	tmp = image;
	[rows, cols] = size(image);

	if (blurRadius < 1)
		error('Blur radius cannot be less than 1.');
	end
	if (blurRadius > 16)
		error('Blur radius cannot be more than 16.');
	end

	halfSize = int16(floor(blurRadius/2));

	kernel = uint16([0,1,2,1,0;1,3,5,3,1;2,5,9,5,2;1,3,5,3,1;0,1,2,1,0]);
	for x = 1:rows
		for y = 1:cols
			s = uint16(0);
			for ii = -halfSize:halfSize
				for jj = -halfSize:halfSize
					X = x + ii;
					Y = y + jj;
					p = Image_Pixel(image, X, Y, exceptionType);
					k = kernel(halfSize + ii + 1, halfSize + jj + 1);
					s = s + k * p;
				end
			end
			tmp(x, y) = double(s) / sum(sum(kernel));
		end
	end
	
	output_args = uint8(tmp);
end
