% Ventana Flat-top
function [ W ] = window_Flat_top(N)
	n = transpose(0:N-1);
	a0 = 1;
	a1 = 1.93;
	a2 = 1.29;
	a3 = 0.388;
	a4 = 0.032;
	W = a0 - a1 * cos(2 * pi * n / (N - 1)) + a2 * cos(4 * pi * n / (N - 1)) - a3 * cos(6 * pi * n / (N - 1)) + a4 * cos(8 * pi * n / (N - 1));
end