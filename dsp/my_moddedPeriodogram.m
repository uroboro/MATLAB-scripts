% Modified periodogram
function [ output_args ] = my_moddedPeriodogram(x, win, n1, n2)
	x = x(:);
	if (nargin == 2)
		n1 = 1;
		n2 = length(x);
	end
	
	N = n2 - n1 + 1;
	switch (win)
		case 1
			w = ones(N, 1);
		case 2
			w = hamming(N);
		case 3
			w = hanning(N);
		case 4
			w = bartlett(N);
		case 5
			w = blackman(N);
	end
	
	xw = x(n1:n2) .^w / norm(w);
	output_args = N * my_periodogram(xw);
end
