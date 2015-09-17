%TESTBENCH5 Periodogram basico
function [ output_args ] = testbench5( varargin )
	defaults = [9];
	for i = 1:length(varargin)
		% copio los argumentos que existen.
		defaults(i) = varargin{i};
	end
	var = defaults(1);
	tic;

	R = 100; % Realizaciones
	N = [10e2,10e3,10e4,10e5]; % Muestras

	for n = 1:length(N)
		x = sqrt(var) * randn(N(n), R);
		%plot(x);
		X = 1 / N(n) * (abs(fft(x))).^2 - var;
		subplot(211);
		plot(X(:,1)); title('Periodogram');

		X_ = mean(X, 1);
		subplot(212);
		plot(X_); title({'Periodogram para ' num2str(R) ' repeticiones'});

		output_args(n) = mean(X_);
	end

	toc
end
