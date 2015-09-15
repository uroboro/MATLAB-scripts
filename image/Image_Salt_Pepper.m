%IMAGE_SIMULATEQUANTIFICATIONERROR Simulates quantification error on an image
% Usage:
%       image = Image_SimulateQuantificationError(imgSource, colorDepth);
function [ output_args ] = Image_Salt_Pepper( image, pointCount )
	tmp = double(image);
	[rows, cols] = size(image);
	
	points = floor(rand(pointCount, 2) * [rows-2, 0; 0, cols-2]) + 1;
	
	for i = 1:pointCount
		par = points(i,:);
		sp = 255 * (rand > 0.5);
		tmp(par(1), par(2)) = sp;
		tmp(par(1)+1, par(2)) = sp;
		tmp(par(1)-1, par(2)) = sp;
		tmp(par(1), par(2)+1) = sp;
		tmp(par(1), par(2)-1) = sp;
	end

	output_args = uint8(tmp);
end
