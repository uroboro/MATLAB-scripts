% Ventana Hann
function [ W ] = window_Hann(N)
	n = transpose(0:N-1);
	W = (1 - cos(2 * pi * n / (N - 1))) / 2;
end
