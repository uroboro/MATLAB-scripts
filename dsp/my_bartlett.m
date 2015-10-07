% Bartlett periodogram
function [ output_args ] = my_bartlett(x, nsect)
	L = floor(length(x) / nsect);
	output_args = 0;
	for i = 0:nsect-1
		output_args = output_args + my_periodogram(x(i*L+1:(i+1)*L+1)) / nsect;
	end
end
