%Fetches the pixel at (X,Y) given an exception when the pixel is out of
%bounds
% Exception types:
%	0: Echo   (Repeats closer row/column)
%	1: Mirror (Mirrors image at boundaries)
%	2: Toroid (Loops round the edges)
function [ output_args ] = Image_Pixel( image, X, Y, exceptionType )
	[rows, cols] = size(image);

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
	
	output_args = image(X,Y);
end

