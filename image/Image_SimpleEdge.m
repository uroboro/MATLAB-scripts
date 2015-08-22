%IMAGE_SIMPLEEDGE Summary of this function goes here
%   Detailed explanation goes here
function [ output_args ] = Image_SimpleEdge( image )
	tmp = int16(image);
%	tmp = double(image);
	[rows, cols] = size(image);

	for x = 1:1:rows
		for y = 1:1:cols
			a = tmp(x, y);

			% Up pixel
			if (x+1 < rows)
				u = tmp(x+1, y);
			else
				u = a;
			end
			% Down pixel
			if (x-1 > 1)
				d = tmp(x-1, y);
			else
				d = a;
			end
			% Right pixel
			if (y+1 < cols)
				r = tmp(x, y+1);
			else
				r = a;
			end
			% Left pixel
			if (y-1 > 1)
				l = tmp(x, y-1);
			else
				l = a;
			end
			p = bitor((a-r),(a-u));
% 			p = sqrt((a-r)^2+(a-l)^2+(a-u)^2+(a-d)^2);
% 			p = norm(a-r)+norm(a-l)+norm(a-u)+norm(a-d);
			if (p > 255)
				p = 255;
			end
			if (p < 0)
				p = 0;
			end
			tmp(x, y) = p;
		end
	end

	output_args = uint8(tmp);
end
