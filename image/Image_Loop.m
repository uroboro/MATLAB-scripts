%IMAGE_LOOP  Loop over the pixels of an image with a function.
% Usage:
%       image = Image_Loop(imgSource, function);
%       image = Image_Loop(imgSource, function, step);
%       image = Image_Loop(imgSource, function, stepX, stepY);
function [ output_args ] = Image_Loop( image, f, varargin )
	tmp = uint16(image);
	[rows, cols] = size(image);
	defaults = [1, 1];
	for i = 1:length(varargin)
		defaults(i) = varargin{i};
	end
	stepX = defaults(1);
	if (length(varargin) == 1)
		stepY = stepX;
	else
		stepY = defaults(2);
	end

	for x = 1:stepX:rows
		for y = 1:stepY:cols
			tmp(x, y) = feval(f, image, x, y);
		end
	end

	output_args = uint8(tmp);
end

