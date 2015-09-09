%IMAGE_SIMULATEQUANTIFICATIONERROR Simulates quantification error on an image
% Usage:
%       image = Image_SimulateQuantificationError(imgSource, colorDepth);
function [ output_args ] = Image_SimulateQuantificationError( image, colorDepth )
	tmp = double(image);
	[rows, cols] = size(image);

	if (colorDepth > 8)
		error('Color depth cannot be more than 8.');
	end
	
	for x = 1:1:rows
		for y = 1:1:cols
			a = tmp(x, y);
			% tmp(x, y) = a - mod(a, 2^(8-colorDepth)) - 1;
			tmp(x, y) = 2^8 / (2^colorDepth - 1) * floor(a * 2^(colorDepth - 8));
			% tmp(x, y) = a * (2^colorDepth + 1) / 2^(8 - colorDepth);
		end
	end

	output_args = uint8(tmp);
end
