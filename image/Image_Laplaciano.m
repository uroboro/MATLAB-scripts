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

	image = int16(image);
	tmp = image;
	[rows, cols] = size(image);

	if (blurRadius < 1)
		error('Blur radius cannot be less than 1.');
	end
	if (blurRadius > 16)
		error('Blur radius cannot be more than 16.');
	end

	halfSize = int16(floor(blurRadius/2));

	kernel = int16([0,0,-1,0,0;0,-1,-2,-1,0;-1,-2,16,-2,-1;0,-1,-2,-1,0;0,0,-1,0,0]);
	for x = 1:rows
		for y = 1:cols
			s = int16(0);
			for ii = -halfSize:halfSize
				for jj = -halfSize:halfSize
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
					k = kernel(halfSize + ii + 1, halfSize + jj + 1);
					s = s + k * p;
				end
			end
			tmp(x, y) = double(s);
		end
	end
	
	output_args = uint8(tmp);
end
