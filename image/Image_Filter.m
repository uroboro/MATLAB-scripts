%IMAGE_Filter Summary of this function goes here
function [ output_args ] = Image_Filter( image, kernel, varargin )
	defaults = [0];
	for i = 1:length(varargin)
		% copio los argumentos que existen.
		defaults(i) = varargin{i};
	end
	exceptionType = defaults(1);

	image = uint16(image);
	tmp = image;
	[rows, cols] = size(image);

	[kernelSize, ~] = size(kernel);
	kernelRadius = int16(floor(kernelSize/2));

	Sum = sum(sum(kernel));
	
	for x = 1:rows
		for y = 1:cols
			s = uint16(0);
			for ii = -kernelRadius:kernelRadius
				for jj = -kernelRadius:kernelRadius
					X = x + ii;
					Y = y + jj;

					p = Image_Pixel(image, X, Y, exceptionType);
					k = kernel(kernelRadius + ii + 1, kernelRadius + jj + 1);
					s = s + k * p;
				end
			end
			if (Sum == 1 || Sum == 0)
				tmp(x, y) = double(s);
			else
				tmp(x, y) = double(s) / Sum;
			end
		end
	end
	
	output_args = uint8(tmp);
end
