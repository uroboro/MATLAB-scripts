% Periodogram power spectral density estimate
function [ output_args ] = my_periodogram(x, n1, n2)
	x = x(:);
	if (nargin == 1)
		n1 = 1;
		n2 = length(x);
	end
	
	N = n2 - n1 + 1;

	output_args = abs(fft(x(n1:n2), 1024)) .^2 / N;
	output_args(1) = output_args(2);
end
