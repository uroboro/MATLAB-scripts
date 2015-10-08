% Ventana triangular
function [ W ] = window_Triangular(N)
	n = transpose(0:N-1);
	W = 1 - abs(2 * n / (N + 1) - (N - 1) / (N + 1));
end
