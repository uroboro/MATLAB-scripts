%TESTBENCH5 Periodogram basico
function [ output_args ] = testbench6( varargin )
	defaults = [9, 4];
	for i = 1:length(varargin)
		% copio los argumentos que existen.
		defaults(i) = varargin{i};
	end
	var = defaults(1);
	K = defaults(2);
	tic;

	R = 1000; % Realizaciones
	N = 100; % Muestras
	L = floor(N / K);
	

	x = sqrt(var) * randn(N, R);
	
	%y = zeros(K,L,R);

	Y(:,:) = x(1:K,1:L);
	
	%plot(x);
	X = 1 / N * (abs(fft(x))).^2;
	X_ = mean(X, 2);
	plot(X_);

	toc
	output_args = mean(X_);
end
