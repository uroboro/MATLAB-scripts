%IMHISTAC calculates the accumulated histogram for the intensity image and displays a plot of the histogram.
% Syntax
%
% [counts,binLocations] = imhistac(img)
function [ ha, x ] = imhistac( img )
	[h, x] = imhist(img);
	ha = h;
	for ii = 2:length(h)
		ha(ii) = h(ii) + ha(ii - 1);
	end
end

