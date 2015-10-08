% Ventana Blackman-Harris
function [ W ] = window_BlackmanHarris(N)
	n = transpose(0:N-1);
	a0 = 0.35875;
	a1 = 0.48829;
	a2 = 0.14128;
	a3 = 0.01168;
	W = a0 - a1 * cos(2 * pi * n / (N - 1)) + a2 * cos(4 * pi * n / (N - 1)) - a3 * cos(6 * pi * n / (N - 1));
end
