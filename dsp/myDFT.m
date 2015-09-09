% DFT vectorial
% Usage:
%	[ coeficientes, frecuencias ] = myDFT(señal)
%	[ coeficientes, frecuencias ] = myDFT(señal, normalizar)
%
% * Con normalizar=1, el vector de coeficientes es la mitad del total y su
% amplitud se normaliza a 1.
function [ X, F ] = myDFT( x, varargin )
	defaults = [0];
	for i = 1:length(varargin)
		% copio los argumentos que existen.
		defaults(i) = varargin{i};
	end
	normalize = defaults(1);

	N = length(x);
	n = 0:N - 1;
	X = zeros(N, 1);
	F = zeros(N, 1);
	for i = n
		X(i+1) = x.' * exp(1i * 2 * pi * n.' / N * i);
		F(i+1) = i;
	end
	
	if (normalize == 1)
		X = 2/N * X(1:floor((N - 1) / 2) + 1);
		F = F(1:floor((N - 1) / 2) + 1);
	end
end
