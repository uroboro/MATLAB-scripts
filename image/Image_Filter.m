%IMAGE_Filter Summary of this function goes here
%   ExceptionType 0: Echo
%   ExceptionType 1: Mirror
%   ExceptionType 2: Toroid
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

	for x = 1:rows
		for y = 1:cols
			s = uint16(0);
			for ii = -kernelRadius:kernelRadius
				for jj = -kernelRadius:kernelRadius
					X = x + ii;
					Y = y + jj;
					switch (exceptionType)
					case 0 % Echo
						if (X < 1)
							X = 1;
						end
						if (X > rows)
							X = rows;
						end
						if (Y < 1)
							Y = 1;
						end
						if (Y > cols)
							Y = cols;
						end
	
					case 1 % Mirror
						if (X < 1)
							X = 1 - X;
						end
						if (X > rows)
							X = rows + 1 - (X - rows);
						end
						if (Y < 1)
							Y = 1 - Y;
						end
						if (Y > cols)
							Y = cols + 1 - (Y - cols);
						end

					case 3 % Toroid
						if (X < 1)
							X = rows + X;
						end
						if (X > rows)
							X = X - rows;
						end
						if (Y < 1)
							Y = cols + Y;
						end
						if (Y > cols)
							Y = Y - cols;
						end
					end

					p = image(X, Y);
					k = kernel(kernelRadius + ii + 1, kernelRadius + jj + 1);
					s = s + k * p;
				end
			end
			tmp(x, y) = double(s) / kernelSize^2;
		end
	end
	
	output_args = uint8(tmp);
end
