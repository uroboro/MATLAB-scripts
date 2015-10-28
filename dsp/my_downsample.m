% Downsample signal
function [ newX, newTime ] = my_downsample( x, L )
	N = length(x);
	newTime = 1 : L : N;
	newX = x(newTime);
end
