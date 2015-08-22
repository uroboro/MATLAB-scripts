%IMAGE_INVERT Invert a grayscale image
%   Detailed explanation goes here
function [ output_args ] = Image_Invert( image )
	tmp = double(image);
% 	[rows, cols] = size(image);
% 
% 	for x = 1:1:rows
% 		for y = 1:1:cols
% 			tmp(x, y) = 255 - tmp(x, y);
% 		end
% 	end
	tmp = Image_Loop(tmp, @a);
	output_args = uint8(tmp);
end

function [ r ] = a(tmp, x, y)
	r = 255 - tmp(x, y);
end