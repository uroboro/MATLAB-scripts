%SAMPLING_ERROR Summary of this function goes here
%   Detailed explanation goes here
function [ output_args ] = sampling_error( image, sampleSize )
	tmp = image;
	[f_, c_] = size(image);

	for x = 1:sampleSize:f_ - mod(f_, 2)
		for y = 1:sampleSize:c_ - mod(c_, 2)
			
			sum = uint16(0);
			for ii = 1:sampleSize
				for jj = 1:sampleSize
					if (x+ii > f_ - mod(f_, 2))
						continue;
					end
					if (y+jj > c_ - mod(c_, 2))
						continue;
					end
						
					sum = sum + uint16(tmp(x+ii, y+jj));
				end
			end
			sum = sum / sampleSize^2;

			for ii = 1:sampleSize
				for jj = 1:sampleSize
					tmp(x+ii,y+jj) = sum;
				end
			end
		end
	end

	output_args = tmp;
end
