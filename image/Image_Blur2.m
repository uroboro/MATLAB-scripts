%IMAGE_BLUR Summary of this function goes here
%   Detailed explanation goes here
function [ output_args ] = Image_Blur( image, blurRadius )
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

	kernel = uint16(ones(blurRadius));
	for x = 1+halfSize:rows-halfSize
		for y = 1+halfSize:cols-halfSize
			p = image(x + (-halfSize:halfSize), y + (-halfSize:halfSize));
			tmp(x, y) = sum(sum(kernel .* p)) / blurRadius^2;
		end
	end
	
	output_args = uint8(tmp);
end
