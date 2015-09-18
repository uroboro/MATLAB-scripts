function [ output_args ] = Image_Pixel( data, X, Y, rows, cols, exceptionType )
%IMAGE_PIXEL Summary of this function goes here
%   Detailed explanation goes here

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
	
	output_args = data(X,Y);
end

