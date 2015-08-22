%IMAGE_SIMULATESAMPLINGERROR Simulates sampling error on an image
% Usage:
%       image = Image_SimulateSamplingError(imgSource, sampleSize);
function [ output_args ] = Image_SimulateSamplingError( image, sampleSize )
	tmp = uint16(image);
	[rows, cols] = size(image);

	for x = 1:sampleSize:rows
		for y = 1:sampleSize:cols
			
			sum = uint16(0);
			for ii = 0:sampleSize - 1
				for jj = 0:sampleSize - 1
					if (x + ii > rows)
						continue;
					end
					if (y + jj > cols)
						continue;
					end

					sum = sum + tmp(x + ii, y + jj);
				end
			end
			sum = sum / sampleSize ^ 2;

			for ii = 0:sampleSize - 1
				for jj = 0:sampleSize - 1
					if (x + ii > rows)
						continue;
					end
					if (y + jj > cols)
						continue;
					end
					tmp(x + ii, y + jj) = sum;
				end
			end
		end
	end

	output_args = uint8(tmp);
end
