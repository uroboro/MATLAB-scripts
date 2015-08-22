%CUANTIFICATION_ERROR Summary of this function goes here
%   Detailed explanation goes here
function [ output_args ] = cuantification_error( image, steps )
	tmp = image;
	[f_, c_] = size(image);
	for ii = 1:1:f_ - mod(f_, 2)
		for jj = 1:1:c_ - mod(c_, 2)
			a = tmp(ii,jj);
			if (a < 128)
				tmp(ii,jj) = 0;
			else
				tmp(ii,jj) = 255;
			end
		end
	end
	output_args = tmp;
end

